<%inherit file="local:templates.master"/>
<%
    from khayyam import JalaliDatetime
%>
<section class="page-top">
    <div class="container">
    </div>
</section>

<main class="page-main clearfix">

    <div class="container">
       <div class="row">
            <div class="col-md-12 col-sm-12 col-xs-12 pull-right">
                <div class="page_section--title">
                </div>
                <div class="sidebar_content">
                    <ul class="news-list">
                    <div class="col-md-7 col-sm-7 col-xs-7 pull-right">
                        <h5 class="padding-top-down">آخرین مطالب</h5>
                        %for a in articles:
                            <li class="article-container margin-top">
                                <h5 class="padding-top-down">${a.title}</h5>
                                <span class="padding-top-down">${JalaliDatetime(a.created).strftime('%A %d %B %Y')}</span>
                                <a class="padding-top-down" href="">
                                    <img class="img-responsive" src="${base_url}/storage/${a.image}" alt="">
                                </a>
                                <h6 class="padding-top-down">${a.description[:240]} ... </h6>
                                <div class="article-info">
                                    <a class="btn btn-info margin-bottom">ادامه</a>
                                    <div class="article-view">تعداد بازدید : <span>${a.views}</span></div>
                                </div>
                            </li>
                        %endfor
                    </div>

                    <div class="col-md-4 col-sm-4 col-xs-4 pull-left margin-top">
                        <h5 class="padding-top-down">پر بازدیدترین ها</h5>
                        %for t in top:
                            <li class="article-container margin-top">
                                <h5 class="padding-top-down">${a.title}</h5>
                                <span class="padding-top-down">${JalaliDatetime(a.created).strftime('%A %d %B %Y')}</span>
                                <a class="padding-top-down" href="">
                                    <img class="img-responsive" src="${base_url}/storage/${a.image}" alt="">
                                </a>
                                <h6 class="padding-top-down">${a.description[:240]} ... </h6>
                                <a class="btn btn-info margin-bottom">ادامه</a>
                                <div class="article-view">تعداد بازدید : <span>${a.views}</span></div>
                            </li>
                        %endfor
                    </div>

                    </ul>
                </div>
            </div>

    </div>

</main>