import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_map_marker_cluster/flutter_map_marker_cluster.dart';
import 'package:geolocator/geolocator.dart';
import 'package:latlong2/latlong.dart';
import 'package:map_app/src/data/enums/icon_mark_enum/icon_map_enum.dart';
import 'package:map_app/src/data/enums/selection_map_enum/selection_map_enum.dart';
import 'package:map_app/src/data/models/OSM_search/search_model.dart';
import 'package:map_app/src/data/models/angle_model/angle_model.dart';
import 'package:map_app/src/data/models/layers_model/layer_model.dart';
import 'package:multi_dropdown/multiselect_dropdown.dart';

class UtilsHandler {
  static int count = 0;
  static List<ValueItem> iconSelection = [
    const ValueItem(label: 'Point', value: IconMapEnum.point),
    const ValueItem(label: 'Location', value: IconMapEnum.location),
    const ValueItem(label: 'City', value: IconMapEnum.city)
  ];
  static String overlayLabel = '';
  static List<OSMSearch> suggestion = [];
  static Position currentPosition = Position(
      longitude: 0,
      latitude: 0,
      timestamp: DateTime.now(),
      accuracy: 0,
      altitude: 0,
      altitudeAccuracy: 0,
      heading: 0,
      headingAccuracy: 0,
      speed: 0,
      speedAccuracy: 0);
  static AngleModel angleModel =
      const AngleModel(angle: "0", initialAngle: "0", steps: "0", noOfTurns: 0);
  static List<Marker> tempMarkerList = [];
  static List<LatLng> tempPointList = [];
  static List<LayerModel> layers = [];
  static SelMapEnum selectionMode = SelMapEnum.inactive;
  static bool isCalibrationMode = false;
  static bool isValveActive = false;
  static List<Widget> defaultLayer = [
    TileLayer(
      urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
    ),
    MarkerClusterLayerWidget(
      options: MarkerClusterLayerOptions(
        maxClusterRadius: 45,
        size: const Size(40, 40),
        alignment: Alignment.center,
        padding: const EdgeInsets.all(50),
        maxZoom: 15,
        markers: [
          Marker(
              point:
                  LatLng(currentPosition.latitude, currentPosition.longitude),
              child: Icon(
                Icons.my_location,
                color: Colors.blue[800],
              ))
        ],
        builder: (context, markers) {
          return Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20), color: Colors.blue),
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
  ];
}
