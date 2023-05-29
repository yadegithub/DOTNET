



import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flextrip/app/models/booking_model.dart';
import 'package:flextrip/app/modules/hotel%20booking/chekout_page.dart';
import 'package:flextrip/app/modules/hotel%20booking/feature/detail_destionation/controllers/RoomControler.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BookingController extends GetxController {
  final _db = DatabaseService();
  List<Booking> bookings=[];

  get to => Get.find<BookingController>();
  Rx<Booking> data =  Booking().obs;

  @override
  void onInit() {
    Get.put(BookingController());
    final args = Get.arguments;
    if (args != null) {
      data.value = args['data'];
    }
    super.onInit();
  }
List<Booking> getBookings(){
  return bookings;
}

  Future<void> init() async {
Get.put(Booking());
  //Get.put(JobListController());
}
}


  // void checkout(Map<String, dynamic> bookingData, Map<String, dynamic> roomData) {
  //   _db.createBooking(bookingData).then((bookingId) {
  //     final booking = {...bookingData, 'id': bookingId}; // Include booking ID in the booking object
  //     Get.to(() => CheckoutScreen());
  //   });
  // }
  // // ...
