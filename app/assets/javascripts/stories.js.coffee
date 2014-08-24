$ ->
  $('select#story_country').change (event) ->
  	select_wrapper = $('#story_state_wrapper')
  	$('select', select_wrapper).attr('disabled', true)
  	country = $(this).val()
  	url = "/stories/subregion_options?parent_region=#{country}"
  	select_wrapper.load(url)



  $("#stories .page").infinitescroll
    navSelector: "nav.pagination" # selector for the paged navigation (it will be hidden)
    nextSelector: "nav.pagination a[rel=next]" # selector for the NEXT link (to page 2)
    itemSelector: "#stories div.story" # selector for all items you'll retrieve
    loading:
    	finishedMsg: ""
    	msgText: "Loading more stories..."

# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/