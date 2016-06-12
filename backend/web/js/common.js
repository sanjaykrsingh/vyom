$('#customer-mobile_no').on('keypress keyup keydown blur', function() {
    //JS Code
     $('#customer-password').val('');
    $('#customer-password').val($(this).val());
});


$(document).ready(function() {
    
    $("#activitiesForm").validate();
    
    // Initialize the date picker for the original due date field
    $('body').on('focus',".addDatePicker", function(){
         $(this).datepicker({
            format: 'yyyy-mm-dd'
        }).on('changeDate', function(evt) {
            // Revalidate the date field
        });
    });
    
   
    $('#activitiesForm')
        // Add button click handler
        .on('click', '.addButton', function(e, data) {
            
            var $template = $('#taskTemplate'),
                $clone    = $template
                                .clone()
                                .removeClass('hide')
                                .removeAttr('id')
                                .insertBefore($template);

            $( "input[name*='Activities[valid_from][]']" )
                    .parent()
                    .datepicker({
                        format: 'yyyy-mm-dd'
                    })
                    .on('changeDate', function(evt) {
                        // Revalidate the date field
                        
                    });
            
             $( "input[name*='Activities[valid_to][]']" )
                    .parent()
                    .datepicker({
                        format: 'yyyy-mm-dd'
                    })
                    .on('changeDate', function(evt) {
                        // Revalidate the date field
                      });
           
            
        })

        // Remove button click handler
        .on('click', '.removeButton', function() {
            var $row = $(this).closest('.form-group');

            // Remove fields
        

            // Remove element containing the fields
            $row.remove();
        });
});