
import 'package:flextrip/app/modules/hotel_booking/google_map_ui_view.dart';
import 'package:flextrip/app/modules/hotel_booking/map_hotel_view.dart';
import 'package:flextrip/app/modules/hotel_booking/model/hotel_list_data.dart';
import 'package:flextrip/app/modules/nearby_hotels/lib/screens/home_page.dart';
import 'package:flextrip/app/modules/nearby_hotels/test2.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class SplashScreen extends StatefulWidget {
  //final List<HotelListData> hotelList;
  
   SplashScreen({Key? key,}) : super(key: key);
var hotelList = HotelListData.hotelList;
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.delayed(Duration(seconds: 5)).then((value) => Navigator.of(context)
        .pushReplacement(MaterialPageRoute(builder: (context) => MyHomePage())));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
            height: 200.0,
            width: 200.0,
            child: LottieBuilder.asset('assets/animassets/mapanimation.json')),
      ),
    );
  }
}
