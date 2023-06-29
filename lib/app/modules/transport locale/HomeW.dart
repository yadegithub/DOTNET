

import 'package:flextrip/app/modules/transport%20locale/views/modeles/Trip.dart';
import 'package:flextrip/app/modules/transport%20locale/views/new_trips/location_view.dart';
import 'package:flutter/material.dart';


import 'views/home_view.dart';
import 'Pages.dart';



class Home extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _HomeState();
  }
}

class _HomeState extends State<Home> {
  int _currentIndex = 0;
  final List<Widget> _children = [
    HomeView(),
  DropdownScreen (),
//DropdownScreen ()
   //  DropDownHelper(),
   
   //TicketData(),
  // DropdownScre()
   PageH(),
  //  PastTripsPage(),
  ];

  @override
  Widget build(BuildContext context) {
    final  newTrip= new Trip('',   DateTime.now(), 12, );
    return Scaffold(
     // const HomeHeader(),
      appBar: AppBar(
        title: Text("Travel Budget App"),
        backgroundColor: Color(0xFF26A69A),
        actions: <Widget>[
          IconButton(
            icon:Icon(Icons.add),
            onPressed: () {
              Navigator.push(context,
               MaterialPageRoute(builder:(context)=>NewTripLocationView( trip: newTrip,)
               ),
              );
            },
          
          )
        ],
      ),
      body:HomeView(),
      
      // bottomNavigationBar: BottomNavigationBar(
      //     onTap: onTabTapped,
      //    currentIndex: _currentIndex,
      //     items: [
      //       BottomNavigationBarItem(
      //             label: 'Home',
      //         icon: new Icon(Icons.home),
      //    //     title: new Text("Home"),
      //       ),
      //       BottomNavigationBarItem(
      //          label: 'Explore',
      //         icon: new Icon(Icons.explore),
      //        // title: new Text("Explore"),
      //       ),
      //       BottomNavigationBarItem(
      //          label: 'History',
      //         icon: new Icon(Icons.history),
      //        // title: new Text("Past Trips"),
      //       ),
          
      //        // title: new Text("Past
      //         //BottomNavigationBarItem(
      //        //  label: 'Star',
      //      //   icon: new Icon(Icons.star),
      //        // title: new Text("Past Trips"),
      //     //  ),
      //    //  BottomNavigationBarItem(
      //     //   label: '  Person',
      //     //  icon: new Icon(Icons.person),
      //        // title: new Text("Explore"),
      //      // ),
      //     ]
      // ),
    );
  }

  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }
}