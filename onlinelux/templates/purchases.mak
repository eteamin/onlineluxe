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
                    <a href="#">سفارشات من</a>
                </li>
            </ol>
        </div>
    </div>
</section>
<!-- page-top -->

<main class="page-main clearfix">

    <div class="container">

        <div class="product-step step-1">
            <p>وضعیت سفارشات</p>

            <div class="table-responsive">
                <table class="table">
                    <tbody>
                        <tr>
                            <th>کد سفارش</th>
                            <th>محصولات</th>
                            <th>قیمت کل</th>
                            <th>تاریخ سفارش</th>
                            <th>وضعیت سفارش</th>
                        </tr>
                        %for p in purchases:
                        <tr>
                            <td>${p.uid}</td>
                            <td>${' و '.join([p.name for p in p.product])}</td>
                            <td>${p.final_price} تومان</td>
                            <td>${p.created}</td>
                            <td>${p.status}</td>
                        </tr>
                        %endfor
                    </tbody>
                </table>
            </div>

        </div>
        <!-- product-step -->


    </div>
    <!-- container -->

</main>
<!-- page-main -->