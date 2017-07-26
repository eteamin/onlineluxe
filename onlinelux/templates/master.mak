<!DOCTYPE html>
<html lang="fa-IR">

<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
    <title>${title if title else ''}</title>

    <meta name="description" content="تجربه ای متفاوت از خرید آنلاین بدلیجات"/>
    <meta name="keywords" content="نیم ست,ست چوبی,انشگتر,دسنبد,ست,دستبند,بدلیجات"/>
    <link rel="canonical" href="http://onlinelux.ir" />
    <meta property="og:locale" content="fa_IR" />
    <meta property="og:type" content="website" />
    <meta property="og:title" content="آنلاین لوکس - خرید بدلیجات" />
    <meta property="og:description" content="تجربه ای متفاوت از خرید آنلاین بدلیجات"/>
    <meta property="og:url" content="http://onlinelux.ir" />
    <meta property="og:site_name" content="آنلاین لوکس - خرید بدلیجات" />
    <meta name="twitter:card" content="summary" />
    <meta name="twitter:description" content="تجربه ای متفاوت از خرید آنلاین بدلیجات" />
    <meta name="twitter:title" content="آنلاین لوکس - خرید بدلیجات" />
        
    <link rel="stylesheet" href="${base_url}/assets/css/main.css">
</head>

<body>
    <header>
    	<div class="navigation">
    		<nav class="navbar-main">
    			<div class="container">
    				<div class="horizental-flex-container">
    					<a href="" class="navbar-main_logo">
    						<img src="${base_url}/assets/images/logo.png" alt="">
    					</a>
    					<!-- navbar-main_logo -->

    					<div class="navbar-main_product-tools col-md-6 col-sm-12 col-xs-12 pull-right">
    						<form action="${tg.url('/search')}" method="post">
    							<input type="text" name="query" placeholder="جستجو در محصولات">
    							<button type="submit"><i class="fa fa-search"></i></button>
    						</form>
    					</div>
    					<!-- navbar-main_product-tools -->

    					<div class="navbar-main_product-elm col-md-2 col-sm-12 col-xs-12 col-md-offset-1">
    						<div class="shopping-cart">
                                %if 'user_id' in session:
                                    <a href="${tg.url('/basket')}"><i class="icon icon-cart3"></i></a>
                                %else:
                                    <a data-toggle="modal" data-target="#modaLogin" href="#"><i class="icon icon-cart3"></i></a>
                                %endif

    							<span class="add-to-cart__count">12</span>
    						</div>
                            <a href="${tg.url('/blog')}" class="compare">
    							<i class="glyphicon glyphicon-blackboard"></i>
    						</a>
                            <a class="compare" data-toggle="modal" data-target="#modaLogin" href="#">
    							<i class="icon icon-user"></i>
    						</a>

    					</div>
    					<!-- navbar-main_product-tools -->

    					<!-- <a id="navbarBtnToggle" href="#" class="navbar-main_toggle-menu">
    						<i class="fa fa-bars fa-2x"></i>
    					</a> -->
    					<!-- navbar-main_toggle-menu -->
    				</div>
    			</div>
    		</nav>
    		<!-- navbar-main -->
    		<nav class="navbar navbar-default">
    			<div class="container">
    				<div class="horizental-flex-container">

    					<div class="navbar-header">
    						<div class="horizental-flex-container">
    							<button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1" aria-expanded="false">
    								<span class="sr-only">Toggle navigation</span>
    								<span class="icon-bar"></span>
    								<span class="icon-bar"></span>
    								<span class="icon-bar"></span>
    							</button>
                                %if 'user_id' not in session:
    							    <a class="navbar-vip" data-toggle="modal" data-target="#modaLogin" href="#">ورود به حساب کاربری</a>
                                %else:
                                    <a class="navbar-basket" href="${tg.url('/basket')}">مشاهده سبد خرید</a>
                                %endif
    						</div>
    					</div>

    					<div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
    						<ul class="nav navbar-nav pull-right">
                                % for c in categories:
    							<li class="active"><a href="#">${c.title}</a>
    								<div class="navbar-megamenu">
    									<div class="container">
    										<ul>
                                                %for s in c.subcategory:
    											    <li><a href="">${s.title}</a></li>
                                                %endfor
    										</ul>
    									</div>
    								</div>
    							</li>
                                % endfor
    							<li><a href=""><span class="label-update-menu">جدید</span> کالاهای ویژه</a></li>

    						</ul>
    					</div>
    				</div>
    			</div>
    		</nav>
    		<!-- navbar -->

    	</div>
    	<!-- navigation -->

    	<!-- Modal -->
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
    						<form id="loginForm" action="http://localhost:8080/login_handler" method="post">
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

    	<div class="modal fade" id="modaRegister" tabindex="-1" role="dialog" aria-labelledby="modaRegister">
    		<div class="modal-dialog" role="document">
    			<div class="modal-content">
    				<div class="modal-body">
    					<div class="modal-body-head">
    							<i style="cursor:pointer; margin-right: 120%;font-size:35px;" class="icon icon-cancel-circle" data-dismiss="modal"></i>

    						<div class="head--icon">
    							<i class="icon icon-user"></i>
    						</div>
    						<h4>ثبت نام در آنلاین لوکس</h4>
    					</div>
    					<div class="modal-body-login has-feedback">
    						<form id="registerForm" action="http://localhost:8080/register_handler" method="post">
    						    <h6 id="register-error" style="color:#a94442; display:none;"> نام کاربری قبلا ثبت شده است</h6>
                                <div class="form-group has-feedback" style="width: 75%;">
                                    <label for="" style="font-size: 13px;">نام کاربری</label>
                                    <input id="user_name" type="text" class="form-control" name="user_name" placeholder="">
                                </div>
                                <div class="form-group has-feedback" style="width: 75%;">
                                    <label for="" style="font-size: 13px;">رمز عبور:</label>
                                    <input id="pass_word" type="password" class="form-control" name="pass_word" placeholder="">
                                </div>
                                <div class="form-group has-feedback" style="width: 75%;">
                                    <label for="" style="font-size: 13px;">تکرار رمز عبور:</label>
                                    <input id="confirm_password" type="password" class="form-control" name="confirm_password" placeholder="">
                                </div>
    							<button type="submit">ثبت نام</button>
    						</form>
    					</div>
    				</div>
    				<div class="modal-footer">
                        <a href="#" class="btn-register" data-dismiss="modal" data-toggle="modal" data-target="#modaLogin">قبلا ثبت نام کرده اید؟ وارد شوید</a>
    				</div>
    			</div>
    		</div>
    	</div>

    </header>
    ${next.body()}
    <footer>
        <!-- footer_text -->
        <div class="footer_bottom">
            <div class="container">


                <div class="row">

                    <div class="footer_bottom__bottombar col-md-12 col-xs-12 pull-right">
                        <div class="copyright">
                            <p>© تمام حقوق این سایت محفوظ و متعلق به گروه نرم افزاری  می‌باشد </p>
                        </div>
                        <div class="social">
                            <a class="facbook" href="#"><i class="fa fa-facebook-square" aria-hidden="true"></i></a>
                            <a class="twitter" href="#"><i class="fa fa-twitter-square" aria-hidden="true"></i></a>
                            <a class="youtube" href="#"><i class="fa fa-youtube-square" aria-hidden="true"></i></a>
                        </div>
                    </div>
                    <!-- footer_bottom__bottombar -->
                </div>


                <div class="footer_bottom__menus col-md-12 col-sm-12 col-xs-12">
                   <div class="content">
                      <ul>
                          <li><a href="#">نحوه استفاده</a></li>
                          <li><a href="#">درباره ما</a></li>
                          <li><a href="#">تامین کنندگان</a></li>
                          <li><a href="#">تماس با ما</a></li>
                          <li><a href="#">شیوه پرداخت</a></li>
                          <li><a href="#">ثبت سفارش آنلاین</a></li>
                          <li><a href="#">پاسخ به پرسش های متداول</a></li>
                      </ul>
                   </div>
                </div>
                <!-- footer_bottom__menus -->
            </div>
        </div>
        <!-- footer_bottom -->

        <div class="footer_menus">
            <div class="container">
            </div>
        </div>
        <!-- footer_menus -->
    </footer>

</body>

## <script>
##   (function(i,s,o,g,r,a,m){i['GoogleAnalyticsObject']=r;i[r]=i[r]||function(){
##   (i[r].q=i[r].q||[]).push(arguments)},i[r].l=1*new Date();a=s.createElement(o),
##   m=s.getElementsByTagName(o)[0];a.async=1;a.src=g;m.parentNode.insertBefore(a,m)
##   })(window,document,'script','https://www.google-analytics.com/analytics.js','ga');
##
##   ga('create', 'UA-101931721-1', 'auto');
##   ga('send', 'pageview');
##
## </script>
</html>

