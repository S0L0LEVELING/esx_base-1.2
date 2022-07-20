window.addEventListener('message', function (event) {
    switch(event.data.action) {
        case 'show':
            ShowNotif(event.data);
            break;
        case 'value':
            change(event.data.NotifyData.content);
            break;
		case 'resetalert':
            reset(event.data.NotifyData.timeout);
            break;
        case 'note':
            noteshow(event.data.NotifyData.title, event.data.NotifyData.content, event.data.NotifyData.icon, event.data.NotifyData.timeout, event.data.NotifyData.color);
            break;
        case 'Notification':
            notify(event.data.NotifyData.title, event.data.NotifyData.content, event.data.NotifyData.icon, event.data.NotifyData.timeout, event.data.NotifyData.color);
            break;
    }
});

change = function(content) {
	$(".screen-notification-content").text(content);
}

reset = function(timeout) {
    NotificationTimeout = setTimeout(function(){
        $(".screen-notifications-container").animate({
            right: -35+"vh",
        }, 200, function(){
            $(".screen-notifications-container").css({'display':'none'});
        });
        NotificationTimeout = null;
    });
}

function ShowNotif(data) {
    var $notification = $('.notification.template').clone();
    $notification.removeClass('template');
    $notification.addClass(data.type);
    $notification.html(data.text);
    $notification.fadeIn();
    $('.notif-container').append($notification);
    setTimeout(function() {
        $.when($notification.fadeOut()).done(function() {
            $notification.remove()
        });
    }, data.length != null ? data.length : 2500);
}

var NotificationTimeout = null;

notify = function(title, content, icon, timeout, color) {
    if (color != null && color != undefined) {
        $(".screen-notifications-container").css({"background-color":color});
    }
    $(".screen-notification-icon").html('<i class="'+icon+'"></i>');
    $(".screen-notification-title").text(title);
    $(".screen-notification-content").text(content);
    $(".screen-notifications-container").css({'display':'block'}).animate({
        right: 5+"vh",
    }, 200);
    NotificationTimeout = setTimeout(function(){
        $(".screen-notifications-container").animate({
            right: -35+"vh",
        }, 200, function(){
            $(".screen-notifications-container").css({'display':'none'});
        });
        if (NotificationTimeout != null) {
            clearTimeout(NotificationTimeout);
        }
    
        NotificationTimeout = setTimeout(function(){
            $(".screen-notifications-container").animate({
                right: -35+"vh",
            }, 200, function(){
                $(".screen-notifications-container").css({'display':'none'});
            });
            NotificationTimeout = null;
        }, timeout);
        
    }, timeout);
}

noteshow = function(title, content, icon, timeout, color) {
    if (color != null && color != undefined) {
        $(".screen-notifications-container").css({"background-color":color});
    }
    $(".screen-notification-icon").html('<i class="'+icon+'"></i>');
    $(".screen-notification-title").text(title);
    $(".screen-notification-content").text(content);
    $(".screen-notifications-container").css({'display':'block'}).animate({
        right: 5+"vh",
    }, 200);
}
