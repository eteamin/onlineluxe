<%inherit file="local:templates.master"/>
<%
    def split_by_comma(s):
        return s.split(',') if isinstance(s, str) else None
%>

<section class="page-top">
    <div class="container">
        <div class="page-breadcrumb">
            <ol class="breadcrumb">
                <li>
                    <a href="#">فروشگاه</a>
                </li>
                <li class="active">
                    <a href="#">سبد خرید</a>
                </li>
            </ol>
        </div>
    </div>
</section>
<!-- page-top -->

<main class="page-main clearfix">

    <div class="container">

        <div class="product-step step-1">
        % if basket:
            <p>کالای فعلی سبد خرید شما به شرح زیر می‌باشد. در صورت تمایل می‌توانید موارد اضافی را از لیست خود حذف نمایید.</p>

            <div class="table-responsive">
                <table class="table">
                    <tbody>
                        <tr>
                            <th>نام محصول</th>
                            <th>تعداد</th>
                            <th>قیمت واحد</th>
                            <th>قیمت کل</th>
                            <th>حذف</th>
                        </tr>
                        %for p in basket.product:
                        <tr>
                            <td>
                                <a href="#">
                                   <img src="${base_url}/storage/${split_by_comma(p.images)[0]}">
                                   <span class="product-info">
                                                  <span class="product-info_name">${p.name}</span>
                                      <span class="product-info_color">
                                         <span id="product-info_color" style="background-color:#3b4066;"></span>سورمه ای
                                      </span>
                                   </span>
                                </a>
                            </td>
                            <td>
                                <div class="add-num-control" data-target="#updatePrice">
                                    <button class="increment">+</button>
                                    <input type="text" value="${basket.items.get(str(p.id))}">
                                    <button class="decrement">-</button>
                                    <input type="hidden" class="updatePriceHidden" value="50000">
                                </div>
                                <div class="update-price">
                                        <!-- <span id="updatePrice"></span><span class="price-Unit">تومان</span> -->
                                </div>
                            </td>
                            <td>${p.price} تومان</td>
                            <td>${p.price * basket.items.get(str(p.id))} تومان</td>
                            <td>
                                <button class="icon-cancel-circle"></button>
                            </td>
                        </tr>
                        %endfor
                    </tbody>
                </table>
            </div>
            <div class="product-total">
                <span class="pricelabel">مجموع مبلغ قابل پرداخت : </span>
                <span class="price">۱۶۲,۰۰۰ تومان</span>
            </div>
             <div class="button_sec">
                <div class="button">
                   <a class="btn stepBtn" style="background: #e8739e; margin-left: 1px;">ادامه خرید</a>
                </div>
                <div class="button">
                   <a class="btn stepBtn">تایید و پرداخت نهایی</a>
                </div>
             </div>
             <!-- button_sec -->
        %else:
            <p>سبد خرید شما خالی است</p>
        % endif
        </div>
        <!-- product-step -->


    </div>
    <!-- container -->

</main>
<!-- page-main -->