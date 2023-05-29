


import 'package:flextrip/app/modules/nearby_hotels/coffee_model.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

const LatLng currentLocation =LatLng(18.079021, -15.965662);
class test3 extends StatefulWidget {
  const test3({super.key});

  @override
  State<test3> createState() => _test3State();
}


class _test3State extends State<test3> {
  late GoogleMapController mapController;
  Map<String,Marker> _marker={};
  
  // @override
  // void initState() {
  //   // TODO: implement initState
  //   super.initState();
  //   coffeeShops.forEach((element) {
  //     _marker.add(Marker(
  //         markerId: MarkerId(element.shopName),
  //         draggable: false,
  //         infoWindow:
  //             InfoWindow(title: element.shopName, snippet: element.address),
  //         position: element.locationCoords));
  //   });
  //   _pageController = PageController(initialPage: 1, viewportFraction: 0.8)
  //     ..addListener(_onScroll);
  // }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
         body: GoogleMap(
          initialCameraPosition: CameraPosition(
            target:currentLocation,
           zoom: 14,
           ),
           onMapCreated: (controller){
            mapController=controller;
            addmarker('test',currentLocation);
           },
           markers: _marker.values.toSet(),
          ),
    );
  }
  addmarker(String markerId,LatLng location) async{
    var markerIcon = await BitmapDescriptor.fromAssetImage(const ImageConfiguration(), 'assets/icons/hotel.png');
          var marker =Marker(markerId: MarkerId(markerId),
          position: location,
          infoWindow: const InfoWindow(
            title: 'title of places',
            snippet: 'description'
          ),
          icon: markerIcon
          );
          _marker[markerId]=marker;
          setState(() {
            
          });
  }
}