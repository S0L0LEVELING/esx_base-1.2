

window.addEventListener('message', function(event){ 
    switch(event.data.action) { 
        case "open": 
            OpenNotify(event.data)
        break;
        case "close": 
            CloseNotify(event.data)
        break;
    }
});


function OpenNotify(data) {
    const k = (`<div class="notify-flex"><div><i style="color: white;" class="`+ data.icon + `"></i> </div><div><p style="font-size: 15px; color: white; font-family: 'KeepCalm';">`+ data.text+`</p> </div></div>`);
    $(".notify").css("background-color",data.color);
    $(".notify").append(k).fadeIn();
    $(".notify").animate({marginLeft: "1%"}, 500, function(){
    })
}


function CloseNotify() {
    $(".notify").animate({marginLeft: "-15%"}, 500, function(){
        $(".notify-flex").remove();
    })
}
