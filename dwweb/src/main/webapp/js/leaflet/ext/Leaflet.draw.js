/**
 * Leaflet.draw assumes that you have already included the Leaflet library.
 */
L.drawVersion = '0.4.2';
/**
 * @class L.Draw
 * @aka Draw
 *
 *
 * To add the draw toolbar set the option drawControl: true in the map options.
 *
 * @example
 * ```js
 *      var map = L.map('map', {drawControl: true}).setView([51.505, -0.09], 13);
 *
 *      L.tileLayer('http://{s}.tile.osm.org/{z}/{x}/{y}.png', {
 *          attribution: '&copy; <a href="http://osm.org/copyright">OpenStreetMap</a> contributors'
 *      }).addTo(map);
 * ```
 *
 * ### Adding the edit toolbar
 * To use the edit toolbar you must initialise the Leaflet.draw control and manually add it to the map.
 *
 * ```js
 *      var map = L.map('map').setView([51.505, -0.09], 13);
 *
 *      L.tileLayer('http://{s}.tile.osm.org/{z}/{x}/{y}.png', {
 *          attribution: '&copy; <a href="http://osm.org/copyright">OpenStreetMap</a> contributors'
 *      }).addTo(map);
 *
 *      // FeatureGroup is to store editable layers
 *      var drawnItems = new L.FeatureGroup();
 *      map.addLayer(drawnItems);
 *
 *      var drawControl = new L.Control.Draw({
 *          edit: {
 *              featureGroup: drawnItems
 *          }
 *      });
 *      map.addControl(drawControl);
 * ```
 *
 * The key here is the featureGroup option. This tells the plugin which FeatureGroup contains the layers that
 * should be editable. The featureGroup can contain 0 or more features with geometry types Point, LineString, and Polygon.
 * Leaflet.draw does not work with multigeometry features such as MultiPoint, MultiLineString, MultiPolygon,
 * or GeometryCollection. If you need to add multigeometry features to the draw plugin, convert them to a
 * FeatureCollection of non-multigeometries (Points, LineStrings, or Polygons).
 */
L.Draw = {};

/**
 * @class L.drawLocal
 * @aka L.drawLocal
 *
 * The core toolbar class of the API — it is used to create the toolbar ui
 *
 * @example
 * ```js
 *      var modifiedDraw = L.drawLocal.extend({
 *          draw: {
 *              toolbar: {
 *                  buttons: {
 *                      polygon: 'Draw an awesome polygon'
 *                  }
 *              }
 *          }
 *      });
 * ```
 *
 * The default state for the control is the draw toolbar just below the zoom control.
 *  This will allow map users to draw vectors and markers.
 *  **Please note the edit toolbar is not enabled by default.**
 */
L.drawLocal = {
	// format: {
	// 	numeric: {
	// 		delimiters: {
	// 			thousands: ',',
	// 			decimal: '.'
	// 		}
	// 	}
	// },
	draw: {
		toolbar: {
			// #TODO: this should be reorganized where actions are nested in actions
			// ex: actions.undo  or actions.cancel
			actions: {
				title: '그리기 취소',
				text: '취소'
			},
			finish: {
				title: '그리기 종료',
				text: '종료'
			},
			undo: {
				title: '마지막 지점 삭제 하기',
				text: '마미작 지점 삭제'
			},
			buttons: {
				polyline: '거리 측정',
				polygon: '면적 측정',
				rectangle: '사각형 면적 측정',
				circle: '반경 측정',
				marker: '기본마커',
				circlemarker: '원형마커'
			}
		},
		handlers: {
			circle: {
				tooltip: {
					start: '지도 클릭 후  드래그해서 반경 측정'
				},
				radius: '원형'
			},
			circlemarker: {
				tooltip: {
					start: '원하는 위치 클릭하여 원형마커 등록'
				}
			},
			marker: {
				tooltip: {
					start: '원하는 위치 클릭하여 기본마커 등록'
				}
			},
			polygon: {
				tooltip: {
					start: '지도를 클릭하여 면적측정 시작',
					cont: '측정하고자 하는 지점을 계속 클릭',
					end: '첫번째 지점을 클릭하면 그리기 종료'
				}
			},
			polyline: {
				error: '<strong>Error:</strong> shape edges cannot cross!',
				tooltip: {
					start: '지도를 클릭하고 거리측정을 시작',
					cont: '계속해서 지도를 클릭하여 거리측정',
					end: '마지막 지점을 클릭하면 측정이 완료 됩니다.'
				}
			},
			rectangle: {
				tooltip: {
					start: '지도 클릭 후 드래그해서 사각형 그리기'
				}
			},
			simpleshape: {
				tooltip: {
					end: '마우스 클릭을 해제하면 그리기가 종료 됩니다.'
				}
			}
		}
	},
	edit: {
		toolbar: {
			actions: {
				save: {
					title: '변경내용 저장',
					text: '저장'
				},
				cancel: {
					title: '수정 취소, 변경내용 전체 취소',
					text: '취소'
				},
				clearAll: {
					title: '모든 그리기 삭제',
					text: '삭제'
				}
			},
			buttons: {
				edit: 'Edit layers',
				editDisabled: 'No layers to edit',
				remove: 'Delete layers',
				removeDisabled: 'No layers to delete'
			}
		},
		handlers: {
			edit: {
				tooltip: {
					text: 'Drag handles or markers to edit features.',
					subtext: 'Click cancel to undo changes.'
				}
			},
			remove: {
				tooltip: {
					text: 'Click on a feature to remove.'
				}
			}
		}
	}
};
