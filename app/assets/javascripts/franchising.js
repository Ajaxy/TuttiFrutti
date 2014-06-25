
jQuery(document).ready(function() {

    /* Scroll Country List */
    jQuery('.scroll-list').jScrollPane();


    /* Slider */
    $('#slides').slidesjs({
        height: 328,
        navigation: false
      });

    jQuery('#anketa-form').click(function() {
       jQuery('#dark').show();
       jQuery('.modal.modal-anketa').show();
       return false;
    });
    jQuery('.modal.modal-anketa .close a, #dark').click(function() {
       jQuery('#dark').hide();
       jQuery('.modal.modal-anketa').hide();
       return false;
    });


});

function setClear(elem) {
    if (elem.value == elem.defaultValue) {
        elem.value = '';
    }
}

function setDefault(elem) {
    if (!elem.value) {
        elem.value = elem.defaultValue;
    }
}    
$(function() {
    $("textarea").focus(function(event) {

          // Erase text from inside textarea
        $(this).text("");

          // Disable text erase
        $(this).unbind(event);
    });
});