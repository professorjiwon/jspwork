function inputIdChk() {
	frm.idBtnCheck.value = "idUncheck";
}
function idCheck(id) {
	if(id == "") {
		alert("아이디를 입력하세요");
		frm.id.focus();
		return;
	}
	frm.idBtnCheck.value = "idCheck";
	url = "idCheck.jsp?id=" + id;
	window.open(url, "IDCheck", "width=300, height=150");
}
function inputCheck() {
	if(frm.idBtnCheck.value != "idCheck") {
		alert("아이디 중복버튼을 눌러 주세요");
		return;
	}
	if(frm.pwd.value == "") {
		alert("비밀번호를 입력하세요");
		frm.pwd.focus();
		return;
	}
	if(frm.pwd.value != frm.repwd.value) {
		alert("비밀번호가 다릅니다 다시 입력하세요");
		frm.repwd.focus();
		return;
	}
	if(frm.name.value == "") {
		alert("이름 입력하세요");
		frm.name.focus();
		return;
	}
	frm.submit();
}








