var base_url = window.origin;
requirejs.config({
    "baseUrl": base_url + "/assets/js",
    paths: {
        "jquery": "../libs/jquery/dist/jquery",
        "bootstrap": "../libs/bootstrap/dist/js/bootstrap.min"
    },
    shim: {
        "bootstrap": {
            deps: ["jquery"],
            exports: '$'
        }

    },
 enforceDefine: true
});

define([
    "bootstrap",
], function(
    bootstrap
) {
    (function($) {

      $('.navbar-category').each(function(){

         var self =  $(this),
             btnOpen = $('.navbar-main_toggle-menu'),
             btnClose = $('.navbar-main_toggle-menu-close');

         btnOpen.on('click', function(){
            self.addClass('open');
            $('.navbar-category--lvl1').addClass('show-item');
            $('.navbar-category--lvl2 .navbar-lvl2 ul').addClass('show-item-1');
            $('.navbar-category--lvl3 .container').addClass('show-item-2');
         });

         btnClose.on('click', function(){
            self.removeClass('open');
            $('.navbar-category--lvl1').removeClass('show-item');
            $('.navbar-category--lvl2 .navbar-lvl2 ul').removeClass('show-item-1');
            $('.navbar-category--lvl3 .container').removeClass('show-item-2');
         });

         $('.navbar-category--lvl1 ul li').on('click', function(){
            $('.navbar-category--lvl2 .navbar-lvl2 ul').removeClass('show-item-1');
            $('.navbar-category--lvl3 .container').removeClass('show-item-2');
         });

      });

      $('.navbar-nav > li').has('ul').addClass('is-megamenu');

    })(jQuery);

    var loginValidator = $("#loginForm").bootstrapValidator({
		feedbackIcons: {
			valid: "glyphicon glyphicon-ok",
			invalid: "glyphicon glyphicon-remove",
			validating: "glyphicon glyphicon-refresh"
		},
		fields: {
			username: {
				message: "نام کاربری را وارد کنید.",
				validators: {
					notEmpty: {
						message: "نام کاربری را وارد کنید."
					}
				}
			},
			password: {
				message: "رمز عبور را وارد کنید.",
				validators: {
					notEmpty: {
						message: "رمز عبور را وارد کنید."
					}
				}
			}
		}
	});
        loginValidator.on("success.form.bv", function (e) {
            var loginError = $('#login-error');
            loginError.css("display", "none");
            e.preventDefault();
            var username = $('#username').val();
            var password = $('#password').val();
            var base_url = window.location.origin;
            $.ajax({
               url : base_url + '/login_handler?login=' + username + '&password=' + password,
               type : 'GET',
               processData: false,
               contentType: false,
               success : function(resp) {
                    if (resp == 'True') {
                        window.location = base_url
                    }
                    else {
                        loginError.text(resp.error);
                        loginError.css("display", "block");
                    }
                }
            });

        });

    var registerValidator = $("#registerForm").bootstrapValidator({
		feedbackIcons: {
			valid: "glyphicon glyphicon-ok",
			invalid: "glyphicon glyphicon-remove",
			validating: "glyphicon glyphicon-refresh"
		},
		fields: {
			user_name: {
				message: "نام کاربری را وارد کنید.",
				validators: {
					notEmpty: {
						message: "نام کاربری را وارد کنید."
					}
				}
			},
			pass_word: {
				message: "رمز عبور را وارد کنید.",
				validators: {
					notEmpty: {
						message: "رمز عبور را وارد کنید."
					}
				}
			},
			confirm_password: {
				message: "تکرار رمز عبور را وارد کنید.",
				validators: {
					notEmpty: {
						message: "رمز عبور را وارد کنید."
					},
                    identical: {
						field: 'pass_word',
						message: 'رمز عبور با یکدیگر مطابقت ندارد'
					}
				}
			}
		}
	});
        registerValidator.on("success.form.bv", function (e) {
            $('#register-error').css("display", "none");
            e.preventDefault();
            var username = $('#user_name').val();
            var password = $('#pass_word').val();
            var base_url = window.location.origin;
            var formData = new FormData();
	        formData.append('username', username);
	        formData.append('password', password);
	        formData.append('phoneNumber', phoneNumber);
            $.ajax({
               url : base_url + '/register_handler',
               type : 'POST',
               data : formData,
               processData: false,
               contentType: false,
               success : function(resp) {
                    if (resp.ok) {
                        window.location = base_url
                    }
                    else {
                        $('#register-error').css("display", "block");
                    }
                }
            });

        });
});
