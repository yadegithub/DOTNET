
import 'package:flextrip/app/models/room_model.dart';
import 'package:flextrip/app/models/ticket_booking_model.dart';
import 'package:flextrip/app/modules/hotel%20booking/feature/detail_destionation/controllers/booking_controller.dart';
import 'package:flextrip/styles/styles.dart';
import 'package:flextrip/utils/app_asset.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../../../../../styles/colors.dart';
import '../../../../../../utils/format_date_time.dart';
import '../../../../../../widgets/cards/card_app.dart';
import '../../../../../models/booking_model.dart';

class TicketDetailFlight extends StatelessWidget {
 // var data = Get.find<BookingController>();
  final bookingController = Get.find<BookingController>();
   // final List<Booking> bookings = bookingController.getBookings();
  final Booking data ;
   TicketDetailFlight({super.key, required this.data});

  

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: Insets.xs),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('flightDetail'.tr, style: TextStyles.text),
          verticalSpace(Insets.sm),
          CardApp(
            isShowShadows: true,
            shadows: Shadows.shadowsUp,
            radius: 16.w,
            margin: EdgeInsets.only(bottom: 16.w),
            child: Column(
              children: [
                Row(
                  children: [
                    CardApp(
                      width: 40.w,
                      constraints: BoxConstraints(minHeight: 40.w),
                      margin: EdgeInsets.only(right: Insets.med),
                      padding: EdgeInsets.all(Insets.xs),
                      isShowShadows: true,
                      shadows: Shadows.shadowsUp,
                      radius: 10.w,
                      child: Image.asset(
                        AppAsset.logoAirline(data.name ),
                        fit: BoxFit.cover,
                      ),
                    ),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            data.name,
                            style: TextStyles.title.copyWith(fontSize: 12.w),
                          ),
                          Text(data.guest.toString(), style: TextStyles.desc)
                        ],
                      ),
                    ),
                    Text(
                      '#${data.right}',
                      style: TextStyles.title.copyWith(fontSize: 12.w),
                    )
                  ],
                ),
                verticalSpace(Insets.xs),
                const Divider(color: AppColor.primaryColor2, thickness: 1),
                Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            data.guest.toString(),
                            style: TextStyles.title.copyWith(fontSize: 12.w),
                          ),
                          verticalSpace(Insets.xs),
                          // Text(
                          //   FormatDateTime.format(
                          //     value: DateTime.fromMillisecondsSinceEpoch(
                          //       data.check_in_time,
                          //     ),
                          //     format: DateFormat(
                          //       'dd MMM yyyy',
                          //       '${Get.locale!.languageCode}_${Get.locale!.countryCode}',
                          //     ),
                          //   ),
                          //   style: TextStyles.desc,
                          // ),
                        ],
                      ),
                    ),
                    Column(
                      children: [
                        Text('duration'.tr, style: TextStyles.desc),
                        Container(
                          width: 70.w,
                          height: 1.w,
                          color: AppColor.greyColor1,
                        ),
                        // Text(
                        //   FormatDateTime.getDuration(
                        //     FormatDateTime.getArrivalDate(
                        //       departureDate:
                        //           DateTime.fromMillisecondsSinceEpoch(
                        //         data.ticket.check_in_time,
                        //       ),
                        //       arrivalSchedule: data.ticket.date,
                        //     )
                        //         .difference(
                        //           DateTime.fromMillisecondsSinceEpoch(
                        //             data.ticket.check_in_time,
                        //           ),
                        //         )
                        //         .inMinutes,
                        //   ),
                        //   style: TextStyles.title.copyWith(fontSize: 12.w),
                        // ),
                      ],
                    ),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text(
                            data.bookingDate.toString(),
                            textAlign: TextAlign.end,
                            style: TextStyles.title.copyWith(fontSize: 12.w),
                          ),
                          verticalSpace(Insets.xs),
                          // Text(
                          //   FormatDateTime.format(
                          //     value: FormatDateTime.getArrivalDate(
                          //       departureDate:
                          //           DateTime.fromMillisecondsSinceEpoch(
                          //         data.ticket.check_in_time,
                          //       ),
                          //       arrivalSchedule: data.bookingDate.toString(),
                          //     ),
                          //     format: DateFormat(
                          //       'dd MMM yyyy',
                          //       '${Get.locale!.languageCode}_${Get.locale!.countryCode}',
                          //     ),
                          //   ),
                          //   textAlign: TextAlign.end,
                          //   style: TextStyles.desc,
                          // ),
                        ],
                      ),
                    )
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
