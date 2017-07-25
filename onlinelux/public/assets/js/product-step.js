requirejs.config({
   "baseUrl": window.location.origin + '/assets/js',
   paths: {
      "common": "common",
      "jquery": "../libs/jquery/dist/jquery",
      "bootstrap": "../libs/bootstrap/dist/js/bootstrap.min",
      "editable": "../libs/jQuery.editable/jquery.editable.min",
      "iCheck": "../libs/iCheck/icheck.min",
   },
   shim: {
      "bootstrap": {
         deps: ["jquery"],
         exports: '$'
      },
      "editable": {
         deps: ["jquery"],
         exports: '$'
      },
      "iCheck": {
         deps: ["jquery"],
         exports: '$'
      },
   },
   enforceDefine: true
});


define([
   "common",
   "bootstrap",
   "editable",
   "iCheck"
], function(
   common,
   bootstrap,
   editable,
   iCheck
) {
   (function($) {


      $('.product-Payment-methods input[type="radio"]').iCheck({
       checkboxClass: 'icheckbox_square',
       radioClass: 'iradio_minimal',
       increaseArea: '50%'
     });

   /*========================================
    =           product-count               =
    ========================================*/

    $('.add-num-control').each(function () {
      var $inc = $(this).find('.increment'),
      $input = $(this).find('input[type=text]'),
      $dec = $(this).find('.decrement'),
      $inputNum = $(this).find('.updatePriceHidden'),
      $defaultValue = $(this).find('.updatePriceHidden'),
      target = $(this).data('target');
      defaultVal = parseInt($defaultValue.val());


      $inc.click(function () {
          var val = parseInt($input.val());
          var valNum = parseInt($inputNum.val());
          $input.val( val + 1);
          $inputNum.val( valNum + defaultVal );
          updateLabel($inputNum.val());
      });

      $dec.click(function () {
          var val = parseInt($input.val());
          var valNum = parseInt($inputNum.val());
          $input.val(Math.max(val - 1, 1));
          $inputNum.val(Math.max( valNum - defaultVal , defaultVal ));
          updateLabel($inputNum.val());
      });

      function updateLabel(num) {
          $(target).text(parseInt(num) );
      }

      updateLabel($inputNum.val() );
    });

   /*========================================
   =           jquery.editable.js           =
   ========================================*/

   var option = {trigger: $("#editable_btn_1"), action: "click"};
   $("#editableName").editable(option, function(e){});

   var option2 = {trigger: $("#editable_btn_2"), action: "click"};
   $("#editableCode").editable(option2, function(e){});

   var option3 = {trigger: $("#editable_btn_3"), action: "click"};
   $("#editableAddress").editable(option3, function(e){});

   var option4 = {trigger: $("#editable_btn_4"), action: "click"};
   $("#editablePhone").editable(option4, function(e){});

   })(jQuery);

});
