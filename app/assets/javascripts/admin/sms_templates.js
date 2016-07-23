$(document).on('page:load ready', function(){

  $(document).on('change keyup paste', '.sms_template_content', function(){
    calculateSmsCredits();
  })

  calculateSmsCredits();

})

function calculateSmsCredits(){
  debugger;
  var content_length = $('.sms_template_content').val().length
  var credit_count;
  if(content_length < 160){
    credit_count = 1
  } else {
    credit_count = Math.floor(content_length / 160)
  }
  var remainder = content_length % 160
  if(content_length > 160 && remainder > 0){
    credit_count += 1;
  }
  var c_txt;
  if(credit_count > 1){
    c_txt = 'Credit'
  } else {
    c_txt = 'Credits'
  }
  var credit_txt = content_length + ' / ' + credit_count + ' ' + c_txt

  $('.credits_val').html(credit_txt);
  $('.content_length').html(content_length)
  $('.credit_count').html(credit_count)
}

function appendTemplateVariableToSmsTemplate(){
  var template_variable = $('.sms_template_variable_select').val()
  if(template_variable != ''){
    insertAtCaret($('.sms_template_content').attr('id'), template_variable)
    // $('.sms_template_content').val( $('.sms_template_content').val() + " " + template_variable );
    calculateSmsCredits();
  }
}

function insertAtCaret(areaId,text) {
  var txtarea = document.getElementById(areaId);
  var scrollPos = txtarea.scrollTop;
  var strPos = 0;
  var br = ((txtarea.selectionStart || txtarea.selectionStart == '0') ?
      "ff" : (document.selection ? "ie" : false ) );
  if (br == "ie") {
      txtarea.focus();
      var range = document.selection.createRange();
      range.moveStart ('character', -txtarea.value.length);
      strPos = range.text.length;
  }
  else if (br == "ff") strPos = txtarea.selectionStart;

  var front = (txtarea.value).substring(0,strPos);
  var back = (txtarea.value).substring(strPos,txtarea.value.length);
  txtarea.value=front+text+back;
  strPos = strPos + text.length;
  if (br == "ie") {
      txtarea.focus();
      var range = document.selection.createRange();
      range.moveStart ('character', -txtarea.value.length);
      range.moveStart ('character', strPos);
      range.moveEnd ('character', 0);
      range.select();
  }
  else if (br == "ff") {
      txtarea.selectionStart = strPos;
      txtarea.selectionEnd = strPos;
      txtarea.focus();
  }
  txtarea.scrollTop = scrollPos;
}
