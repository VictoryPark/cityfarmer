function even() {
    $(".memo").each(function () {
        var tg = $(this)
        var contents = tg.find(".memoContents")

        tg.mouseup(function () {
            var top = tg.offset().top;
            var left = tg.offset().left;
            console.log("Top : " + top, "Left : " + left)
        })
        tg.find(".mini").click(function () {
            if ($(this).hasClass("on")) {
                $(this).removeClass("on")
                tg.animate({ "height": "250px" }, 1000)
            } else {
                $(this).addClass("on")
                tg.animate({ "height": "31px" }, 1000)
            }
        })
        tg.find(".pick").click(function () {
            if ($(this).hasClass("on")) {
                $(this).removeClass("on")
                tg.draggable({ disabled: false })
            } else {
                $(this).addClass("on")
                tg.draggable({ disabled: true })
            }
        })
        tg.find(".delete").click(function () {
            tg.remove()
        })
         tg.find(".move").click(function () {
            location.href="";
        })
    })
}
var mCtn = 0;
$("#addMemo").click(function () {
    $(".memo").removeClass("new")
    mCtn++;
    $.notify(
        "메모가 생성되었습니다",
        {position: "top center", autoHideDelay: 2000, 
             // show animation
              showAnimation: 'fadeIn',
              // show animation duration
              showDuration: 1000,
              // hide animation
              hideAnimation: 'fadeOut',
              // hide animation duration
              hideDuration: 500
        }
    );
    var bg;
    if ($("#color").val() == "#000000") {
        bg = "#FFF2AB"
    } else {
        bg = $("#color").val()
    }
    console.log(bg)

    var memo = $("<div/>", {
        "class": "memo memo"+mCtn,
        "style": "background:" + bg + ";",
        html: `<div class="memoHead">
    <ul class="btnBox">
        <li class="mini"><a href="#"><i class="fas fa-angle-down"></i></a></li>
        <li class="move"><a href="#"><i class="fas fa-move"></i></a></li>
        <li class="pick"><a href="#"><i class="fas fa-thumbtack"></i></a></li>
        <li class="delete"><a href="#"><i class="fas fa-trash-alt"></i></a></li>
        
    </ul>
</div>
<div class="memoContents">
    <textarea name="memoContents" id="memoContents"></textarea>

</div>`
    }).prependTo("body")
    $(".memo").draggable();
    $(".memo"+mCtn).addClass("new")
    even()


})