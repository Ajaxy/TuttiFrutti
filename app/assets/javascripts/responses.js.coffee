jQuery ->
  $("#response_phone").mask("+7 (999) 999-99-99", placeholder: " ")
  $("#response_birth_date").datepicker
    changeMonth:  true
    changeYear:   true
    yearRange:    "1910:2000"
    defaultDate:  "-30y"
