<%inherit file="local:templates.master"/>

<section class="section page_section-2">
    <div class="container">
        <div class="row">
            <div class="page_section-2__slider col-md-9 col-sm-12 col-xs-12 pull-right">
                <h3>آپلود عکس</h3>
                <div class="panel panel-default">

                    <div class="form-group-lg">

                        <div class="form-group">
                            <form action="" method="post" enctype="multipart/form-data" id="upload-picture">
                                <label class="form-control" style="background: deepskyblue;"  for="image">تصویر</label>
                                <input class="form-control" id="image" name="image" required type="file" placeholder="...">

                                <label class="form-control" style="background: deepskyblue;"  for="href">آدرس در سایت</label>
                                <input class="form-control" id="href" name="href"  required type="text" placeholder="...">

                                <label class="form-control"  style="background: deepskyblue;" for="type">نوع</label>
                                <select class="form-control" id="type" name="genre" required>
                                    <option class="form-control">Carousel</option>
                                    <option class="form-control">Banner</option>
                                    <option class="form-control">Top</option>
                                    <option class="form-control">Special</option>
                                    <option class="form-control">Bottom-Banners</option>
                                </select>

                                <button class="btn btn-success" type="submit">Submit</button>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
            <div class="page_section-2__slider col-md-9 col-sm-12 col-xs-12 pull-right" style="margin-top: 25px;">
                <h3>آپلود محصول</h3>
                <div class="panel panel-default">
                    <div class="form-group-lg">

                        <div class="form-group">
                            <form action="${base_url}/area51/submit_product" method="post" enctype="multipart/form-data" id="upload-product">
                                <label class="form-control" style="background: deepskyblue;" for="image">تصاویر</label>
                                <input class="form-control" multiple id="images" name="form-images" required type="file">

                                <label class="form-control" style="background: deepskyblue;" for="href">نام محصول</label>
                                <input class="form-control" id="href" name="name"  required type="text" placeholder="...">

                                <label class="form-control" style="background: deepskyblue;" for="href">قیمت محصول</label>
                                <input class="form-control" id="href" name="old_price"  required type="number" placeholder="تومان">

                                <label class="form-control" style="background: deepskyblue;" for="href">قیمت با تخفیف </label>
                                <input class="form-control" id="href" name="price"  required type="number" placeholder="تومان">

                                <label class="form-control" style="background: deepskyblue;"  for="href">سایز</label>
                                <input class="form-control" id="href" name="size"  required type="text" placeholder="...">

                                <label class="form-control" style="background: deepskyblue;"  for="href">تعداد</label>
                                <input class="form-control" id="href" name="quantity"  required type="text" placeholder="..." >

                                <label class="form-control" style="background: deepskyblue;"  for="href">کیفیت</label>
                                <input class="form-control" id="href" name="quality"  required type="text" placeholder="...">

                                <label class="form-control"  style="background: deepskyblue;" for="href">توضیحات</label>
                                <textarea class="form-control" id="href" name="description"  required type="text" placeholder="..."></textarea>

                                <label class="form-control" style="background: deepskyblue;"  for="type">دسته بندی</label>
                                <select class="form-control" id="type" name="subcat_id" required>
                                    %for s in subcategories:
                                        <option class="form-control" value="${s.id}">${s.title}</option>
                                    %endfor
                                </select>
                                <button class="btn btn-success" type="submit">Submit</button>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
            <div class="page_section-2__slider col-md-9 col-sm-12 col-xs-12 pull-right" style="margin-top: 25px;">
                <h3>آپلود خبر</h3>
                <div class="panel panel-default">
                    <div class="form-group-lg">

                        <div class="form-group">
                            <form action="" method="post" enctype="multipart/form-data" id="upload-article">
                                <label class="form-control" style="background: deepskyblue;" for="image">تصویر</label>
                                <input class="form-control" id="image" name="image" required type="file">

                                <label class="form-control" style="background: deepskyblue;" for="title">عنوان</label>
                                <input class="form-control" id="title" name="title"  required type="text" placeholder="...">

                                <label class="form-control" style="background: deepskyblue;" for="description">توضیحات</label>
                                <textarea class="form-control" id="description" name="description"  required></textarea>
                                <button class="btn btn-success" type="submit">Submit</button>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>
<script data-main="assets/js/index.js" src="${base_url}/assets/libs/requirejs/require.js"></script>
