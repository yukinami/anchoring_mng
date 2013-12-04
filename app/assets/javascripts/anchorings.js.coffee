# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

active_save_button = ->
  has_select = $(':radio[name^="anchoring"]:checked').size() > 0
  $('#applyModal :submit').prop('disabled', !has_select)

$ ->
  active_save_button()
  $('#applyModal :radio').click ->
    active_save_button()
  
