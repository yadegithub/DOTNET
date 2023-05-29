
import 'package:flextrip/app/models/booking_model.dart';
import 'package:flextrip/app/modules/hotel%20booking/feature/detail_destionation/controllers/booking_controller.dart';
import 'package:flextrip/styles/styles.dart';
import 'package:flextrip/widgets/pages/page_default.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'feature/detail_destionation/components/ticket_detail_flight.dart';

class TicketDetailView extends GetView<BookingController> {
  const TicketDetailView({super.key});
 
  @override
  Widget build(BuildContext context) {
    final bookingData = ModalRoute.of(context)?.settings.arguments as Booking;
    return PageDefault(
      title: 'ticketDetail'.tr,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: Insets.xl),
        child: SingleChildScrollView(
          child: Column(
            children: [
              //TicketDetailHeader(data: controller.data.value),
              TicketDetailFlight(data:bookingData),
             // TicketDetailFacilities(data: controller.data.value),
             // TicketDetailPrice(data: controller.data.value),
            
            ],
          ),
        ),
      ),
    );
  }
}
