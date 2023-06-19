import 'package:flextrip/app/modules/transport%20locale/Pages.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'modeles/Trip.dart';


class HomeView extends StatelessWidget {
  final List<Trip> tripsList = [
    Trip("Selama", DateTime.now(), 200.00, "car"),
    Trip("Trarze", DateTime.now(),  450.00, "plane"),
    Trip("bougha", DateTime.now(),  900.00, "bus"),
    Trip("nktt", DateTime.now(),  170.00, "car"),
    Trip("rousso", DateTime.now(),  180.00, "car"),
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      child: new ListView.builder(
          itemCount: tripsList.length,
          itemBuilder: (BuildContext context, int index) =>
              buildTripCard(context, index)),
    );
  }

  Widget buildTripCard(BuildContext context, int index) {
    final trip = tripsList[index];
    return GestureDetector(
      onTap: () {
        Navigator.push(context,
               MaterialPageRoute(builder:(context)=> DropdownScreen()
               ),
              );
      },
      child: new Container(
        child: Card(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(top: 8.0, bottom: 4.0),
                  child: Row(children: <Widget>[
                    Text(trip.title, style: new TextStyle(fontSize: 30.0),),
                    Spacer(),
                  ]),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 4.0, bottom: 80.0),
                  child: Row(children: <Widget>[
                    Text(
                        "${DateFormat('dd/MM/yyyy').format(trip.startDate).toString()} "),
                    Spacer(),
                  ]),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
                  child: Row(
                    children: <Widget>[
                      Text("${trip.budget.toStringAsFixed(2)}", style: new TextStyle(fontSize: 35.0),),
                      Spacer(),
                    //  Text(trip.travelType)
                      Icon(Icons.directions_bus_filled),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );                
  }
}