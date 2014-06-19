$ ->
  screen_size = $( window ).width()
  achivements = $(".achivement")
  for value, key in achivements
    current_achivement = $(achivements[key])
    previous_achivement = $(achivements[key-1])
    property = "top"

    if screen_size > 1024
      property = "left"

    unless key == 0
      current_achivement.css( property, calculateDistance( achivements.length, key, current_achivement.data("endDate"), previous_achivement.data("endDate")))

$(".timeline").css("height", ($(".achivement-info:last").offset().top + $(".timeline").offset().top) )

calculateDistance = (size, key, currentYear, previousYear) ->
  (currentYear - previousYear)/size*30 + key *175
