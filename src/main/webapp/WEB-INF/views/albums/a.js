jQuery.noConflict();
		(function($) {
			$(document)
					.ready(
							function() {

								var $map = $('#map');
								$map
										.gmap3({
											map : {
												options : {
													zoom : 5,
													mapTypeId : google.maps.MapTypeId.ROADMAP,
												}
											},
											marker : {
												address : "France, Paris",
												options : {
													draggable : true,
												},
												events : {
													dragend : function(marker,
															event, context) {
														console
																.log(event.latLng);
														console
														.log(event.latLng.pb);
														console
														.log(event.latLng.ob);
														geocoder
																.geocode(
																		{
																			'latLng' : event.latLng
																		},
																		function(
																				results,
																				status) {
																			if (status == google.maps.GeocoderStatus.OK) {
																				$(
																						'#addresspicker_map')
																						.val(
																								results[0].formatted_address);
																				

																			}
																		});
													},
												},
											},
										});
								var marker;
								$map.gmap3({
									get : {
										name : 'marker',
										callback : function(obj) {
											marker = obj;
										}
									}
								});
								var geocoder = new google.maps.Geocoder();
								$('#addresspicker_map')
										.autocomplete(
												{
													source : function(request,
															response) {
														geocoder
																.geocode(
																		{
																			'address' : request.term
																		},
																		function(
																				results,
																				status) {
																			response($
																					.map(
																							results,
																							function(
																									item) {
																								return {
																									value : item.formatted_address,
																									location : item.geometry.location
																								};
																							}));
																		});
													},
													select : function(event, ui) {
														var map = $map
																.gmap3('get');
														console
														.log(ui.item.location.ob);
														console
														.log(ui.item.location.pb);
														map
																.setCenter(ui.item.location);
														map.setZoom(5);
														marker
																.setPosition(ui.item.location);
													}
												});

							});

		})(jQuery);