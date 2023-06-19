import 'package:flextrip/app/modules/transport%20locale/views/modeles/Trip.dart';
import 'package:flutter/material.dart';

import 'package:cloud_firestore/cloud_firestore.dart';

class NewTripBudgetView extends StatelessWidget {
  final db = FirebaseFirestore.instance;

  final Trip trip;
  NewTripBudgetView({Key? key, required this.trip}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Scaffold(
        appBar: AppBar(
          title: Text('Create Trip - Budget'),
        ),
        body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text("Finish"),
                Text("Location ${trip.title}"),
                Text("Start Date ${trip.startDate}"),
              //  Text("End Date ${trip.endDate}"),

              ElevatedButton(
                  child: Text("Finish"),
                  onPressed: () async {
                    // save data to fiebase
                    await db.collection("trips").add(trip.toJson());
                    
                    Navigator.of(context).popUntil((route) => route.isFirst);
                  },
                ),
              ],
            )
        )
    );
  }
}