$ ->
  $('select#story_country').change (event) ->
  	select_wrapper = $('#story_state_wrapper')
  	$('select', select_wrapper).attr('disabled', true)
  	country = $(this).val()
  	url = "/stories/subregion_options?parent_region=#{country}"
  	select_wrapper.load(url)
