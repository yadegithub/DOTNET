import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:awesome_notifications/awesome_notifications.dart';


class HomeScreens extends StatefulWidget {
  const HomeScreens({Key? key}) : super(key: key);

  @override
  _HomeScreensState createState() => _HomeScreensState();
}

class _HomeScreensState extends State<HomeScreens> {

 // Map<String, dynamic>? paymentIntent;

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
    return Scaffold(
      appBar: AppBar(
        title: const Text('Stripe Payment'),
      ),
      body: Center(
        child: ElevatedButton(
          child: const Text('Make Payment'),
          onPressed: triggerNotification,
          ),
      ),
    );
  }

  // Future<void> makePayment() async {
  //   try {
  //     paymentIntent = await createPaymentIntent('10', 'USD'); 
  //     //Payment Sheet 
  //     await Stripe.instance.initPaymentSheet(
        
  //         paymentSheetParameters: SetupPaymentSheetParameters(
            
  //             paymentIntentClientSecret: paymentIntent!['client_secret'],
  //             // applePay: const PaymentSheetApplePay(merchantCountryCode: '+92',),
  //             // googlePay: const PaymentSheetGooglePay(testEnv: true, currencyCode: "US", merchantCountryCode: "+92"),
  //             style: ThemeMode.dark,
  //             merchantDisplayName: 'Adnan')).then((value){
  //     });


  //     ///now finally display payment sheeet
  //     displayPaymentSheet();
  //   } catch (e, s) {
  //     print('exception:$e$s');
  //   }
  // }

  // displayPaymentSheet() async {

  //   try {
  //     await Stripe.instance.presentPaymentSheet(
  //         ).then((value){
  //       showDialog(
  //         context: context,
  //         builder: (_) => AlertDialog(
  //           content: Column(
  //             mainAxisSize: MainAxisSize.min,
  //             children: [
  //               Row(
  //                 children: const [
  //                   Icon(Icons.check_circle, color: Colors.green,),
  //                   Text("Payment Successfull"),
  //                 ],
  //               ),
  //             ],
  //           ), 
  //         ));
  //       // ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("paid successfully")));

  //       paymentIntent = null;

  //     }).onError((error, stackTrace){
  //       print('Error is:--->$error $stackTrace');
  //     });


  //   } on StripeException catch (e) {
  //     print('Error is:---> $e');
  //     showDialog(
  //         context: context,
  //         builder: (_) => const AlertDialog(
  //           content: Text("Cancelled "),
  //         ));
  //   } catch (e) {
  //     print('$e');
  //   }
  // }

  // //  Future<Map<String, dynamic>>
  // createPaymentIntent(String amount, String currency) async {
  //   try {
  //     Map<String, dynamic> body = {
  //       'amount': calculateAmount(amount),
  //       'currency': currency,
  //       'payment_method_types[]': 'card'
  //     };

  //     var response = await http.post(
  //         Uri.parse('https://api.stripe.com/v1/payment_intents'),
  //         headers: {
  //           'Authorization': 'Bearer  sk_test_51N8MoKCM4OZnSL6OqBMVVMvyuBZKPjcX3L3TkSmZJwckc4M7AupDVtiIihEzEYYggu8Mq0Eq5N9Mc8EGyRLIgdue006lWDbBvs',
  //           'Content-Type': 'application/x-www-form-urlencoded'
  //         },
  //         body: body,
  //         );
  //     // ignore: avoid_print
  //     print('Payment Intent Body->>> ${response.body.toString()}');
  //     return jsonDecode(response.body);
  //   } catch (err) {
  //     // ignore: avoid_print
  //     print('err charging user: ${err.toString()}');
  //   }
  // }

  // calculateAmount(String amount) {
  //   final calculatedAmout = (int.parse(amount)) * 100 ;
  //   return calculatedAmout.toString();
  // }

}