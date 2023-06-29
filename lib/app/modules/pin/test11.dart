 

import 'dart:async';
import 'dart:convert';



import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flextrip/app/modules/hotel_booking/hotel_detailes/orderSuccessViews.dart';
import 'package:flextrip/app/modules/hotel_booking/ticket_page.dart';
import 'package:flextrip/app/modules/order/views/order_success_view.dart';
import 'package:flextrip/styles/styles.dart';
import 'package:flextrip/utils/app_asset.dart';
import 'package:flextrip/utils/format_date_time.dart';
import 'package:flextrip/widgets/buttons/button_primary.dart';
import 'package:flextrip/widgets/cards/card_app.dart';
//import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';


import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:awesome_notifications/awesome_notifications.dart';
    
class test11 extends StatefulWidget {
  const test11({Key? key}) : super(key: key);

  @override
  _test11State createState() => _test11State();
}

class _test11State extends State<test11> {
  Map<String, dynamic>? paymentIntent;
@override
void initState(){
  AwesomeNotifications().isNotificationAllowed().then((isAllowed) {
   if(!isAllowed){
            AwesomeNotifications().requestPermissionToSendNotifications();
   }
  });
super.initState();
}
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
    return
    Scaffold(
       appBar: AppBar(title: Text('Checkout' ,),backgroundColor: Color(0xFF26A69A),),
       body:Container(
         child:  ButtonPrimary(
                    label: 'procced to payment'.tr,
                    //enabled: controller.isValidTicketForm.value,
                  
                    onTap: () async{
                      
                       await makePayment();
                    
                    } 
                  ),
  
       )
    );
           
          
  }
        // floatingActionButton: FloatingActionButton(),
       
    
  Future<void> makePayment() async {
    try {
      paymentIntent = await createPaymentIntent('10', 'USD'); 
      //Payment Sheet 
      await Stripe.instance.initPaymentSheet(
        
          paymentSheetParameters: SetupPaymentSheetParameters(
            
              paymentIntentClientSecret: paymentIntent!['client_secret'],
              // applePay: const PaymentSheetApplePay(merchantCountryCode: '+92',),
              // googlePay: const PaymentSheetGooglePay(testEnv: true, currencyCode: "US", merchantCountryCode: "+92"),
              style: ThemeMode.dark,
              merchantDisplayName: 'yade')).then((value){
      });


      ///now finally display payment sheeet
      displayPaymentSheet();
    } catch (e, s) {
      print('exception:$e$s');
    }
  }

  displayPaymentSheet() async {

    try {
      await Stripe.instance.presentPaymentSheet(
          ).then((value){
            // OrderSuccessView();
              Navigator.push(context,
                   MaterialPageRoute(builder: (context)=> 
                //  TicketHomePage()
                  OrderSuccessView()
                                      ));
                      
        // showDialog(
        //   context: context,
        //   builder: (_) => AlertDialog(
        //     content: Column(
        //       mainAxisSize: MainAxisSize.min,
        //       children: [
        //         Row(
        //           children: const [
        //             Icon(Icons.check_circle, color: Colors.green,),
        //             Text("Payment Successfull"),
        //           ],
        //         ),
        //       ],
        //     ), 
        //   ));
        // ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("paid successfully")));

        paymentIntent = null;

      }).onError((error, stackTrace){
        print('Error is:--->$error $stackTrace');
      });


    } on StripeException catch (e) {
      print('Error is:---> $e');
      showDialog(
          context: context,
          builder: (_) => const AlertDialog(
            content: Text("Cancelled "),
          ));
    } catch (e) {
      print('$e');
    }
  }

  //  Future<Map<String, dynamic>>
  createPaymentIntent(String amount, String currency) async {
    try {
      Map<String, dynamic> body = {
        'amount': calculateAmount(amount),
        'currency': currency,
        'payment_method_types[]': 'card'
      };

      var response = await http.post(
          Uri.parse('https://api.stripe.com/v1/payment_intents'),
          headers: {
            'Authorization': 'Bearer  sk_test_51N8MoKCM4OZnSL6OqBMVVMvyuBZKPjcX3L3TkSmZJwckc4M7AupDVtiIihEzEYYggu8Mq0Eq5N9Mc8EGyRLIgdue006lWDbBvs',
            'Content-Type': 'application/x-www-form-urlencoded'
          },
          body: body,
          );
      // ignore: avoid_print
      print('Payment Intent Body->>> ${response.body.toString()}');
      return jsonDecode(response.body);
    } catch (err) {
      // ignore: avoid_print
      print('err charging user: ${err.toString()}');
    }
  }

  calculateAmount(String amount) {
    final calculatedAmout = (int.parse(amount)) * 100 ;
    return calculatedAmout.toString();
  }



//   }
  










































  }
 