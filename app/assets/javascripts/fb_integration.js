$(function() {
    $login_dialog = $("#fb_login_dialog").dialog({
			autoOpen: false,
			title: 'Welcome to couponfb'
		});

	$('.apply_button').click(function(eventObject) {
        $current_apply_item = eventObject.currentTarget;

        if(!g_fb_connected)
        {
		    $login_dialog.dialog('open');
        }
        else
        {
            postToFeed();
        }
		return false;
	});

    $('#fb_log_out').click(function(){
       FB.logout();
    });
});

var g_fb_connected = false;
var $login_dialog;
var $current_apply_item;


(function(d){
    var js, id = 'facebook-jssdk'; if (d.getElementById(id)) {return;}
    js = d.createElement('script'); js.id = id; js.async = true;
    js.src = "//connect.facebook.net/en_US/all.js";
    d.getElementsByTagName('head')[0].appendChild(js);
}(document));

window.fbAsyncInit = function() {
    FB.init({
    appId      : '207038556072765',
    status     : false,
    cookie     : true,
    xfbml      : true,
    oauth      : true
    });

    FB.getLoginStatus(function(response) {connectionStatusChanged(response)});

    FB.Event.subscribe('auth.statusChange', function(response) {connectionStatusChanged(response)});
};


function connectionStatusChanged(response)
{
  if(response.status=="connected"){
      g_fb_connected = true;
      $("#logged_in_panel").css('display', 'block');
      FB.api('/me', function(response) {
          $('#fb_user_name').html(response.name);
        });
      $("#not_logged_in_panel").css('display', 'none');

      if($login_dialog.dialog( "isOpen" )){
          $login_dialog.dialog('close');
          postToFeed();
      }
  }
  else{
      g_fb_connected = false;
      $("#logged_in_panel").css('display', 'none');
      $("#not_logged_in_panel").css('display', 'block');
  }
}

function postToFeed()
{
    var obj = {
      method: 'feed',
      link: $current_apply_item.dataset.link,
      picture: $current_apply_item.dataset.pic,
      name: $current_apply_item.dataset.title,
      caption: $current_apply_item.dataset.ad
    };

    function callback(response) {
        if(response && response['post_id']){
            alert('thank you, code is 1234');
        }
        else
        {
            alert('sorry you have to share the information to get the code');
        }
    }

    FB.ui(obj, callback);
}

