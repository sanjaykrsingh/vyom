function deleteImage(id, containerId ,type) {
    if(!id) return false; 
    
    //if(!confirm("You want delete this image")) return false;
    ajaxloader.type = 'POST';
    ajaxloader.load("index.php?r=uploaded-file/delete&id="+id, function(data, containerId){
	  if(data != ''){
          var json = $.parseJSON(data);
            console.log(json);    
            if (json.success) {
                  $("#"+containerId).remove();
              } else {
                  var msg = '<strong>There are some errors </strong><br/>';
                 
                 // errorAlert(msg);
              }
	  }
   }, containerId, {'id': id,'type': type});
}

function errorAlert(msg) {
    $('.modal-footer').show(0);
    $('#alertMessage-modal').modal('show')
            .find('#alert-title').html('<strong>Error!</strong>');
    $('#alertMessage-modal').modal('show')
            .find('#alertMessage').html(msg);

}