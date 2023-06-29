import 'package:flextrip/app/modules/transport%20locale/Pages.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';
import 'modeles/Trip.dart';


class HomeView extends StatelessWidget {
  final List<Trip> tripsList = [
    Trip("Selama", DateTime.now(), 200.00, ),
    Trip("Trarze", DateTime.now(),  450.00, ),
    Trip("bougha", DateTime.now(),  900.00, ),
    Trip("nktt", DateTime.now(),  170.00, ),
    Trip("rousso", DateTime.now(),  180.00,),
  ];
 final number ='+22248223445';
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
                 Row(children: <Widget>[
                    Text(trip.title, style: new TextStyle(fontSize: 30.0),),
                   // Spacer(),
                  ]),
                  SizedBox(height: 5,),
                  Row(children: <Widget>[
                    Text(
                        "${DateFormat('dd/MM/yyyy').format(trip.startDate).toString()} "),
                   // Spacer(),
                  ]),
                  SizedBox(height: 5,),
                   Row(
                    children: <Widget>[
                      Text("${trip.budget.toStringAsFixed(2)}", style: new TextStyle(fontSize: 35.0),),
                      Spacer(),
                    //  Text(trip.travelType)
                      GestureDetector(
                        onTap: ()
                 async{
      await FlutterPhoneDirectCaller.callNumber(number);
     // launch('tel://$numbre');
    },
                        
                        child:
                                          Container(
                    decoration: BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.circular(30.0)
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(6.0),
                      child: Icon(Icons.call_rounded,color: Colors.white,)
                      ,),
                    ),
                  ),
                         Padding(
                           padding: const EdgeInsets.only(left: 5),
                           child: Container(
                                             decoration: BoxDecoration(
                                                 color: Colors.green,
                                                 borderRadius: BorderRadius.circular(30.0)
                                             ),
                                             child: Padding(
                                               padding: const EdgeInsets.all(6.0),
                                               child: Icon(Icons.message,color: Colors.white,)
                                               ,),
                                             ),
                         ), 
                    ],
                  ),
                // Padding(
                //   padding: const EdgeInsets.only(top: 8.0, bottom: 4.0),
                //   child:
                // Row(children: <Widget>[
                //     Text(trip.title, style: new TextStyle(fontSize: 30.0),),
                //     Spacer(),
                //   ]),
                // ),
                // Padding(
                //   padding: const EdgeInsets.only( bottom: 80.0),
                //   child:
                // Row(children: <Widget>[
                //     Text(
                //         "${DateFormat('dd/MM/yyyy').format(trip.startDate).toString()} "),
                //    // Spacer(),
                //   ]),
                // ),
    //             Padding(
    //               padding: const EdgeInsets.only( bottom: 8.0),
    //               child:
    // Row(
    //                 children: <Widget>[
    //                   Text("${trip.budget.toStringAsFixed(2)}", style: new TextStyle(fontSize: 35.0),),
    //                   Spacer(),
    //                 //  Text(trip.travelType)
    //                   GestureDetector(
    //                     onTap: ()
    //              async{
    //   await FlutterPhoneDirectCaller.callNumber(number);
    //  // launch('tel://$numbre');
    // },
                        
    //                     child:
    //                      Icon(Icons.directions_bus_filled)),
    //                 ],
    //               ),
    //             )
    //           ],
    //         ),
    //       ),
              ],
        
      ),
    )
      )  
    ));          
  }
}