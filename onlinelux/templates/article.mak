<%inherit file="local:templates.master"/>
<%
    from khayyam import JalaliDatetime
    def dash_for_space(s):
        return s.replace(' ', '-')
%>

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
            <div class="col-md-10 col-sm-12 col-xs-12 pull-right" >
                <div class="page_section--title">
                </div>
                <div class="sidebar_content">
                    <ul class="news-list">
                    <div class="col-md-9 col-sm-9 col-xs-12 pull-right " style="margin-top: 4rem;">
                        <div class="article-container margin-top">
                            <h1 class="padding-top-down article-title">${article.title}</h1>
                            <span class="padding-top-down">${JalaliDatetime(article.created).strftime('%A %d %B %Y')}</span>
                            <a class="padding-top-down" href="">
                                <img class="img-responsive" src="${base_url}/storage/${article.image}" alt="">
                            </a>
                            <h6 class="padding-top-down article-description">${article.description | n}</h6>
                            <div class="article-info">
                                <div>تعداد بازدید : <span>${article.views}</span></div>
                            </div>
                        </div>
                    </div>

                    <div class="col-md-3 col-sm-3 col-xs-12 pull-left margin-top">
                        <h5 class="padding-top-down">مقالات مرتبط</h5>
                        %for r in related:
                            <li class="article-container margin-top">
                                <h5 class="padding-top-down">${r.title}</h5>
                                <span class="padding-top-down">${JalaliDatetime(r.created).strftime('%A %d %B %Y')}</span>
                                <a class="padding-top-down" href="">
                                    <img class="img-responsive" src="${base_url}/storage/${r.image}" alt="">
                                </a>
                                <h6 class="padding-top-down">${r.description[:240] | n} ... </h6>
                                <a class="btn btn-info btn-view-article margin-bottom" href="${base_url}/a/${r.id}/${dash_for_space(r.title)}">مشاهده</a>
                                <div class="article-view">تعداد بازدید : <span>${r.views}</span></div>
                            </li>
                        %endfor
                    </div>

                    </ul>
                </div>
            </div>

    </div>
    </div>
</main>