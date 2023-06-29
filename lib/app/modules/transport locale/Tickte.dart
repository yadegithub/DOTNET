
import 'package:flextrip/app/modules/test/core/theme/app_color.dart';
import 'package:flextrip/app/modules/transport%20locale/Pages.dart';
import 'package:flextrip/styles/styles.dart';
import 'package:flextrip/utils/format_date_time.dart';
import 'package:flextrip/widgets/cards/card_app.dart';
import 'package:flextrip/widgets/pages/page_default.dart';
import 'package:flutter/material.dart';
import 'dart:math' as math;
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
class Ticket extends StatefulWidget {
  const Ticket({super.key});

  @override
  State<Ticket> createState() => _TicketState();
}

class _TicketState extends State<Ticket> {
  DropdownScreen? yade;
  @override
  Widget build(BuildContext context) {
    return PageDefault(
      title: 'ticketDetail'.tr,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: Insets.xl),
        child: SingleChildScrollView(
          child: Column(
            children: [
                Padding(
      padding: EdgeInsets.symmetric(horizontal: Insets.xs),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 10,),
          Text('Billet'.tr, style: TextStyles.text),
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
                    Text('User'.tr, style: TextStyles.desc),
                    horizontalSpace(Insets.sm),
                    Expanded(
                      child: Text(
                        'yade',
                           
                        style: TextStyles.title.copyWith(
                          fontSize: 12.w,
                          color: 
                               AppColor.secondaryColor
                            //  : AppColor.redColor,
                        ),
                        textAlign: TextAlign.end,
                      ),
                    )
                  ],
                ),
                verticalSpace(Insets.xs),
                Divider( thickness: 1),
                Row(
                  
                  children: [
                    Text('date'.tr, style: TextStyles.desc),
                    horizontalSpace(Insets.sm),
                    Expanded(
                      child:
                      //  Text(
                      //   '12/07/2023',
                            
                      //   style: TextStyles.title.copyWith(
                      //     fontSize: 12.w,
                      //     color: 
                      //          AppColor.blackGrey
                      //         //: AppColor.redColor,
                      //   ),
                      //   textAlign: TextAlign.end,
                      // ),
                      Padding(
                        padding: const EdgeInsets.only(left: 210),
                        child: Text(
                        FormatDateTime.format(
                          value: DateTime.fromMillisecondsSinceEpoch(
                            4,
                          ),
                          format: DateFormat(
                            'dd MMM yyyy',
                            '${Get.locale!.languageCode}_${Get.locale!.countryCode}',
                          ),
                        ),
                        style:
                            TextStyles.desc.copyWith(color:Colors.black),
                                          ),
                      ),
                    )
                  ],
                ),
                Text('duration'.tr, style: TextStyles.desc),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('Nktt'),
                        Padding(
                          padding: const EdgeInsets.only(left: 80),
                          child: Container(
                            width: 80.w,
                            height: 1.w,
                            margin: EdgeInsets.only(right: Insets.sm),
                            color: AppColor.backgroundGray,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right: 60),
                          child: Transform.rotate(
                            angle: 180 * math.pi / 360,
                            child: Icon(
                              Icons.bus_alert_outlined,
                              size: 14.w,
                              color: AppColor.blackGrey,
                            ),
                          ),
                        ),
                        Text('Rosso')
                      ],
                    ),
                    Text('2h 30min'),
                    SizedBox(height: 5,),
                Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: Row(
                    children: [
                      Text('Etablisement'.tr, style: TextStyles.desc),
                      horizontalSpace(Insets.sm),
                      Expanded(
                        child: Text(
                          'Selame',
                              
                          style: TextStyles.title.copyWith(
                            fontSize: 12.w,
                            color: 
                                 AppColor.blackGrey
                                //: AppColor.redColor,
                          ),
                          textAlign: TextAlign.end,
                        ),
                      )
                    ],
                  ),
                ),
                verticalSpace(Insets.xs),
                Row(
                  children: [
                    Text('others'.tr, style: TextStyles.desc),
                    horizontalSpace(Insets.xxl),
                    Expanded(
                      child: Text(
                        'yade',
                            
                        style: TextStyles.title.copyWith(fontSize: 10.w),
                        textAlign: TextAlign.end,
                      ),
                    )
                  ],
                ),
                Row(
                  children: [
                    
                    Expanded(
                      child:Image.asset('assets/images/barcode.jpg')
                    )
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    )
             
            ],
          ),
        ),
      ),
    );
   ;
  }
}