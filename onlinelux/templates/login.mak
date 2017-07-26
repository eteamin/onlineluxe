<%inherit file="local:templates.master"/>

<div class="modal fade" id="modaLogin" tabindex="-1" role="dialog" aria-labelledby="modaLogin">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-body">
                <div class="modal-body-head">
                        <i style="cursor:pointer; margin-right: 120%;font-size:35px;" class="icon icon-cancel-circle" data-dismiss="modal"></i>

                    <div class="head--icon">
                        <i class="icon icon-in-alt"></i>
                    </div>
                    <h4>ورود به حساب کاربری</h4>
                </div>
                <div class="modal-body-login has-feedback">
                    <form id="loginForm" method="post">
                        <h6 id="login-error" style="color:#a94442; display:none;">نام کاربری و یا رمز عبور اشتباه است</h6>
                        <div class="form-group has-feedback" style="width: 75%;">
                            <label for="" style="font-size: 13px;">نام کاربری</label>
                            <input id="username" type="text" class="form-control" name="username" placeholder="">
                        </div>
                        <div class="form-group has-feedback" style="width: 75%;">
                            <label for="" style="font-size: 13px;">رمز عبور:</label>
                            <input id="password" type="password" class="form-control" name="password" placeholder="">
                        </div>
                        <button type="submit">ورود</button>
                    </form>
                </div>
            </div>
            <div class="modal-footer">
                <a href="#" class="btn-register" data-dismiss="modal" data-toggle="modal" data-target="#modaRegister">هنوز عضو سایت نیستید؟ ثبت نام</a>
            </div>
        </div>
    </div>
</div>