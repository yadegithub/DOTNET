




// import 'dart:async';

// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flextrip/app/models/room_model.dart';

// import 'package:flutter/material.dart';
// import 'package:get/get.dart';

// import '../../models/booking_model.dart';
// import 'package:firebase_auth/firebase_auth.dart';

// class RoomDetailsScreen extends StatelessWidget {
//   final Room room;

//   const RoomDetailsScreen({Key? key, required this.room}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(room.name),
//       ),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Text(
//               'Room Details',
//               style: Theme.of(context).textTheme.headline4,
//             ),
//             SizedBox(height: 16),
//             Text(room.description),
//             SizedBox(height: 16),
//             Text('Price: ${room.price}'),
//             SizedBox(height: 16),
//             ElevatedButton(
//               onPressed: () => _bookRoom(context),
//               child: Text('Book Room'),
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   void _bookRoom(BuildContext context) async {
//     // Get the user ID from Firebase Auth
//     final user = FirebaseAuth.instance.currentUser;
//     if (user == null) {
//       // User not logged in, show login screen
//       await Get.toNamed('/login');
//       return;
//     }

//     // Create a new booking object
//     final booking = Booking(
//       //userId: user.userId,
//       roomId: room.id,
//       bookingDate: DateTime.now(),
//       check_in_time:DateTime.now() 
//     );

//     // Save the booking to Firebase
//     final bookingRef = FirebaseFirestore.instance.collection('bookings').doc();
//     bookingRef.set(booking.toJson());

//     // Navigate to the checkout screen
//     Get.toNamed('/checkout', arguments: booking);
//   }
// }