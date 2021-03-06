$(function() {
	"use strict";
	var mapData = {
			"US": 298,
			"SA": 200,
            "AU": 760,
            "CA": 870,
			"IN": 2000000,
			"GB": 120,
		};
	
	if( $('#world-map-markers').length > 0 ){
		$('#world-map-markers').vectorMap(
		{
			map: 'world_mill_en',
			backgroundColor: 'transparent',
			borderColor: '#fff',
			borderOpacity: 0.25,
			borderWidth: 0,
			color: '#e6e6e6',
			regionStyle : {
				initial : {
				  fill : '#454e57'
				}
			  },

			markerStyle: {
                initial: {
                            r: 5,
                            'fill': '#fff',
                            'fill-opacity':1,
                            'stroke': '#000',
                            'stroke-width' : 1,
                            'stroke-opacity': 0.4
                        },
                },
		   
            markers: [
                { latLng: [37.09,-95.71], name: 'America' },
                { latLng : [25.20, 55.27], name : 'UAE : 250' },
                { latLng: [-25.27, 133.77], name: 'Australia' },
                { latLng: [56.13,-106.34], name: 'Canada' },
                { latLng: [20.59,78.96], name: 'India' },
                { latLng: [55.37,-3.43], name: 'United Kingdom' },
            ],

			series: {
				regions: [{
					values: {
						"US": '#72c2ff',
						"SA": '#00ced1',
						"AU": '#a890d3',
						"IN": '#fda582',
                        "GB": '#ff758e',
                        "CA": '#ff758e',
					},
					attribute: 'fill'
				}]
			},
			hoverOpacity: null,
			normalizeFunction: 'linear',
			zoomOnScroll: false,
			scaleColors: ['#000000', '#000000'],
			selectedColor: '#000000',
			selectedRegions: [],
			enableZoom: false,
			hoverColor: '#fff',
		});
    }
    $('#india').vectorMap({
        map : 'in_mill',
        backgroundColor : 'transparent',
        regionStyle : {
            initial : {
                fill : '#fda582'
            }
        }
    });
    $('#usa').vectorMap({
        map : 'us_aea_en',
        backgroundColor : 'transparent',
        regionStyle : {
            initial : {
                fill : '#72c2ff'
            }
        }
    });     
    $('#australia').vectorMap({
        map : 'au_mill',
        backgroundColor : 'transparent',
        regionStyle : {
            initial : {
                fill : '#a890d3'
            }
        }
    });        
    $('#uk').vectorMap({
        map : 'uk_mill_en',
        backgroundColor : 'transparent',
        regionStyle : {
            initial : {
                fill : '#00ced1'
            }
        }
    });
});