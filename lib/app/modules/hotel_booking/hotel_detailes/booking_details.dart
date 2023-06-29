
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

import '../../test/core/theme/app_color.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:awesome_notifications/awesome_notifications.dart';
    
class Booking_Details extends StatefulWidget {
  const Booking_Details({Key? key}) : super(key: key);

  @override
  _Booking_DetailsState createState() => _Booking_DetailsState();
}

class _Booking_DetailsState extends State<Booking_Details> {
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
       appBar: AppBar(title: Text('Checkout' ,),),
       body:
        Column(
          children: [
            StreamBuilder<QuerySnapshot>(
                      stream:  FirebaseFirestore.instance
          .collection('yade').snapshots(),
                      // FirebaseFirestore.instance.collection("bookings").doc('Q9fBkvZFo0tDDZjGaB8W').collection('hotel').snapshots(),
                      builder:((context, snapshot) {
                        
               
                if(snapshot.connectionState==ConnectionState.active){
                      if(snapshot.hasData&& snapshot.data !=null){
                        return 
                          Expanded(
                            child: ListView.builder(
                              itemCount: snapshot.data!.docs.length,
                              itemBuilder: (context,index){
                              //   String test =snapshot.data!.docs.elementAt(index).get('test');
                                  
                                //  Map<String,dynamic> docData =snapshot.data!.docs[index].data()  as Map<String, dynamic>;
                                 //  Map<String ,dynamic> test =docData['test'];
                              Map<String ,dynamic> booking = snapshot.data!.docs[index].data() as Map<String, dynamic>;
                             // var roomData = snapshot.data!.docs[index].data() as Map<String, dynamic>;
                          //    Map<String ,dynamic> hotel = snapshot.data!.docs[index].data() as Map<String, dynamic>;

                              return 
                              Padding(
      padding: EdgeInsets.symmetric(horizontal: Insets.xs),
      child:
       Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
             
              verticalSpace(Insets.sm),
               Row(
                children: [
                  CardApp(
                            width: 100,
                            constraints: BoxConstraints(minHeight: 40),
                            margin: EdgeInsets.all(20),
                            padding: EdgeInsets.all(20),
                            isShowShadows: true,
                            shadows: Shadows.shadowsUp,
                            radius: 10,
                            child:
                       Image.network(booking['roomimages'],height: 80,width: 80,)
                          ),
                           Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              //Text(booking['name'])
                              Text(
                              'Hotel Halima',
                              //  test,
                              //  '${booking['total_payement']}'.toString(),
                            
                                style: TextStyles.title.copyWith(fontSize: 12),
                              ),
                            // Text('${booking['service_fee']}'.toString(), style: TextStyles.desc)
                            ],
                          ),
                        ),
                          ],
                  
               ),
              CardApp(
                isShowShadows: true,
                shadows: Shadows.shadowsUp,
                radius: 16,
                margin: EdgeInsets.only(bottom: 16),
                child: Column(
                  children: [
                     Text('BookingDetails'.tr, style: TextStyles.title),
                    Row(
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'total_payement'.tr,
                              //  booking['name'],
                               // '${booking['guest']}'.toString().toString(),
                                style: TextStyles.title.copyWith(fontSize: 12),
                              ),
                              //Text( booking['name'], style: TextStyles.desc)
                            ],
                          ),
                        ),
                       Text(
                         '${booking['total_payement']}',
                                // FormatDateTime.format(
                                //   value: DateTime.fromMillisecondsSinceEpoch(
                                //     booking['date'],
                                //   ),
                                //   format: DateFormat(
                                //     'dd MMM yyyy',
                                //     //'${Get.locale!.languageCode}_${Get.locale!.countryCode}',
                                //   ),
                                // ),
                               style: TextStyles.desc,
                              ),
                      ],
                     ),
  Row(
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'service_fee'.tr,
                              //  booking['name'],
                               // '${booking['guest']}'.toString().toString(),
                                style: TextStyles.title.copyWith(fontSize: 12),
                              ),
                              //Text( booking['name'], style: TextStyles.desc)
                            ],
                          ),
                        ),
                       Text(
                         '${booking['service_fee']}',
                                // FormatDateTime.format(
                                //   value: DateTime.fromMillisecondsSinceEpoch(
                                //     booking['date'],
                                //   ),
                                //   format: DateFormat(
                                //     'dd MMM yyyy',
                                //     //'${Get.locale!.languageCode}_${Get.locale!.countryCode}',
                                //   ),
                                // ),
                               style: TextStyles.desc,
                              ),
                      ],
                    ),




  //                    Row(
  //                     children: [
  //                       Expanded(
  //                         child: Column(
  //                           crossAxisAlignment: CrossAxisAlignment.start,
  //                           children: [
  //                             Text(
  //                               'Date',
  //                             //  booking['name'],
  //                              // '${booking['guest']}'.toString().toString(),
  //                               style: TextStyles.title.copyWith(fontSize: 12),
  //                             ),
  //                             //Text( booking['name'], style: TextStyles.desc)
  //                           ],
  //                         ),
  //                       ),
  //                      Text(
                        
  //                               FormatDateTime.format(
  //                                 value: DateTime(
  //                                   booking['date'],
  //                                 ),
  //                                 format: DateFormat(
  //                                   'dd MMM yyyy',
  //                                   //'${Get.locale!.languageCode}_${Get.locale!.countryCode}',
  //                                 ),
  //                               ),
  //                              style: TextStyles.desc,
  //                             ),
  //                     ],
  //                   ),
                     Row(
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Geust'.tr,
                              //  booking['name'],
                               // '${booking['guest']}'.toString().toString(),
                                style: TextStyles.title.copyWith(fontSize: 12),
                              ),
                              //Text( booking['name'], style: TextStyles.desc)
                            ],
                          ),
                        ),
                       Text(
                        
                              'Geust${booking['Geust']}',
                              
                               style: TextStyles.desc,
                              ),
                      ],
                    ),
                      Row(
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Bearckfast'.tr,
                              //  booking['name'],
                               // '${booking['guest']}'.toString().toString(),
                                style: TextStyles.title.copyWith(fontSize: 12),
                              ),
                              //Text( booking['name'], style: TextStyles.desc)
                            ],
                          ),
                        ),
                       Text(
                        
                              booking['Breackfast'],
                              
                               style: TextStyles.desc,
                              ),
                      ],
                    ),
                     Row(
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'night'.tr,
                              //  booking['name'],
                               // '${booking['guest']}'.toString().toString(),
                                style: TextStyles.title.copyWith(fontSize: 12),
                              ),
                              //Text( booking['name'], style: TextStyles.desc)
                            ],
                          ),
                        ),
                       Text(
                        '${booking['1night']}'
                            ,
                              
                               style: TextStyles.desc,
                              ),
                      ],
                    ),
                     Row(
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Activiteis'.tr,
                              //  booking['name'],
                               // '${booking['guest']}'.toString().toString(),
                                style: TextStyles.title.copyWith(fontSize: 12),
                              ),
                              //Text( booking['name'], style: TextStyles.desc)
                            ],
                          ),
                        ),
                       Text(
                        '${booking['activiteis']}'
                            ,
                              
                               style: TextStyles.desc,
                              ),
                      ],
                    ),
                    //                      Row(
                    //   children: [
                    //     Expanded(
                    //       child: Column(
                    //         crossAxisAlignment: CrossAxisAlignment.start,
                    //         children: [
                    //           Text(
                    //             'check_in_time',
                    //           //  booking['name'],
                    //            // '${booking['guest']}'.toString().toString(),
                    //             style: TextStyles.title.copyWith(fontSize: 12),
                    //           ),
                    //           //Text( booking['name'], style: TextStyles.desc)
                    //         ],
                    //       ),
                    //     ),
                    //    Text(
                        
                    //             FormatDateTime.format(
                    //               value: DateTime(
                    //                 booking['check_in_time'],
                    //               ),
                    //               format: DateFormat(
                    //                 'dd MMM yyyy',
                    //                 //'${Get.locale!.languageCode}_${Get.locale!.countryCode}',
                    //               ),
                    //             ),
                    //            style: TextStyles.desc,
                    //           ),
                    //   ],
                    // ),
                    //  Row(
                    //   children: [
                    //     Expanded(
                    //       child: Column(
                    //         crossAxisAlignment: CrossAxisAlignment.start,
                    //         children: [
                    //           Text(
                    //             'total_payement',
                    //           //  booking['name'],
                    //            // '${booking['guest']}'.toString().toString(),
                    //             style: TextStyles.title.copyWith(fontSize: 12),
                    //           ),
                    //           //Text( booking['name'], style: TextStyles.desc)
                    //         ],
                    //       ),
                    //     ),
                    //    Text(
                    //      '${booking['total_payement']}',
                    //             // FormatDateTime.format(
                    //             //   value: DateTime.fromMillisecondsSinceEpoch(
                    //             //     booking['date'],
                    //             //   ),
                    //             //   format: DateFormat(
                    //             //     'dd MMM yyyy',
                    //             //     //'${Get.locale!.languageCode}_${Get.locale!.countryCode}',
                    //             //   ),
                    //             // ),
                    //            style: TextStyles.desc,
                    //           ),
                    //   ],
                    // ),
                    verticalSpace(Insets.xs),
                  //  Divider(color: AppColor.primaryColor, thickness: 1),
                   
              
               Text('Payment'.tr, style: TextStyles.title),
                Row(
                children: [
                  CardApp(
                            width: 100,
                            constraints: BoxConstraints(minHeight: 40),
                            margin: EdgeInsets.all(20),
                            padding: EdgeInsets.all(20),
                            isShowShadows: true,
                            shadows: Shadows.shadowsUp,
                            radius: 10,
                            child:  Image.asset(
                            AppAsset.image('payment.png'),
                            fit: BoxFit.cover,
                          ),
                          ),
                           Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                              'bbbbbb'.tr,
                                style: TextStyles.title.copyWith(fontSize: 12),
                              ),
                              Text('gjvmbnhjj'.tr, style: TextStyles.desc)
                            ],
                          ),
                        ),
                          ],
                  
               ),
               ButtonPrimary(
                    label: 'procced to payment'.tr,
                    //enabled: controller.isValidTicketForm.value,
                  
                    onTap: () async{
                      
                       await makePayment();
                      // triggerNotification();
                //          Navigator.push(context,
                //    MaterialPageRoute(builder: (context)=> 
                // //  TicketHomePage()
                // OrderSuccessView()
                //                       ));
                      
                    },
          //           ElevatedButton(
          // child:  Text('procced to payment'.tr),R
          
          // onLongPress: () async{
            
          //            await makePayment();
          // },
          // onPressed: triggerNotification,
          // ),
                    
                  )
            ],
      ),
            
    )]));
                              
                              }),
                          );
                           
                      }
                      else{
                        Text('no data');
                      }
                    }
                    else{
                      return Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                     return Text("No widget to build");
                      }),
                      
                      
               
                     ),
          ],
        ),
               
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
              merchantDisplayName: 'Adnan')).then((value){
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
                  OrderSuccessViews()
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