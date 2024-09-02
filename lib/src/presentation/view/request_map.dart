import 'dart:convert';

import 'package:autocomplete_textfield/autocomplete_textfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_map_marker_cluster/flutter_map_marker_cluster.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:geolocator/geolocator.dart';
import 'package:latlong2/latlong.dart';
import 'package:map_app/src/core/utils/constants.dart';
import 'package:map_app/src/core/utils/utils_handler.dart';
import 'package:map_app/src/data/enums/selection_map_enum/selection_map_enum.dart';
import 'package:map_app/src/data/models/OSM_model/osm_model.dart';
import 'package:map_app/src/data/models/OSM_search/search_model.dart';
import 'package:map_app/src/presentation/widget/add_layer_modal.dart';
import 'package:map_app/src/presentation/widget/description_layer_modal.dart';
import 'package:map_app/src/presentation/widget/new_request.dart';
import 'package:sizer/sizer.dart';
import 'package:http/http.dart' as http;

class RequestMap extends StatefulWidget {
  const RequestMap({super.key});

  @override
  State<RequestMap> createState() => _RequestMapState();
}

class _RequestMapState extends State<RequestMap> {
  GlobalKey<AutoCompleteTextFieldState<OSMSearch>> key = GlobalKey();
  MapController mapController = MapController();
  TextEditingController suggestController = TextEditingController();
  double headerHeight = 200.0;
  double maxHeight = 600.0;
  bool isDragUp = false;
  double bodyHeight = 0.0;
  String mainName = 'General Santos City Water District',
      subName =
          '45GM+7R7, Fernandez St, General Santos City, 9500 South Cotabato';
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    Position currentPos = UtilsHandler.currentPosition;
    List<Marker> markerList = [
      Marker(
          alignment: Alignment.topCenter,
          point: LatLng(currentPos.latitude, currentPos.longitude),
          child: IconButton(
            icon: const Icon(
              size: 30,
              Icons.location_on_rounded,
              color: Color.fromARGB(255, 36, 126, 230),
            ),
            onPressed: () {
              showDialog(
                  context: context,
                  builder: (context) => DescriptionLayerModal(
                        description: 'This is my current location',
                        latlng:
                            LatLng(currentPos.latitude, currentPos.longitude),
                      ));
            },
          ))
    ];
    return Scaffold(
      appBar: null,
      bottomNavigationBar: BottomAppBar(
        elevation: 70,
        height: headerHeight,
        child: Stack(alignment: Alignment.topCenter, children: <Widget>[
          Positioned(
            top: -19,
            child: Container(
              child: GestureDetector(
                onVerticalDragUpdate: (DragUpdateDetails data) {
                  double draggedAmount = size.height - data.globalPosition.dy;
                  setState(() {
                    isDragUp = true;
                    if (draggedAmount >= 200 && draggedAmount <= 400) {
                      headerHeight = draggedAmount;
                    } else {
                      if (draggedAmount > 398) {
                        headerHeight = 200;
                        showMenu();
                      }
                    }
                  });
                },
                onVerticalDragEnd: (val) {
                  isDragUp = false;
                  setState(() {
                    headerHeight = 200;
                  });
                },
                child: FaIcon(
                  FontAwesomeIcons.minus,
                  size: isDragUp ? 52 : 50,
                  color: isDragUp
                      ? const Color.fromARGB(255, 36, 126, 230)
                      : Colors.grey,
                ),
              ),
            ),
          ),
          Positioned(
              top: 30,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  const Icon(
                    size: 30,
                    Icons.location_on_outlined,
                    color: Color.fromARGB(255, 36, 126, 230),
                  ),
                  SizedBox(
                    width: 60.w,
                    child: Column(
                      children: [
                        Text(
                          mainName,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16.sp,
                          ),
                        ),
                        Text(
                          subName,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 10.sp,
                          ),
                        ),
                      ],
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      showMenu();
                    },
                    icon: const Icon(
                      size: 30,
                      Icons.edit,
                      color: Color.fromARGB(255, 36, 126, 230),
                    ),
                  ),
                ],
              )),
          Positioned(
              bottom: headerHeight - 202,
              child: ElevatedButton(
                  onPressed: () {
                    final sendPoint = UtilsHandler.currentPosition;
                    // showDialog(
                    //     context: context,
                    //     builder: (context) => AddLayerModal(pointList: [
                    //           LatLng(sendPoint.latitude, sendPoint.longitude)
                    //         ]));
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => NewRequest(
                            address: "$mainName $subName",
                            latitude: sendPoint.latitude.toString(),
                            longitude: sendPoint.longitude.toString())));
                  },
                  style: ElevatedButton.styleFrom(
                      backgroundColor: const Color.fromARGB(255, 36, 126, 230),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(7))),
                  child: SizedBox(
                    width: 30.w,
                    child: const Center(
                      child: Text(
                        'SEND REQUEST',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  )))
        ]),
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: () async {
            await Geolocator.getCurrentPosition(
                    desiredAccuracy: LocationAccuracy.high)
                .then((Position position) {
              UtilsHandler.currentPosition = position;
              mainName = 'General Santos City Water District';
              subName =
                  '45GM+7R7, Fernandez St, General Santos City, 9500 South Cotabato';
            });
            final myPosition = UtilsHandler.currentPosition;
            mapController.move(
                LatLng(myPosition.latitude, myPosition.longitude), 18);
            setState(() {
              UtilsHandler.selectionMode = SelMapEnum.inactive;
              UtilsHandler.tempMarkerList = [];
              UtilsHandler.tempPointList = [];
              UtilsHandler.overlayLabel = '';
            });
          },
          child: const Icon(
            Icons.my_location,
            color: Color.fromARGB(255, 36, 126, 230),
          )),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 90.h,
              child: FlutterMap(
                mapController: mapController,
                options: MapOptions(
                    initialCenter:
                        LatLng(currentPos.latitude, currentPos.longitude),
                    initialZoom: 18,
                    maxZoom: 30,
                    onTap: (tap, latlng) async {
                      UtilsHandler.currentPosition = Position(
                          longitude: latlng.longitude,
                          latitude: latlng.latitude,
                          timestamp: DateTime.now(),
                          accuracy: 100,
                          altitude: 0,
                          altitudeAccuracy: 0,
                          heading: 0,
                          headingAccuracy: 0,
                          speed: 0,
                          speedAccuracy: 0);
                      try {
                        final placeJson = await http
                            .get(Uri.https(kHost, '/reverse', {
                              'format': 'geojson',
                              'lat': latlng.latitude.toStringAsFixed(2),
                              'lon': latlng.longitude.toStringAsFixed(2),
                              'zoom': '18',
                              'addressdetails': '1'
                            }))
                            .timeout(const Duration(seconds: 60));
                        if (placeJson.statusCode == 200) {
                          setState(() {
                            final osmReverseFromMap =
                                OSMModel.fromJson(jsonDecode(placeJson.body));
                            final features = osmReverseFromMap.features;
                            if (features != null) {
                              for (var feature in features) {
                                final property = feature.properties;
                                if (property != null) {
                                  mainName = property.name ?? mainName;
                                  subName = property.display_name ?? subName;
                                }
                              }
                            }
                            print(osmReverseFromMap);
                            // UtilsHandler.suggestion = searchListFromMap;
                          });
                        } else {
                          throw Exception('Failed to load predictions');
                        }
                      } catch (e) {
                        print(e);
                      }
                      setState(() {});
                      print('$latlng tap');
                    },
                    onLongPress: (tap, latlng) {
                      print('$latlng longtap');
                    }),
                children: <Widget>[
                  TileLayer(
                    urlTemplate:
                        'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
                  ),
                  MarkerClusterLayerWidget(
                    options: MarkerClusterLayerOptions(
                      maxClusterRadius: 45,
                      size: const Size(40, 40),
                      alignment: Alignment.center,
                      padding: const EdgeInsets.all(50),
                      maxZoom: 15,
                      markers: markerList,
                      builder: (context, markers) {
                        return Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: Colors.blue),
                          child: Center(
                            child: Text(
                              markers.length.toString(),
                              style: const TextStyle(color: Colors.white),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  onChanged() {
    getSuggestion(suggestController.text);
  }

  void getSuggestion(String input) async {
    try {
      final searchJson = await http
          .get(Uri.https(kHost, '/search', {'q': input, 'format': 'json'}))
          .timeout(const Duration(seconds: 60));
      if (searchJson.statusCode == 200) {
        setState(() {
          final searchResponse =
              List<Map<String, dynamic>>.from(jsonDecode(searchJson.body));
          final searchListFromMap =
              searchResponse.map(OSMSearch.fromJson).toList();
          UtilsHandler.suggestion = searchListFromMap;
        });
      } else {
        throw Exception('Failed to load predictions');
      }
    } catch (e) {
      print(e);
    }
  }

  showMenu() {
    OSMSearch selected;
    String payload = '/reverse%3Fformat=jsonv2&lat=-34.44076&lon=-58.70521';
    showModalBottomSheet(
        context: context,
        builder: (BuildContext context) {
          return Container(
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(16.0),
                topRight: Radius.circular(16.0),
              ),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: <Widget>[
                Container(
                  height: 36,
                ),
                SizedBox(
                    height: (56 * 6).toDouble(),
                    child: Container(
                        decoration: const BoxDecoration(
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(16.0),
                            topRight: Radius.circular(16.0),
                          ),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                            Align(
                              alignment: Alignment.topCenter,
                              child: TextField(
                                controller: suggestController,
                                onChanged: onChanged(),
                                decoration: InputDecoration(
                                  hintText: "Search your location here",
                                  focusColor: Colors.white,
                                  floatingLabelBehavior:
                                      FloatingLabelBehavior.never,
                                  prefixIcon: const Icon(Icons.map),
                                  suffixIcon: IconButton(
                                    icon: const Icon(Icons.cancel),
                                    onPressed: () {
                                      suggestController.clear();
                                    },
                                  ),
                                ),
                              ),
                            ),
                            Expanded(
                              child: ListView.builder(
                                physics: const NeverScrollableScrollPhysics(),
                                shrinkWrap: true,
                                itemCount: UtilsHandler.suggestion.length,
                                itemBuilder: (context, index) {
                                  return GestureDetector(
                                    onTap: () async {},
                                    child: ListTile(
                                      title: Text(
                                          UtilsHandler.suggestion[index].name!),
                                    ),
                                  );
                                },
                              ),
                            )
                          ],
                        ))),
                Container(
                  height: 56,
                  color: const Color(0xff4a6572),
                )
              ],
            ),
          );
        });
  }
}
