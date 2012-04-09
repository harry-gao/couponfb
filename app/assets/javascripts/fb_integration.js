$(function() {
    var $dialog = $("#fb_login_dialog").dialog({
			autoOpen: false,
			title: 'Welcome to couponfb'
		});

	$('.apply_button').click(function() {
		$dialog.dialog('open');
		// prevent the default action, e.g., following a link
		return false;
	});

    $('#fb_log_out').click(function(){
       FB.logout();
    });
});

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
      $("#logged_in_panel").css('display', 'block');
      FB.api('/me', function(response) {
          $('#fb_user_name').html(response.name);
        });
      $("#not_logged_in_panel").css('display', 'none');
  }
  else{
      $("#logged_in_panel").css('display', 'none');
      $("#not_logged_in_panel").css('display', 'block');
  }
}

