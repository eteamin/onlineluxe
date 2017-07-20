<%inherit file="local:templates.master"/>
<%
    def split_by_comma(s):
        return s.split(',') if isinstance(s, str) else None
    from khayyam import JalaliDatetime
%>

<section class="page-top">
    <div class="container">
        <div class="page-breadcrumb">
            <ol class="breadcrumb">
                <li><a href="#">فروشگاه</a></li>
                <li><a href="#">مد و لباس</a></li>
                <li><a href="#">زنانه</a></li>
                <li><a href="#">پوشاک</a></li>
                <li><a href="#">شلوار</a></li>
                <li class="active"><a href="#">شلوار برند برند lon</a></li>
            </ol>
        </div>
    </div>
</section>
<!-- page-top -->

<main class="page-main clearfix">
    <div class="container">

        <div class="page-product-info" data-scroll-index="0">
            <div class="row">

                <div class="product-slider col-md-4 col-sm-12 col-xs-12 pull-right">
                    <div class="product-slider_content">
                        <div class="product-code">
                            <div class="code">کد محصول : <span class="product-code-value">${product.id}</span></div>
                            <div class="product-favorite">
                                <input type="checkbox">
                                <label></label>
                            </div>
                        </div>
                        <!-- product-code -->
                        <div class="product-gallery" data-toggle="modal" data-target="#productGallery">
                            <img class="img-responsive" src="${base_url}/storage/${split_by_comma(product.images)[0]}" alt="">
                        </div>
                        <!-- product-gallery -->
                        <div class="modal fade" id="productGallery" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
                            <div class="modal-dialog  modal-lg" role="document">
                                <div class="modal-content">
                                    <div class="modal-body">
                                        <div class="pikachoose">
                                            <ul id="pikame">asd
                                                %for i in split_by_comma(product.images):
                                                    %if i:
                                                        <li>
                                                            <a href="#"><img src="${base_url}/storage/${i}" /></a>
                                                        </li>
                                                    %endif
                                                %endfor
                                            </ul>
                                        </div>
                                        <!-- pikachoose -->
                                    </div>
                                </div>
                            </div>
                            <!-- productGallery -->
                        </div>
                    </div>
                </div>
                <!-- product-slider -->

                <div class="product-info-text col-md-8 col-sm-12 col-xs-12">
                    <div class="product-info-text_content">

                        <div class="product-info--title">
                            <h3><a href="#">ست سوئیشرت و شلوار </a><span class="off-label">۱۴٪ تخفیف</span></h3>
                            <div class="product-info--more-options">
                                <div class="rating">
                                    <div class="stars" data-score="4"></div>
                                    <div class="score-label">امتیاز : <span>۴.۲</span></div>
                                </div>
                                <a href="#" class="btn-compare"><i class="icon icon-git-compare"></i></a>
                            </div>
                        </div>
                        <!-- product-info--title -->

                        <div class="product-info--content">
                            <div class="box-row">
                                <div class="box product-price">
                                    <div class="price-2">قیمت : <span>۱۴۰,۰۰۰ تومان</span></div>
                                    <div class="price-1">قیمت با تخفیف : <span>۱۲۰,۰۰۰ تومان</span></div>
                                </div>
                                <div class="box product-property">
                                    <h5 class="box-row-title">ویژگی های محصول : </h5>
                                    <ul>
                                        <li><i class="icon icon-done_all"></i> برند : <span>lon</span></li>
                                        <li><i class="icon icon-done_all"></i> جنس : <span> 70% پنبه ، 27% پلی استر و 3% الاستین</span></li>
                                        <li><i class="icon icon-done_all"></i> مدل بسته شدن : <span> دکمه و زیپ</span></li>
                                        <li><i class="icon icon-done_all"></i> سایز : <span> 26 ، 27 ، 28 ، 29 ، 30 ، 31 ، 32 ، 33</span></li>
                                    </ul>
                                </div>
                            </div>
                            <!-- box-row -->

                            <div class="box-row">
                                <div class="box product-select">
                                    <h5 class="box-row-title">انتخاب هدیه : </h5>
                                    <select class="select-simple">
                                        <option value="">همراه با شال صورمه ای هدیه </option>
                                        <option value="">همراه با شال سبز هدیه</option>
                                    </select>
                                </div>
                                <div class="box product-color">
                                    <h5 class="box-row-title">انتخاب رنگ : </h5>
                                    <ol id="selectColor">
                                        <li>
                                            <input data-color="#000000" type="radio" name="iCheck" value="" checked>
                                            <label>مشکی</label>
                                        </li>
                                        <li>
                                            <input data-color="#9e1414" type="radio" name="iCheck" value="">
                                            <label>آلبالویی</label>
                                        </li>
                                        <li>
                                            <input data-color="#3b4066" type="radio" name="iCheck" value="">
                                            <label>سورمه ای</label>
                                        </li>
                                    </ol>
                                </div>
                            </div>
                            <!-- box-row -->

                            <div class="box-row">
                                <div class="box product-guide">
                                    <ol class="product-guide-list">
                                        <li><img src="${base_url}/assets/images/step2.svg" alt=""> برگشت محصول تا ۲روز</li>
                                        <li><img src="${base_url}/assets/images/step3.svg" alt=""> ضمانت برگشت پول</li>
                                        <li><img src="${base_url}/assets/images/step4.svg" alt=""> پشتیبانی ۲۴ ساعته</li>
                                    </ol>
                                </div>
                                <!-- product-guide -->
                                <div class="box product-buy-btn">
                                    <a class="btn btn-add-to-cart" href="#">
                                      افزودن به سبد خرید <i class="icon icon-cart3"></i>
                                   </a>
                                </div>
                                <!-- product-buy-btn -->
                            </div>
                            <!-- box-row -->

                        </div>
                        <!-- product-info--content -->
                    </div>
                    <!-- product-info-text -->
                </div>
                <!-- page-product-info -->
            </div>
            <!-- row -->
        </div>
        <!-- page-product-info -->

        <div class="page-product_details">

            <nav class="product_details__menu">
                <ul>
                    <li data-scroll-nav="0" class="active">توضیحات</li>
                    <li data-scroll-nav="1">مشخصات فنی</li>
                    <li data-scroll-nav="2">نظرات کاربران</li>
                </ul>
            </nav>

            <div class="product-desc" data-scroll-index="0">
                <p>لورم ایپسوم متن ساختگی با تولید سادگی نامفهوم از صنعت چاپ و با استفاده از طراحان گرافیک است. چاپگرها و متون بلکه روزنامه و مجله در ستون و سطرآنچنان که لازم است و برای شرایط فعلی تکنولوژی مورد نیاز و کاربردهای متنوع با هدف بهبود ابزارهای
                    کاربردی می باشد. کتابهای زیادی در شصت و سه درصد گذشته، حال و آینده شناخت فراوان جامعه و متخصصان را می طلبد.</p>
                <p>تا با نرم افزارها شناخت بیشتری را برای طراحان رایانه ای علی الخصوص طراحان خلاقی و فرهنگ پیشرو در زبان فارسی ایجاد کرد. در این صورت می توان امید داشت که تمام و دشواری موجود در ارائه راهکارها و شرایط سخت تایپ به پایان رسد وزمان مورد
                    نیاز شامل حروفچینی دستاوردهای اصلی و جوابگوی سوالات پیوسته اهل دنیای موجود طراحی اساسا مورد استفاده قرار گیرد. لورم ایپسوم متن ساختگی با تولید سادگی نامفهوم از صنعت چاپ و با استفاده از طراحان گرافیک است. چاپگرها و متون بلکه روزنامه
                    و مجله در ستون و سطرآنچنان که لازم است و برای شرایط فعلی تکنولوژی مورد نیاز و کاربردهای متنوع با هدف بهبود ابزارهای کاربردی می باشد.</p>
            </div>

            <div class="product_details" data-scroll-index="1">
                <div class="details table-responsive">
                    <table class="table">
                        <caption><i class="icon-loupe"></i> مشخصات اصلی</caption>
                        <tr>
                            <td>برند</td>
                            <td>LON</td>
                        </tr>
                        <tr>
                            <td>جنس</td>
                            <td>70% پنبه ، 27% پلی استر و 3% الاستین (کش )</td>
                        </tr>
                        <tr>
                            <td>کوپ</td>
                            <td>slim fit</td>
                        </tr>
                        <tr>
                            <td>مدل بسته شدن</td>
                            <td>دکمه و زیپ</td>
                        </tr>
                    </table>

                    <table class="table">
                        <caption><i class="icon-loupe"></i> ارزش غذایی</caption>
                        <tr>
                            <td>رنگ</td>
                            <td>آبی</td>
                        </tr>
                        <tr>
                            <td>سایز</td>
                            <td>26 ، 27 ، 28 ، 29 ، 30 ، 31 ، 32 ، 33</td>
                        </tr>
                        <tr>
                            <td>سایر ویژگی ها</td>
                            <td> جیب های جلو نمایشی هستند</td>
                        </tr>
                        <tr>
                            <td>وزن</td>
                            <td>276 گرم</td>
                        </tr>
                    </table>
                </div>
                <!-- details -->
            </div>
            <!-- product_details -->

            <div class="product_comment" data-scroll-index="2">

                <!-- comment -->

                <!-- comment_form -->
                <div class="comment_form">
                    <h4>نظر شما چیست ؟</h4>
                    <form method="post" action="${base_url}/upload_comment">
                        <div class="row">
                            <div class="col-md-12 col-sm-12 col-xs-12 pull-right">
                                <textarea name="text" cols="10" rows="8" placeholder="متن نظر..."></textarea>
                            </div>
                            <input class="hidden" name="product_id" value="${product.id}">
                            <div class="col-md-2 col-sm-2 col-xs-4">
                                <input type="submit" value="ارسال نظر">
                            </div>
                        </div>
                        <div class="clearfix"></div>
                    </form>
                </div>
            </div>
            <!-- product_comment -->

        </div>
        <!-- page-product_details -->

    </div>
    <!-- container -->
</main>
<!-- page-main -->
<script data-main="${tg.url('/assets/js/product.js')}" src="${tg.url('/assets/libs/requirejs/require.js')}"></script>
