requirejs.config({
    "baseUrl": window.location.origin + '/assets/js',
    paths: {
        "common": "common",
        "jquery": "../libs/jquery/dist/jquery",
        "bootstrap": "../libs/bootstrap/dist/js/bootstrap.min",
        "owlCarousel": "../libs/owl.carousel/dist/owl.carousel.min",
    },
    shim: {
        "bootstrap": {
            deps: ["jquery"],
            exports: '$'
        },
        "owlCarousel": {
            deps: ["jquery"],
            exports: "$"
        },
    },
    enforceDefine: true
});

define([
    "common",
    "bootstrap",
    "owlCarousel",
], function(
    common,
    bootstrap,
    owlCarousel
) {
    (function($) {

        $('.carousel').carousel({
            interval: 2000
        });

        //===================================================
        //                  offter slider                   =
        //===================================================

        $('.page_section-2__slider').each(function() {

            var self = $(this),
                get_item = $('.page_section-2__slider .item'),
                get_item_length = get_item.length,
                indicators = $('.page_section-2__slider .carousel-indicators'),
                index = "0";

            for (index; index < get_item_length; index++) {
                indicators.append('<li data-target="#page_section-2__slider" data-slide-to=" ' + index + ' "></li>');
            }

            indicators.find('li:first').addClass('active');
            get_item.first().addClass('active');

            get_item.each(function(i) {
              get_item_name = $(this).find('img').data('name');
              // console.log( "first:" + i + "::" + get_item_name);
              indicators.find('li:eq('+ i +')').html(get_item_name);
            });

            self.each(function(){

               var slideIndex = $(this).find('li.active').text();
               $('#indicatorsTitle').append('<h4>' + slideIndex + '</h4>');

               self.on('slid.bs.carousel', function () {

                  slideIndex = $(this).find('li.active').text();
                  $('#indicatorsTitle h4').html( slideIndex );
                  // console.log( "slide::" + slideIndex );
               });
            });

            $('#btnToggleIndicators').on('click', function(){
               $('.indicators-box').toggleClass('open');
            });
            $('.page_section-2__slider .carousel-indicators li').on('click', function(){
               $('.indicators-box').removeClass('open');
            });

        });

        //===================================================
        //                  products slider                 =
        //===================================================
        $('#product-slider-1, #product-slider-2').owlCarousel({

            autoplay: false,
            rtl: true,
            loop: true,
            margin: 10,
            nav: true,
            dots: false,
            navText: [
                '<div class="btn-controller"><i class="fa fa-chevron-right"></i></div>',
                '<div class="btn-controller"><i class="fa fa-chevron-left"></i></div>'
            ],
            responsive: {
                0: {
                    items: 1
                },
                400: {
                    items: 2
                },
                700: {
                    items: 4
                },
                1020: {
                    items: 5
                },

            }
        });

        $('#product-slider-3').owlCarousel({
            autoplay: false,
            rtl: true,
            loop: true,
            margin: 10,
            nav: true,
            dots: false,
            navText: [
                '<div class="btn-controller"><i class="fa fa-chevron-right"></i></div>',
                '<div class="btn-controller"><i class="fa fa-chevron-left"></i></div>'
            ],
            responsive: {
                0: {
                    items: 1
                },
                400: {
                    items: 2
                },
                700: {
                    items: 4
                },
                1020: {
                    items: 6
                },
            }
        });

    })(jQuery);
});
