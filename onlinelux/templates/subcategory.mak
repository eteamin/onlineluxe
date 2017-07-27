<%inherit file="local:templates.master"/>

<%
    def split_by_comma(s):
        return s.split(',') if isinstance(s, str) else None
    from khayyam import JalaliDatetime

    def dash_for_space(s):
        return s.replace(' ', '-')
%>

<section class="page-top">
    <div class="container">
        <div class="page-banner">
            <div class="row">
                % for p in [p for p in pictures if p.genre == 'bottomBanners']:
                    <div class="page-banner_item col-md-3 col-sm-12 col-xs-12">
                        <a href="${b.href}" class="page-banner_item__content">
                            <img class="img-responsive" src="${base_url}/storage/${b.image}" alt="">
                        </a>
                    </div>
                % endfor
            </div>
        </div>
    </div>
</section>
<!-- page-top -->

<main class="page-main clearfix">

    <div class="container">
        <div class="row">

            <div class="page-main-sidebar col-md-3 col-sm-12 col-xs-12 pull-right">
                <div class="page-main-sidebar_content">
                    <asdie class="sidebar--box">
                        <div class="sidebar--box-content">
                            <div class="panel-group panel-category" id="accordion" role="tablist" aria-multiselectable="true">
                                % for c in categories:
                                    <div class="panel">
                                        <div class="panel-heading active" role="tab" id="category1">
                                            <h4 class="panel-title">
                                           <a data-toggle="collapse" data-parent="#accordion" href="#cat1" aria-expanded="false" aria-controls="cat1"><i class="fa fa-chevron-down"></i> ${c.title}</a>
                                        </h4>
                                        </div>
                                        <div id="cat1" class="panel-collapse collapse in" role="tabpanel" aria-labelledby="category1">
                                            <div class="panel-body">
                                                <ul>
                                                    %for s in c.subcategory:
                                                        <li><a href="${base_url}/s/${s.id}/${s.title}">${s.title}</a></li>
                                                    %endfor
                                                </ul>
                                            </div>
                                        </div>
                                    </div>
                                % endfor

                            </div>
                        </div>
                    </asdie>
                    <!-- sidebar--box -->
##                     <asdie class="sidebar--box">
##                         <div class="sidebar--box-content">
##                             <div class="sidebar--box-title">
##                                <h3>فیلتر بندی قیمت</h3>
##                             </div>
##                             <div class="bootstrap-slider">
##                                <div class="bootstrap-slider-content">
##                                   <input id="priceSlider" type="text" class="span2" value="" data-slider-min="0" data-slider-max="1000000" data-slider-step="10000" data-slider-value="[0,1000000]" />
##                                </div>
##                                 <div id="priceSliderlabel">
##                                    <span id="lbl2">1000000</span>
##                                    <span id="lbl1">0</span>
##                                 </div>
##                             </div>
##                         </div>
##                 </asdie>
                <!-- sidebar--box -->
            </div>
            <!-- page-main-sidebar_content -->
        </div>
        <!-- page-main-sidebar -->

        <div class="page-main-products col-md-9 col-sm-12 col-xs-12 pull-left">

            <div class="row">
            %if products:

                %for p in products:
                    <div class="products-item col-md-3 col-sm-12 col-xs-12">
                        <a target="_blank" href="${base_url}/p/${p.id}/${dash_for_space(p.name)}" title="${p.name} " class="products-item-content">
                            <div class="products-item--photo">
                                <img class="img-responsive" src="${base_url}/storage/${split_by_comma(p.images)[0]}" alt="">
                            </div>
                            <div class="products-item--info">
                                <h3 class="info-title">${p.name} </h3>
                                <div class="info-old-price">${p.old_price} <span>تومان</span></div>
                                <div class="info-price">${p.price} <span>تومان</span></div>
                            </div>
                        </a>
                    </div>
                %endfor
                <!-- products-item -->
            %else:
                <p>محصولی یافت نشد</p>
            %endif
            </div>
            <!-- row -->
            <nav class="page-pagination">
              <ul class="pagination">
                <li class="active"><a href="#">1</a></li>
                <li><a href="#">2</a></li>
                <li><a href="#">3</a></li>
                <li><a href="#">4</a></li>
                <li><a href="#"><i class="fa fa-chevron-right"></i></a></li>
              </ul>
            </nav>
        </div>
        <!-- page-main-products -->

    </div>
    <!-- row -->
    </div>
    <!-- container -->

</main>
<script data-main="${tg.url('/assets/js/product-category.js')}" src="${tg.url('/assets/libs/requirejs/require.js')}"></script>