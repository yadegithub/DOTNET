import 'package:flextrip/app/modules/order/components/order_detail_button.dart';
import 'package:flextrip/app/modules/order/components/order_detail_facilities.dart';
import 'package:flextrip/app/modules/order/components/order_detail_flight.dart';
import 'package:flextrip/app/modules/order/components/order_detail_header.dart';
import 'package:flextrip/app/modules/order/components/order_detail_price.dart';
import 'package:flextrip/styles/styles.dart';
import 'package:flextrip/widgets/pages/page_default.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class OrderDetailView extends StatelessWidget {
  const OrderDetailView({super.key});

  @override
  Widget build(BuildContext context) {
    return PageDefault(
      title: 'ticketConfirmation'.tr,
      bottomBarHeight: 150.w,
      bottomBar: const OrderDetailButton(),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: Insets.xl),
        child: SingleChildScrollView(
          child: Column(
            children: const [
              OrderDetailHeader(),
              OrderDetailFlight(),
              OrderDetailFacilities(),
              OrderDetailPrice(),
            ],
          ),
        ),
      ),
    );
  }
}
