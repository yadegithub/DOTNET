import 'package:flextrip/app/modules/hotel_booking/ticket_page.dart';
import 'package:flextrip/app/routes/app_pages.dart';
import 'package:flextrip/styles/colors.dart';
import 'package:flextrip/styles/styles.dart';
import 'package:flextrip/utils/app_asset.dart';
import 'package:flextrip/widgets/buttons/button_primary.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:awesome_notifications/awesome_notifications.dart';
class OrderSuccessViews extends StatelessWidget {
  const OrderSuccessViews({super.key});
// @override
// void initState(){
//   AwesomeNotifications().isNotificationAllowed().then((isAllowed) {
//    if(!isAllowed){
//             AwesomeNotifications().requestPermissionToSendNotifications();
//    }
//   });
// super.initState();
// }
triggerNotification(){
  AwesomeNotifications().createNotification(
    content: NotificationContent(
      id: 10,
      channelKey: 'com.example.flextrip',
      title: 'Simple Notification',
      body: 'test'
    )
    );
}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SizedBox(
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                AppAsset.image('img_booking_success.png'),
                width: 300.w,
                height: 150.w,
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: Insets.lg),
                child: Text(
                  'ticketOrderSuccessTitle'.tr,
                  style: TextStyles.title.copyWith(fontSize: 24.w),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 40.w),
                child: Text(
                  'ticketOrderSuccessDesc'.tr,
                  textAlign: TextAlign.center,
                  style: TextStyles.text
                      .copyWith(fontSize: 16.w, color: AppColor.greyColor1),
                ),
              ),
              Padding(
                padding:
                    EdgeInsets.symmetric(horizontal: 48.w, vertical: Insets.lg),
                child: ButtonPrimary(
                  label: 'checkYourTicket'.tr,
                  onTap: () {
                    triggerNotification();
                     Navigator.push(context,
                   MaterialPageRoute(builder: (context)=> 
                  TicketHomePage(),
                
                //  OrderSuccessViews()
                                      ));
                      
                  }
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
 