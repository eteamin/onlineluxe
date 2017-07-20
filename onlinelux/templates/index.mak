<%inherit file="local:templates.master"/>
<%
    def split_by_comma(s):
        return s.split(',') if isinstance(s, str) else None
    from khayyam import JalaliDatetime
%>

<section class="section page_section-1 bg-white">
    <div class="container">

        <div class="row">

            <div class="banners-1 col-md-3 col-xs-12 pull-right">
                <div class="row">
                    <div class="banner_photo col-xs-12">
                        <a href=""><img class="img-responsive" src="upload/banners/b1.jpg" alt=""></a>
                    </div>
                    <div class="banner_photo col-xs-12">
                        <a href=""><img class="img-responsive" src="upload/banners/b2.jpg" alt=""></a>
                    </div>
                    <div class="banner_photo col-xs-12">
                        <a href=""><img class="img-responsive" src="upload/banners/b3.jpg" alt=""></a>
                    </div>
                </div>
            </div>
            <!-- banners-1 -->

            <div class="banners-2 col-md-9 col-xs-12 pull-left">
                <div class="page__slider">
                    <div id="carousel-example-generic" class="carousel slide" data-ride="carousel">

                        <div class="carousel-inner" role="listbox">
                            % for c in carousels:
                                <div class="item ${'active' if carousels.index(c) == 0 else ''}">
                                    <a href="${c.href}"><img src="${base_url}/storage/${c.image}" alt=""></a>
                                </div>
                            % endfor
                        </div>

                        <div class="slide-control">
                            <a class="left carousel-control" href="#carousel-example-generic" role="button" data-slide="next">
                                <span class="fa fa-chevron-left" aria-hidden="true"></span>
                                <span class="sr-only">Previous</span>
                            </a>
                            <a class="right carousel-control" href="#carousel-example-generic" role="button" data-slide="prev">
                                <span class="fa fa-chevron-right" aria-hidden="true"></span>
                                <span class="sr-only">Next</span>
                            </a>
                        </div>

                        <!-- Indicators -->
                        <ol class="carousel-indicators">
                            <li data-target="#carousel-example-generic" data-slide-to="0" class="active">
                                لوازم خانگی
                            </li>
                            <li data-target="#carousel-example-generic" data-slide-to="1">
                                هدفون بیتس
                            </li>
                            <li data-target="#carousel-example-generic" data-slide-to="2">
                                لباس کودک
                            </li>
                            <li data-target="#carousel-example-generic" data-slide-to="3">
                                موبایل و تبلت
                            </li>
                            <li data-target="#carousel-example-generic" data-slide-to="4">
                                محصولات آرایشی
                            </li>
                        </ol>

                    </div>
                </div>
                <!-- page__slider -->

                <div class="page__banners">
                    <div class="b1 col-md-8 col-xs-12 pull-right">
                        <div class="banner_photo">
                            <a href=""><img class="img-responsive" src="upload/banners/b4.jpg" alt=""></a>
                        </div>
                    </div>
                    <div class="b1 col-md-4 col-xs-12 pull-left">
                        <div class="banner_photo">
                            <a href=""><img class="img-responsive" src="upload/banners/b5.jpg" alt=""></a>
                        </div>
                    </div>

                </div>
                <!-- page__banners -->

            </div>
            <!-- banners-2 -->

            <div class="buy-steps col-md-12 col-sm-12 col-xs-12">
                <ol>
                    <li><img src="assets/images/step1.svg" alt=""> تحویل ۲روزه کالا</li>
                    <li><img src="assets/images/step2.svg" alt=""> برگشت محصول تا ۲روز</li>
                    <li><img src="assets/images/step3.svg" alt=""> ضمانت برگشت پول</li>
                    <li><img src="assets/images/step4.svg" alt=""> پشتیبانی ۲۴ ساعته</li>
                </ol>
            </div>
            <!-- buy-steps -->
        </div>

    </div>
</section>
<!-- page_section-1 -->

<section class="section page_section-2">
    <div class="container">
        <div class="row">
            <div class="page_section-2__slider col-md-9 col-sm-12 col-xs-12 pull-right">
                <div class="panel panel-default">

                    <div class="panel-heading">

                        <div class="arrow">
                            <a class="left carousel-control" href="#page_section-2__slider" role="button" data-slide="next">
                                <span class="fa fa-chevron-left" aria-hidden="true"></span>
                                <span class="sr-only">Previous</span>
                            </a>
                            <a class="right carousel-control" href="#page_section-2__slider" role="button" data-slide="prev">
                                <span class="fa fa-chevron-right" aria-hidden="true"></span>
                                <span class="sr-only">Next</span>
                            </a>
                        </div>
                    </div>
                    <div id="page_section-2__slider" class="carousel slide" data-ride="carousel">
                        <div class="indicators-box">
                            <div id="indicatorsTitle" class="title">
                                <i id="btnToggleIndicators" class="fa fa-list"></i>
                            </div>
                            <ol class="carousel-indicators"></ol>
                        </div>

                        <div class="carousel-inner" role="listbox">
                            <div class="item">
                                <a href=""><img data-name="اتوبخار پاناسونیک" src="upload/slideshow/s1.jpg" alt=""></a>
                            </div>
                            <div class="item">
                                <a href=""><img data-name="HTC One A9 گوشی موبایل" src="upload/slideshow/s2.jpg" alt=""></a>
                            </div>
                            <div class="item">
                                <a href=""><img data-name="فلش مموری ۸ گیگ" src="upload/slideshow/s1.jpg" alt=""></a>
                            </div>
                            <div class="item">
                                <a href=""><img data-name="گوشی سامسونگ" src="upload/slideshow/s2.jpg" alt=""></a>
                            </div>
                            <div class="item">
                                <a href=""><img data-name="گوشی ال جی ج۲" src="upload/slideshow/s1.jpg" alt=""></a>
                            </div>
                            <div class="item">
                                <a href=""><img data-name="ساعت هوشمند موتورلا" src="upload/slideshow/s2.jpg" alt=""></a>
                            </div>
                            <div class="item">
                                <a href=""><img data-name="دستبند سلامتی" src="upload/slideshow/s1.jpg" alt=""></a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!-- page_section-2__slider -->

            <div class="page_section-2__video col-md-3 col-sm-12 col-xs-12">
                <div class="video--title">
                    <img class="img-responsive" src="assets/images/bg-header-video.png" alt="">
                    <h4><i class="fa fa-play"></i> آخرین بررسی های ویدیویی</h4>
                </div>

                <div class="video--item">
                    <a href="">
                        <img class="img-responsive" src="upload/video1.jpg" alt="">
                        <div class="video--item_title">
                            <i class="fa fa-camera"></i>
                            <span class="title--text">ماهیتابه فرنث</span>
                        </div>
                    </a>
                </div>

                <div class="video--item">
                    <a href="">
                        <img class="img-responsive" src="upload/video2.jpg" alt="">
                        <div class="video--item_title">
                            <i class="fa fa-camera"></i>
                            <span class="title--text">ست قابلمه</span>
                        </div>
                    </a>
                </div>

            </div>
            <!-- page_section-2__video -->
        </div>
    </div>
</section>
<!-- page_section-2 -->

<section class="section page_section-3 bg-white">
    <div class="container">

        <div class="row">
            <div class="sidebar col-md-3 col-sm-3 col-xs-12 pull-right">
                <div class="page_section--title">
                    <h5>آخرین اخبار</h5>
                </div>
                <div class="sidebar_content">
                    <ul class="news-list">
                        %for a in articles:
                            <li>
                                <a href="">
                                    <img class="img-responsive" src="${base_url}/storage/${a.image}" alt="">
                                    <h3>${a.title}</h3>
                                    <span>${JalaliDatetime(a.created).strftime('%A %d %B %Y')}</span>
                                </a>
                            </li>
                        %endfor
                    </ul>
                    <div class="btn-more">
                        <a href="">نمایش همه اخبار</a>
                    </div>
                </div>
            </div>
            <!-- sidebar -->

            <div class="content col-md-9 col-sm-9 col-xs-12 pull-left">

                <aside class="panel panel-slider product_slider">
                    <div class="panel-heading">
                        <h5>جدیدترین محصولات</h5><a href="">(نمایش همه)</a></div>
                    <div class="panel-body">
                        <div id="product-slider-1" class="owl-carousel">
                        % for l in latest:
                            <div class="product_slider__item item">
                                <div class="product_slider__item--content">
                                    <div class="product_slider___photo">
                                        <a href="">
                                            <img src="${base_url}/storage/${split_by_comma(l.images)[0]}" alt="">
                                        </a>
                                    </div>
                                    <div class="product_slider___info">
                                        <div class="product_slider--name">
                                            <a href="">${l.name}</a>
                                        </div>
                                        <div class="product_slider--price">
                                            ${l.price} تومان
                                        </div>
                                    </div>
                                </div>
                            </div>
                        % endfor

                        </div>
                    </div>
                </aside>
                <!-- product_slider -->

                <aside class="panel panel-slider product_slider">
                    <div class="panel-heading">
                        <h5>جدیدترین محصولات</h5><a href="">(نمایش همه)</a></div>
                    <div class="panel-body">
                        <div id="product-slider-2" class="owl-carousel">

                        % for l in latest:
                            <div class="product_slider__item item">
                                <div class="product_slider__item--content">
                                    <div class="product_slider___photo">
                                        <a href="">
                                            <img src="${base_url}/storage/${split_by_comma(l.images)[0]}" alt="">
                                        </a>
                                    </div>
                                    <div class="product_slider___info">
                                        <div class="product_slider--name">
                                            <a href="">${l.name}</a>
                                        </div>
                                        <div class="product_slider--price">
                                            ${l.price} تومان
                                        </div>
                                    </div>
                                </div>
                            </div>
                        % endfor

                        </div>
                    </div>
                </aside>
                <!-- product_slider -->

            </div>
            <!-- sidebar -->
        </div>

    </div>
</section>

<section class="section page_section__banners">
    <div class="container">
        <div class="row">
            <div class="banner-right-side col-md-3 col-sm-12 col-xs-12 pull-right">
                <div class="banner-right-side--content photo-1">
                    <a href=""><img class="img-responsive" src="upload/banners/lg1.jpg" alt=""></a>
                </div>
            </div>
            <!-- banner-right-side -->
            <div class="banner-right-side col-md-6 col-sm-12 col-xs-12 pull-right">
                <div class="row">
                    <div class="col-md-6 col-sm-12 col-sm-12 col-xs-12">
                        <div class="banner-right-side--content photo-2">
                            <a href=""><img class="img-responsive" src="upload/banners/lg4.jpg" alt=""></a>
                        </div>
                    </div>
                    <div class="col-md-6 col-sm-12 col-sm-12 col-xs-12">
                        <div class="banner-right-side--content photo-2">
                            <a href=""><img class="img-responsive" src="upload/banners/lg5.jpg" alt=""></a>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-12 col-sm-12 col-sm-12 col-xs-12">
                        <div class="banner-right-side--content photo-3 margin-top">
                            <a href=""><img class="img-responsive" src="upload/banners/lg3.jpg" alt=""></a>
                        </div>
                    </div>
                </div>

            </div>
            <!-- banner-right-side -->
            <div class="banner-right-side col-md-3 col-sm-12 col-xs-12 pull-left">
                <div class="row">
                    <div class="col-md-12 col-sm-12 col-xs-12">
                        <div class="banner-right-side--content photo-2">
                            <a href=""><img class="img-responsive" src="upload/banners/lg2.jpg" alt=""></a>
                        </div>
                    </div>
                    <div class="col-md-12 col-sm-12 col-xs-12">
                        <div class="banner-right-side--content photo-2 margin-top">
                            <a href=""><img class="img-responsive" src="upload/banners/lg2.jpg" alt=""></a>
                        </div>
                    </div>
                </div>

            </div>
            <!-- banner-right-side -->
        </div>


    </div>
</section>
<!-- page_section__banners -->

<section class="section page_section-3 bg-white">
    <div class="container">

        <div class="row">

            <div class="content col-md-12 col-sm-12 col-xs-12 pull-left">

                <aside class="panel panel-slider product_slider product_slider__bottom ">
                    <div class="panel-heading">
                        <h5>جدیدترین محصولات</h5><a href="">(نمایش همه)</a></div>
                    <div class="panel-body">
                        <div id="product-slider-3" class="owl-carousel ">
                            %for t in top:
                                <!-- product_slider__item  -->
                                <div class="product_slider__item item">
                                    <div class="product_slider__item--content">
                                        <div class="product_slider___photo">
                                            <a href="">
                                                <img src="${base_url}/storage/${split_by_comma(t.images)[0]}" alt="">
                                            </a>
                                        </div>
                                        <div class="product_slider___info">
                                            <div class="product_slider--name">
                                                <a href="">${t.name}</a>
                                            </div>
                                            <div class="product_slider--price">
                                                ${t.price} تومان
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            %endfor
                        </div>
                    </div>
                </aside>
                <!-- product_slider -->


            </div>
            <!-- sidebar -->
        </div>

    </div>
</section>
<script data-main="assets/js/index.js" src="${tg.url('/assets/libs/requirejs/require.js')}"></script>