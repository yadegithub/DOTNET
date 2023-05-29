
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flextrip/styles/styles.dart';
import 'package:flextrip/utils/app_asset.dart';
import 'package:flextrip/utils/format_date_time.dart';
import 'package:flextrip/widgets/buttons/button_primary.dart';
import 'package:flextrip/widgets/cards/card_app.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class SubCollection extends StatelessWidget {
  const SubCollection({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('yade'),),
      body: SafeArea(
        child: 
        Column(
          children: [
            StreamBuilder(
              stream: FirebaseFirestore.instance
              .collection('bookings').snapshots(),
              builder: (__,
              AsyncSnapshot<QuerySnapshot<Map<String,dynamic>>> snapshot){
             if(snapshot.hasData&& snapshot.data!=null){
               if(snapshot.data!.docs.isNotEmpty){
                   return ListView.separated(
                    itemBuilder: (___,int index){
               Map<String,dynamic> docData =snapshot.data!.docs[index].data();
                Map<String ,dynamic> booking = snapshot.data!.docs[index].data() as Map<String, dynamic>;
               if(docData.isEmpty){
                return Text('Document is empty',
                textAlign: TextAlign.center,);
               }



         //    String test =docData['name'];



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
                              '',
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
                     Text('BookingDetails', style: TextStyles.title),
                    Row(
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'total_payement',
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
                                'service_fee',
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




                     Row(
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Date',
                              //  booking['name'],
                               // '${booking['guest']}'.toString().toString(),
                                style: TextStyles.title.copyWith(fontSize: 12),
                              ),
                              //Text( booking['name'], style: TextStyles.desc)
                            ],
                          ),
                        ),
                       Text(
                        
                                FormatDateTime.format(
                                  value: DateTime(
                                    booking['date'],
                                  ),
                                 
                                  // format: DateFormat(
                                  //   'dd MMM yyyy',
                                  //   //'${Get.locale!.languageCode}_${Get.locale!.countryCode}',
                                  // ),
                                ),
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
                                'Geust',
                              //  booking['name'],
                               // '${booking['guest']}'.toString().toString(),
                                style: TextStyles.title.copyWith(fontSize: 12),
                              ),
                              //Text( booking['name'], style: TextStyles.desc)
                            ],
                          ),
                        ),
                       Text(
                        
                              'Geust${booking['geust']}',
                              
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
                                'Bearckfast',
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
                                'night',
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
                                'Activiteis',
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
                                         Row(
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'check_in_time',
                              //  booking['name'],
                               // '${booking['guest']}'.toString().toString(),
                                style: TextStyles.title.copyWith(fontSize: 12),
                              ),
                              //Text( booking['name'], style: TextStyles.desc)
                            ],
                          ),
                        ),
                       Text(
                        
                                FormatDateTime.format(
                                  value: DateTime(
                                    booking['check_in_time'],
                                  ),
                                  // format: DateFormat(
                                  //   'dd MMM yyyy',
                                  //   //'${Get.locale!.languageCode}_${Get.locale!.countryCode}',
                                  // ),
                                ),
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
                                'total_payement',
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
                    verticalSpace(Insets.xs),
                  //  Divider(color: AppColor.primaryColor, thickness: 1),
                   
              
               Text('BookingDetails', style: TextStyles.title),
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
                              'bbbbbb',
                                style: TextStyles.title.copyWith(fontSize: 12),
                              ),
                              Text('gjvmbnhjj', style: TextStyles.desc)
                            ],
                          ),
                        ),
                          ],
                  
               ),
               ButtonPrimary(
                    label: 'procced to payment',
                    //enabled: controller.isValidTicketForm.value,
                    onTap: () {
                      
                    },
                  )
            ],
      ),
            
    )]));
                 
                   


                      
                    
                          //  ListTile(
                          //   title: Text(test),
                          //   //subtitle:Text() ,
                          // );
                    },
                     separatorBuilder: (___,____){
                      return Divider();
                     },
                      itemCount: snapshot.data!.docs.length,
                      );
               }else{
                return Center(
                  child: Text('documents aren t availbe'),
                );
               }
             }else{
              return Center(
                child: Text('Getting Error'),
              );
             }
              }
              ),
             
          ],
        ),
        

          )
      );
    
  }
}
