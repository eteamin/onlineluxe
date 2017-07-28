<%inherit file="local:templates.master"/>


<section class="page-top">
    <div class="container">
        <div class="page-breadcrumb">
            <ol class="breadcrumb">
                <li>
                    <a href="#">فروشگاه</a>
                </li>
                <li class="active">
                    <a href="#">اطلاعات ارسال سفارش</a>
                </li>
            </ol>
        </div>
    </div>
</section>
<!-- page-top -->

<main class="page-main clearfix">

    <div class="container">

        <div class="product-step step-2">
            <div class="step-2-sec">
                <div class="step-2-title">
                    <h5>اطلاعات خریدار</h5>
                    <p>لطفا آدرس و مشخصات خود را به دقت وارد کنید و پس از اطمینان از صحت اطلاعات وارد شده و همچنین انتخاب روش پرداخت، بر روی دکمه تایید و پرداخت نهایی کلیک کنید:</p>
                </div>
                <!-- step-2-title -->
                <div class="step-2-content">
                    <div class="row">

                        <div class="input_feild col-md-6 col-sm-12 col-xs-12">
                            <div class="input_feild__content">
                                <div class="input_feild--text-area">
                                    <div class="icon"><i class="icon icon-user"></i></div>
                                    <div class="text" id="editableName">${user.display_name or 'نام و نام خانوادگی'}</div>
                                </div>
                                <div id="editable_btn_1" class="edit">
                                    ویرایش<i class="icon icon-mode_edit"></i>
                                </div>
                            </div>
                        </div>
                        <!-- input_feild -->
                        <div class="input_feild col-md-6 col-sm-12 col-xs-12">
                            <div class="input_feild__content">
                                <div class="input_feild--text-area">
                                    <div class="icon"><i class="icon icon-location"></i></div>
                                    <div class="text" id="editableCode">${user.postal_code or 'کد پستی'}</div>
                                </div>
                                <div id="editable_btn_2" class="edit">
      ویرایش<i class="icon icon-mode_edit"></i>
                                </div>
                            </div>
                        </div>
                        <!-- input_feild -->
                        <div class="input_feild col-md-6 col-sm-12 col-xs-12">
                            <div class="input_feild__content">
                                <div class="input_feild--text-area">
                                    <div class="icon"><i class="icon icon-office"></i></div>
                                    <div class="text" id="editableAddress">${user.postal_address or 'آدرس پستی'}</div>
                                </div>
                                <div id="editable_btn_3" class="edit">
                                   ویرایش<i class="icon icon-mode_edit"></i>
                                </div>
                            </div>
                        </div>
                        <!-- input_feild -->
                        <div class="input_feild col-md-6 col-sm-12 col-xs-12">
                            <div class="input_feild__content">
                                <div class="input_feild--text-area">
                                    <div class="icon"><i class="icon icon-mobile"></i></div>
                                    <div class="text" id="editablePhone">${user.phone_number or 'تلفن همراه'}</div>
                                </div>
                                <div id="editable_btn_4" class="edit">
                                  ویرایش<i class="icon icon-mode_edit"></i>
                                </div>
                            </div>
                        </div>
                        <!-- input_feild -->
                    </div>
                    <!-- row -->
                </div>
                <!-- step-2-content -->
            </div>
            <!-- step-2-sec -->

##             <div class="step-2-sec">
##                 <div class="step-2-title">
##                     <h5>روش پرداخت فاکتور</h5>
##                 </div>
##
##                 <div class="step-2-content">
##                     <div class="product-Payment-methods">
##                        <ol>
##                           <li>
##                              <input id="minimal-radio-1" type="radio" name="iCheck" checked>
##                              <label for="minimal-radio-1">پرداخت آنلاین با کارت های عضو شتاب</label>
##                           </li>
##                           <li>
##                              <input id="minimal-radio-2" type="radio" name="iCheck">
##                              <label for="minimal-radio-2">پرداخت در محل در زمان دریافت محصولات</label>
##                           </li>
##                        </ol>
##                     </div>
##                     <!-- product-Payment-methods -->
##                 </div>
##
##             </div>
            <!-- step-2-sec -->


        <div class="button_sec">
            <div class="button">
                <a class="btn" onclick="window.location = '${base_url}'; ">انصراف</a>
            </div>
            <div class="button">
                <a class="btn stepBtn" id="finalize-order" onclick="return finalizeOrder('${basket_id}');">تایید و پرداخت نهایی</a>
            </div>
        </div>
        <!-- button_sec -->
    </div>
    <!-- product-step -->

    </div>
    <!-- container -->

</main>
<!-- page-main -->
<script data-main="${tg.url('/assets/js/product-step.js')}" src="${tg.url('/assets/libs/requirejs/require.js')}"></script>

<script>
    function finalizeOrder(basket_id) {
        var formData = new FormData();
        formData.append('name', 'editableName');
        formData.append('address', 'editableAddress');
        formData.append('code', 'editableCode');
        formData.append('phone', 'editablePhone');
        formData.append('basket_id', basket_id);

        $.ajax({
            url : '${base_url}' + '/order_basket',
            type : 'POST',
            data : formData,
            processData: false,
            contentType: false,
            success : function(resp) {
                if (resp.ok) {
                    window.location = resp.paymentUrl + '/' + resp.authority;
                }
                else {
                    swal({
                      'title': 'آنلاین لوکس',
                      'text': resp.error,
                      'type': 'warning',
                      'timer': 3500,
                      'showConfirmButton': false
                    });
                }
            }
        });


    }
</script>