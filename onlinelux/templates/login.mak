<%inherit file="local:templates.master"/>

<div class="container">
	<div class="login-container">
            <div id="output"></div>
            <div class="avatar"></div>
            <div class="form-box">
                <form action="" method="">
                    <input name="login-page-name" type="text" placeholder="نام کاربری">
                    <input type="password" name="login-page-password" placeholder="رمز عبور">
                    <button class="btn btn-info btn-block login" onclick="tryLogin()" type="button">ورود</button>
                    <button type="button" onclick="window.location = 'https://t.me/onlineluxRegistrationBot'" class="btn btn-block login">ثبت نام آسان با تلگرام!</button>
                    <button class="btn btn-success btn-block login" onclick="window.location = '${base_url}' + '/register'" type="button">هنوز ثبت نام نکرده اید؟</button>
                </form>
            </div>
        </div>
</div>

<script data-main="assets/js/index.js" src="${tg.url('/assets/libs/requirejs/require.js')}"></script>
<script>
    function tryLogin() {

        var textField = $("input[name=login-page-name]");
        var password = $("input[name=login-page-password]");

        if (textField.val() != "" && password.val() != "") {
            $.ajax({
               url : '${base_url}' + '/login_handler?login=' + textField.val() + '&password=' + password.val(),
               type : 'GET',
               processData: false,
               contentType: false,
               success : function(resp) {
                    if (resp == 'True') {
                        window.location = '${base_url}' + '${came_from}'
                    }
                    else {
                         $("#output").removeClass(' alert alert-success');
                         $("#output").addClass("alert alert-danger animated fadeInUp").html("نام کاربری و یا رمز عبور اشتباه است");
                    }
                }
            });

        } else {
            $("#output").removeClass(' alert alert-success');
            $("#output").addClass("alert alert-danger animated fadeInUp").html("نام کاربری و رمز عبور را وارد کنید");
        }


    }

</script>