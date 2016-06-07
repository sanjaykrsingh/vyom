$('#customer-mobile_no').on('keypress keyup keydown blur', function() {
    //JS Code
     $('#customer-password').val('');
    $('#customer-password').val($(this).val());
});