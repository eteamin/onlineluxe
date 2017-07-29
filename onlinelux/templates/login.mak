<%inherit file="local:templates.master"/>

<div class="container">
	<div class="login-container">
            <div id="output"></div>
            <div class="avatar"></div>
            <div class="form-box">
                <form action="" method="">
                    <input name="user" type="text" placeholder="نام کاربری">
                    <input type="password" name="password" placeholder="رمز عبور">
                    <button class="btn btn-info btn-block login" onclick="tryLogin()" type="button">ورود</button>
                    <button class="btn btn-success btn-block login" onclick="window.location = '${base_url}' + '/register'" type="button">هنوز ثبت نام نکرده اید؟</button>
                </form>
            </div>
        </div>
</div>

<script data-main="assets/js/index.js" src="${tg.url('/assets/libs/requirejs/require.js')}"></script>
<script>
    function tryLogin() {

        var textField = $("input[name=user]");
        var password = $("input[name=password]");

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