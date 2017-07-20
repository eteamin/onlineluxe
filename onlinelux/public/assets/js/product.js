var base_url = window.origin;
requirejs.config({
    "baseUrl": base_url + "/assets/js",
    paths: {
        "common": "common",
        "jquery": "../libs/jquery/dist/jquery",
        "bootstrap": "../libs/bootstrap/dist/js/bootstrap.min",
        "raty": "../libs/raty/lib/jquery.raty",
        "select2": "../libs/select2/dist/js/select2.full.min",
        "icheck": "../libs/iCheck/icheck.min",
        "scrollIt": "../libs/ScrollIt/scrollIt.min",
        "waypoints": "../libs/waypoints/lib/jquery.waypoints",
        "jcarousel": "../libs/PikaChoose/lib/jcarousel.min",
        "pikachoose": "../libs/PikaChoose/lib/jquery.pikachoose.full",
    },
    shim: {
        "bootstrap": {
            deps: ["jquery"],
            exports: '$'
        },
        "raty": {
            deps: ["jquery"],
            exports: "$"
        },
        "select2": {
            deps: ["jquery"],
            exports: '$'
        },
        "icheck": {
            deps: ["jquery"],
            exports: '$'
        },
        "scrollIt": {
            deps: ["jquery"],
            exports: '$'
        },
        "waypoints": {
            deps: ["jquery"],
            exports: '$'
        },
        "jcarousel": {
            deps: ["jquery"],
            exports: '$'
        },
        "pikachoose": {
            deps: ["jcarousel"],
            exports: '$'
        }

    },
    enforceDefine: true
});


define([
    "common",
    "bootstrap",
    "raty",
    "icheck",
    "select2",
    "scrollIt",
    "waypoints",
    "pikachoose"
], function(
    common,
    bootstrap,
    raty,
    icheck,
    select2,
    scrollIt,
    waypoints,
    pikachoose
) {
    (function($) {

      $("#pikame").PikaChoose({
         carousel:true,
      });

      /*========================================
       =               add to cart             =
       ========================================*/

        var cart = $('.shopping-cart'),
             cartCountCont = cart.find('.add-to-cart__count'),
             cartCount = parseInt(cartCountCont.text(), 10),
             addToCart = $('.btn-add-to-cart'),
             compare = $('.compare'),
             btnCompare = $('.btn-compare');

         addToCart.on('click', function (evt) {

           evt.preventDefault();
           evt.stopPropagation();

           cart.addClass('is-add');
           cart.addClass('clicked');
           cart.one('webkitAnimationEnd oanimationend msAnimationEnd animationend',
           function (e) {
               cart.removeClass('clicked');
           });

           cartCount += 1;
           cartCountCont.text(cartCount);

         });

         btnCompare.on('click', function () {
            compare.toggleClass('active');
         });

        /*========================================
         =           fixed navbar                =
         ========================================*/

         $.scrollIt();

         $('.page-product_details').waypoint(function(direction) {
            
            if (direction === 'down') {
               $('.product_details__menu').addClass('fixed');

            } else {
                $('.product_details__menu').removeClass('fixed');
            }
         });

        $('.page-product_details ul li:first').addClass('active');

        /*========================================
         =           bootstrap-tooltip           =
         ========================================*/

        $('[data-toggle="tooltip"]').tooltip();

        /*========================================
         =           bootstrap-slider.js         =
         ========================================*/
        $('.stars').raty({
            readOnly: true,
            starType: 'i',
            score: function() {
                return $(this).attr('data-score');
            }
        });

        /*========================================
        =                 select2.js             =
        ========================================*/

        $(".select-simple").select2({
            minimumResultsForSearch: Infinity,
            dir: "rtl"
        });

        /*========================================
        =                 icheck.js             =
        ========================================*/

        $('.product-favorite input').each(function() {
            var self = $(this),
                label = self.next(),
                label_text = label.text();

            label.remove();
            self.iCheck({
                checkboxClass: 'icheckbox_line',
                radioClass: 'iradio_line',
                insert: '<div class="icon-1"></div>'
            });
        });

        $('#selectColor li input').each(function() {
            var self = $(this),
                label = self.next(),
                label_text = label.text(),
                colorVal = self.data('color');

            label.remove();
            self.iCheck({
                checkboxClass: 'icheckbox_line',
                radioClass: 'iradio_line',
                insert: '<div class="selectColor-bg"></div>' + label_text
            });

            self.next('.selectColor-bg').css('background-color', colorVal);

        });

        /*========================================
        =                 select2.js             =
        ========================================*/

        $(".select-simple").select2({
            minimumResultsForSearch: Infinity,
            dir: "rtl"
        });


    })(jQuery);

});
