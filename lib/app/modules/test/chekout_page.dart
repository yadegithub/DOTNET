

import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flextrip/app/models/booking_model.dart';
import 'package:flextrip/app/models/room_model.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'feature/detail_destionation/controllers/RoomControler.dart';
class CheckoutScreen extends StatelessWidget {
  final Booking booking;

  CheckoutScreen({Key? key,required this.booking}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
       final room = Get.find<RoomController>().getRoomById(booking.roomId);
    //     final Map<String, dynamic>? arguments = Get.arguments;
    //     if(arguments == null){
    //       return Scaffold(
    //         appBar: AppBar(
    //           title: Text('yade'),
    //         ),
    //       );
    //     }
    // final Booking booking = arguments['Booking'] as Booking;
    // final Room room = arguments['room'] as Room;


    //final room = Get.find<RoomController>();
  // final Map<String, dynamic> roomData = Get.arguments;
    return Scaffold(
      appBar: AppBar(
        title: Text('Checkout'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Booking Details',
              style: Theme.of(context).textTheme.headline4,
            ),
            SizedBox(height: 16),
             Text('Room Name: ${booking.breakfast}'),
            SizedBox(height: 16),
            Text('Booking Date: ${booking.check_in_time}'),
            SizedBox(height: 16),
            // ElevatedButton(
            //   child: Text('Checkout'),
            //  onPressed: () {
            //     Get.to(
            //     CheckoutScreen(),
            //   arguments: {
            //   'booking': booking,
            //    'room': room,
            //   },);
            //      }
            // ),
          ],
        ),
      ),
    );
  }

  void _confirmBooking(BuildContext context) async {
    // Update the booking status in Firebase
  //   final bookingRef = FirebaseFirestore.instance.collection('Booking').doc(booking.id);
  //   bookingRef.update({'status': 'confirmed'});

  // //  Update the room availability status in Firebase
  //   final roomRef = FirebaseFirestore.instance.collection('room').doc(booking.roomId);
  //   roomRef.update({'isAvailable': false});

    // Show a confirmation message
    // await Get.dialog(AlertDialog(
    //   title: Text('Booking Confirmed'),
    //   content: Text('Your booking has been confirmed.'),
    //   actions: [
    //     TextButton(
    //       onPressed: () => Get.offAllNamed('/'),
    //       child: Text('OK'),
    //     ),
    //   ],
    // ));
  }
}