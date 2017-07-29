<%inherit file="local:templates.master"/>

<div class="container">
	<div class="login-container">
            <div id="output"></div>
            <div class="avatar"></div>
            <div class="form-box">
                <form action="" method="">
                    <input name="page_username" type="text" placeholder="نام کاربری">
                    <input type="password" name="page_password" placeholder="رمز عبور">
                    <input type="password" name="page_confirmPassword" placeholder="تکرار رمز عبور">
                    <button class="btn btn-info btn-block login" onclick="tryRegister()" type="button">ثبت نام</button>
                    <button class="btn btn-success btn-block login" onclick="window.location = '${base_url}' + '/login'" type="button">قبلا ثبت نام کرده اید؟</button>
                </form>
            </div>
        </div>
</div>

<script data-main="assets/js/index.js" src="${tg.url('/assets/libs/requirejs/require.js')}"></script>
<script>
    function tryRegister() {
        var textField = $("input[name=page_username]");
        var password = $("input[name=page_password]");
        var confirmPassword = $("input[name=page_confirmPassword]");

        if (textField.val() != "" && password.val() != "" && confirmPassword.val() != "" && password.val() == confirmPassword.val()) {
            var formData = new FormData();
	        formData.append('username', textField.val());
	        formData.append('password', password.val());
            $.ajax({
               url : base_url + '/register_handler',
               type : 'POST',
               data : formData,
               processData: false,
               contentType: false,
               success : function(resp) {
                    if (resp.ok) {
                        $.ajax({
                           url : base_url + '/login_handler?login=' + textField.val() + '&password=' + password.val(),
                           type : 'GET',
                           processData: false,
                           contentType: false,
                           success : function(resp) {
                                window.location = '${base_url}';
                            }
                        });
                    }
                    else {
                         $("#output").removeClass(' alert alert-success');
                         $("#output").addClass("alert alert-danger animated fadeInUp").html("نام کاربری قبلا ثبت شده است");
                    }
                }
            });

        } else {
            $("#output").removeClass(' alert alert-success');
            $("#output").addClass("alert alert-danger animated fadeInUp").html("نام کاربری و رمز عبور و تکرار رمز عبور را بدرستی وارد کنید");
        }
    }

</script>