# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/


$(document).ready ->
  $(".delete_todo").click (event) ->
    unless confirm("Are you sure you want to delete this todo?")
      return false