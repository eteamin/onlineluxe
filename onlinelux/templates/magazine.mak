<%inherit file="local:templates.master"/>
<%
    from khayyam import JalaliDatetime
    def dash_for_space(s):
        return s.replace(' ', '-')
%>
<section class="page-top">
    <div class="container">
    </div>
</section>

<main class="page-main clearfix">

    <div class="container">
       <div class="row">

           <div class="banners-1 col-md-2 col-xs-12 pull-right">

                <div class="row">
                    <h5 class="padding-top-down text-center" style="margin-top: 4rem;">محصولات ویژه</h5>
                    % for p in [p for p in pictures if p.genre == 'Banner']:
                    <div class="banner_photo col-xs-12">
                        <a target="_blank" href="${p.href}"><img class=" image-border img-responsive" src="${base_url}/storage/${p.image}" alt=""></a>
                    </div>
                    % endfor
                    % for p in [p for p in pictures if p.genre == 'Special']:
                    <div class="banner_photo col-xs-12">
                        <a target="_blank" href=""><img class=" image-border img-responsive" src="${base_url}/storage/${p.image}" alt=""></a>
                    </div>
                    % endfor
                </div>
            </div>
            <div class="col-md-10 col-xs-12 pull-right">

                <div class="page_section--title">
                </div>
                <div class="sidebar_content">
                    <ul class="news-list">
                    <div class="col-md-9 col-xs-12 col-lg-12 pull-right" style="margin-top: 1rem;">
                        <h5 class="padding-top-down text-center" >آخرین مقالات</h5>
                        %for a in articles:
                            <li class="article-container margin-top">
                                <h5 class="padding-top-down">${a.title}</h5>
                                <span class="padding-top-down">${JalaliDatetime(a.created).strftime('%A %d %B %Y')}</span>
                                <a class="padding-top-down" href="">
                                    <img class="img-responsive image-border" src="${base_url}/storage/${a.image}" alt="">
                                </a>
                                <h6 class="padding-top-down">${a.description[:240]} ... </h6>
                                <div class="article-info">
                                    <a class="btn btn-info margin-bottom" href="${base_url}/a/${a.id}/${dash_for_space(a.title)}">ادامه</a>
                                    <div class="article-view">تعداد بازدید : <span>${a.views}</span></div>
                                </div>
                            </li>
                        %endfor
                    </div>

                    <div class="col-md-3 col-sm-3 col-xs-12 pull-left margin-top">
                        <h5 class="padding-top-down text-center">پر بازدیدترین ها</h5>
                        %for t in top:
                            <li class="article-container margin-top">
                                <h5 class="padding-top-down">${t.title}</h5>
                                <span class="padding-top-down">${JalaliDatetime(a.created).strftime('%A %d %B %Y')}</span>
                                <a class="padding-top-down" href="">
                                    <img class="img-responsive image-border" src="${base_url}/storage/${t.image}" alt="">
                                </a>
                                <h6 class="padding-top-down">${t.description[:150]} ... </h6>
                                <a class="btn btn-info btn-view-article margin-bottom" href="${base_url}/a/${t.id}/${dash_for_space(t.title)}">مشاهده</a>
                                <div class="article-view">تعداد بازدید : <span>${t.views}</span></div>
                            </li>
                        %endfor
                    </div>

                    </ul>
                </div>
            </div>

    </div>
    </div>
</main>