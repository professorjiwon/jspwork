$(() => {
    let x = $('#imgslide>img');
    let y = 3;
    setInterval(function() {
        y--;
        if(y == 0) {
            x.fadeIn();
            y=3;
        } else {
            x.eq(y).fadeOut();
        }
    }, 2000);
})