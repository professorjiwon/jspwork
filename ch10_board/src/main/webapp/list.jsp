<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*, board.*" %>
<jsp:useBean id="bDao" class="board.BoardDao" />
<%
	request.setCharacterEncoding("UTF-8");
	int totalRecord = 0;	// 전체 레코드 수(board테이블의 전체 행의 수)
	int numPerPage = 10;	// 1page에 보여줄 레코드 수
	int pagePerBlock = 5;	// 블록당 페이지 수 = [1][2][3][4][5] 
			
	int totalPage = 0;		// 전체 페이지 : 레코드수 67개라면, totalPage=7  [1][2][3][4][5][6][7]
	int totalBlock = 0;		// 전체 블록 수 : 레코드수 67개라면, totalBlock=2
	
	int nowPage = 1;		// 현재 해당하는 페이지
	int nowBlock = 1;		// 현재 해당하는 블록
	
	int start = 0;			// board테이블의 select시 시작번호(한페이지에 필요한 만큼 게시물만 가져오려고)
	int end = 0;			// 1page에 보여줄 레코드의 갯수(보통은 10개, 맨 마지막page는 전체레코드수에 따라 달라짐)
	int listSize = 0;		// 현재 읽어온 게시물의 수
	
	String keyField = "", keyWord = "";
	if(request.getParameter("keyWord") != null) {
		keyField = request.getParameter("keyField");
		keyWord = request.getParameter("keyWord");
	}
	
	/* [처음으로]를 누르면 keyField와 keyWord에 들어있는값 지우기 */
	if(request.getParameter("reload") != null) {
		if(request.getParameter("reload").equals("true")){
			keyField = "";
			keyWord = "";
		}
	}
	
	if(request.getParameter("nowPage") != null) {
		nowPage = Integer.parseInt(request.getParameter("nowPage"));
	}
	
	start = (nowPage * numPerPage) - numPerPage + 1;  // 각 페이지당 시작번호
	end = nowPage * numPerPage;							// 각 페이지당 끝나는 번호
	totalRecord = bDao.getTotalCount(keyField, keyWord);
	totalPage = (int)Math.ceil((double)totalRecord / numPerPage);	// 전체 페이지 수
	nowBlock = (int)Math.ceil((double)nowPage / pagePerBlock);		// 현재 속한 블럭
	totalBlock = (int)Math.ceil((double)totalPage / pagePerBlock);	// 전체 블럭 계산
%>  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시판</title>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" ></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
<style>
	* {margin: 0 auto;}
	div {width:800px;}
	h2, .cen{text-align:center; }
	.m50 {margin-top:50px;}
	table {margin-top: 30px; width:800px;}
	table th, table td {text-align:center;}
	/* .a {text-decoration:none; color:black; cursor:pointer;} */
	a:link {text-decoration:none; color:rgb(53, 53, 53);}
	a:hover {text-decoration:underline; color:coral; cursor:pointer;}
	a:visited {text-decoration:none; color:black;}
</style>
<script>
	function block(value) {
		document.readFrm.nowPage.value=<%=pagePerBlock%>*(value-1)+1;
		document.readFrm.submit();
	}
	function pageing(page) {
		document.readFrm.nowPage.value=page;
		document.readFrm.submit();
	}
	function list() {
		/*  document.listFrm.action = "list.jsp"; */
		document.listFrm.submit();
	}
	function read(num) {
		document.readFrm.num.value=num;
		document.readFrm.action="read.jsp";
		document.readFrm.submit();
	}
</script>
</head>
<body>
	<div>
		<h2 class="m50">JSPBoard</h2><p/>
		<table class="table">
			<tr>
				<td colspan="5" style="text-align:left;">Total : <%=totalRecord %>Articles <font color="red">(<%=nowPage %>/<%=totalPage %>)</font></td>
			</tr>		
			<tr>
				<th width="10%">번호</th>
				<th width="40%">제목</th>
				<th width="15%">이름</th>
				<th width="25%">날짜</th>
				<th width="10%">조회수</th>
			</tr>
			<%
			ArrayList<Board> alist = bDao.getBoardList(keyField,keyWord,start,end);
			listSize = alist.size();
		
			for(int i=0; i<listSize; i++) {
				Board board = alist.get(i);
				String rdate = board.getRegdate().substring(0,10);
				int depth = board.getDepth();
		%>
			<tr>
				<%-- <td><%=board.getNum() %></td> --%>
				<td>
					<%=totalRecord-(nowPage-1)*numPerPage - i %>
				</td>
				<td style="text-align:left;">
		<%
					if(depth > 0) {
						for(int j=0; j<depth; j++) {
							out.print("&emsp;");
						}
						out.print("↳");
					}
		%>
					<a href="javascript:read('<%=board.getNum() %>')" class="a"><%=board.getSubject() %></a>
				</td>
				<td><%=board.getName() %></td>
				<td><%=rdate %></td>
				<td><%=board.getCount() %></td>
			</tr>
		<%		
			}
		%>
		
			<tr>
				<td colspan="5" style="border:none;"><br></td>
			</tr>
	
			<tr>
				<td colspan="3">
			<%
				int pageStart = (nowBlock-1) * pagePerBlock + 1;   // 어디블록 속하는지에 따른 첫번째 페이지 1블록=1, 2블록=6, 3블럭=11
				int pageEnd	= pageStart + pagePerBlock <= totalPage	? (pageStart + pagePerBlock) : totalPage + 1;	// 어디블록 속하는지에 따른 마지막 페이지  1블럭=5, 2블럭=10, 3블럭=15
			
				if(totalPage != 0) {
					if(nowBlock > 1) {
			%>
						<a href="javascript:block('<%=nowBlock-1 %>')">prev...</a>&emsp;
			<%
					}
					for(; pageStart<pageEnd; pageStart++) {
			%>
						<a href="javascript:pageing('<%=pageStart %>')" class="a">[<%=pageStart %>]</a>
			<%			
					}
					if(totalBlock > nowBlock) {
			%>
						<a href="javascript:block('<%=nowBlock+1 %>')">...next</a>&emsp;
			<%			
					}
				}
			
			%>
				</td>
				<td colspan="2" style="text-align:right;">
					<a href="" class="a">[글쓰기]</a>&emsp;
					<a href="javascript:list();" class="a">[처음으로]</a>
				</td>
			</tr>
		</table>
		<form name="searchFrm" method="get" action="list.jsp">
			<table align="center" width="700">
				<tr>
					<td align="center">
						<select name="keyField">
							<option value="name">이름</option>
							<option value="subject">제목</option>
							<option value="content">내용</option>
						</select>
						<input name="keyWord" required>
						<input type="submit" value="찾기">
					</td>
				</tr>
			</table>
		</form>
		
		<!-- 처음으로 누르면 화면 reload -->
		<form name="listFrm">
			<input type="hidden" name="reload" value="true">
			<input type="hidden" name="nowPage" value="1">
		</form>
		
		<!-- 사용자가 만약 [2]를 누르면 2번째 페이지 보여주기 -->
		<form name="readFrm">
			<input type="hidden" name="num">
			<input type="hidden" name="nowPage" value="<%=nowPage %>">
			<input type="hidden" name="keyField" value="<%=keyField %>">
			<input type="hidden" name="keyWord" value="<%=keyWord %>">
		</form>
	</div>
</body>
</html>