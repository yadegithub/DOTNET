import 'package:flutter/material.dart';
import 'package:map_polyline_draw/map_polyline_draw.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapScreen extends StatefulWidget {
  @override
  _MapScreenState createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  GoogleMapController? mapController;
  double _originLatitude = 18.115911043733117, _originLongitude = -15.97781673288101;
  double _destLatitude = 18.099994211636087, _destLongitude = -15.974153302976566;
  Set<Marker> markers = {};
  Set<Polyline> polylines = {};

  @override
  void initState() {
    super.initState();
    _addMarker(LatLng(_originLatitude, _originLongitude), "origin");
    _addMarker(LatLng(_destLatitude, _destLongitude), "destination");
    _getPolyline();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: GoogleMap(
          initialCameraPosition: CameraPosition(
            target: LatLng(_originLatitude, _originLongitude),
            zoom: 15,
          ),
          onMapCreated: (controller) {
            mapController = controller;
          },
          markers: markers,
          polylines: polylines,
        ),
      ),
    );
  }

  void _addMarker(LatLng position, String markerId) {
    markers.add(
      Marker(
        markerId: MarkerId(markerId),
        position: position,
        icon: BitmapDescriptor.defaultMarker,
      ),
    );
  }

  void _addPolyline(List<LatLng> polylineCoordinates) {
    polylines.add(
      Polyline(
        polylineId: PolylineId("polyline"),
        points: polylineCoordinates,
        color: Colors.red,
        width: 3,
      ),
    );
  }

  void _getPolyline() async {
    // Simulate fetching polyline coordinates
    List<LatLng> polylineCoordinates = [
      LatLng(_originLatitude, _originLongitude),
     // LatLng(18.079021, -15.965662), // Add your actual polyline coordinates here
      LatLng(_destLatitude, _destLongitude),
    ];

    setState(() {
      _addPolyline(polylineCoordinates);
    });
  }
}
