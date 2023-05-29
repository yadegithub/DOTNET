
import 'package:flextrip/app/models/booking_model.dart';
import 'package:flextrip/app/models/ticket_booking_model.dart';
import 'package:flextrip/app/modules/hotel%20booking/feature/detail_destionation/controllers/booking_controller.dart';
import 'package:flextrip/styles/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../../../styles/colors.dart';
import '../../../../../../widgets/cards/card_app.dart';

// class TicketDetailFacilities extends GetView<BookingDetailController> {
//   const TicketDetailFacilities({super.key, required this.data});

//   final TicketBookingModel data;

//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: EdgeInsets.symmetric(horizontal: Insets.xs),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Text('BookingFacilities'.tr, style: TextStyles.text),
//           verticalSpace(Insets.sm),
//           CardApp(
//             isShowShadows: true,
//             shadows: Shadows.shadowsUp,
//             radius: 16.w,
//             margin: EdgeInsets.only(bottom: 16.w),
//             child: Column(
//               children: [
//                 Row(
//                   children: [
//                     Text('insurance'.tr, style: TextStyles.desc),
//                     horizontalSpace(Insets.sm),
//                     Expanded(
//                       child: Text(
//                         data.ticket.is_done
//                             ? 'yes'.tr.toUpperCase()
//                             : 'no'.tr.toUpperCase(),
                            
//                         style: TextStyles.title.copyWith(
//                           fontSize: 12.w,
//                           color: data.ticket.cover
//                               ? AppColor.greenColor
//                               : AppColor.redColor,
//                         ),
//                         textAlign: TextAlign.end,
//                       ),
//                     )
//                   ],
//                 ),
//                 verticalSpace(Insets.xs),
//                 Row(
//                   children: [
//                     Text('refundable'.tr, style: TextStyles.desc),
//                     horizontalSpace(Insets.sm),
//                     Expanded(
//                       child: Text(
//                         data.ticket.breakfast
//                             // ? 'yes'.tr.toUpperCase()
//                             // : 'no'.tr.toUpperCase(),
//                             ,
//                         style: TextStyles.title.copyWith(
//                           fontSize: 12.w,
//                           color:Colors.amberAccent
//                           // data.ticket.refundable
//                               // ? AppColor.greenColor
//                               // : AppColor.redColor,
//                         ),
//                         textAlign: TextAlign.end,
//                       ),
//                     )
//                   ],
//                 ),
//                 verticalSpace(Insets.xs),
//                 Row(
//                   children: [
//                     Text('others'.tr, style: TextStyles.desc),
//                     horizontalSpace(Insets.xxl),
//                     Expanded(
//                       child: Text(
//                         data.ticket.check_in_time.toString()
//                             // .map((e) => controller.checkBenefit(e))
//                             // .join(', '),
//                             ,
//                         style: TextStyles.title.copyWith(fontSize: 10.w),
//                         textAlign: TextAlign.end,
//                       ),
//                     )
//                   ],
//                 )
//               ],
//             ),
//           )
//         ],
//       ),
//     );
//   }
// }
