requirejs.config({
   "baseUrl": "assets/js",
   paths: {
      "common": "common",
      "jquery": "../libs/jquery/dist/jquery",
      "bootstrap": "../libs/bootstrap/dist/js/bootstrap.min",
      "bootstrapSlider": "../libs/seiyria-bootstrap-slider/dist/bootstrap-slider",
   },
   shim: {
      "bootstrap": {
         deps: ["jquery"],
         exports: '$'
      },
      "bootstrapSlider": {
          deps: ["jquery"],
          exports: "$"
      },
   },
   enforceDefine: true
});


define([
   "common",
   "bootstrap",
   "bootstrapSlider"
], function(
   common,
   bootstrap,
   bootstrapSlider
) {
   (function($) {

   /*========================================
    =           bootstrap-slider.js         =
    ========================================*/

      $("#priceSlider").slider({
          tooltip_split: false,
          tooltip: "hide"
      });
      $("#priceSlider").on("slide", function( slideEvt ) {
       $("#lbl1").text(slideEvt.value[0]);
       $("#lbl2").text(slideEvt.value[1]);
      });

      /*========================================
      =             accordion.js               =
      ========================================*/
      function toggleChevron(e) {
        $(e.target)
            .prev('.panel-heading')
            .find("i.fa")
            .toggleClass('fa-chevron-left fa-chevron-down');
      }
      $('#accordion').on('hidden.bs.collapse', toggleChevron);
      $('#accordion').on('shown.bs.collapse', toggleChevron);

   })(jQuery);

});
