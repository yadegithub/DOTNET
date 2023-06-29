import 'package:flextrip/app/modules/Dashborder/veiw/Dashborder.dart';
import 'package:flextrip/app/modules/test/core/theme/app_color.dart';
import 'package:flextrip/app/modules/transport%20locale/Tickte.dart';
import 'package:flextrip/app/modules/transport%20locale/views/home_view.dart';
import 'package:flextrip/styles/styles.dart';
import 'package:flextrip/widgets/buttons/button_primary.dart';
import 'package:flextrip/widgets/inputs/input_date.dart';
import 'package:flextrip/widgets/inputs/input_primary.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:get/get.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';
import 'package:table_calendar/table_calendar.dart';

import'views/Tickte.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
class DropdownScreen extends StatefulWidget {
  late final String? dateFormat;
  @override
  _DropdownScreenState createState() => _DropdownScreenState();
}

class _DropdownScreenState extends State<DropdownScreen> {
   DateTime today =DateTime.now();
  String selecteddestination="0";
  // String selectedStudents="1";
String  selectedtemp="0";
    
    //  get heur => null;
    // void _showdatepicker(){
    //   showDatePicker(
    //     context: context, 
    //     initialDate: DateTime.now(),
    //      firstDate: DateTime(2000),
    //       lastDate: DateTime(2025)
    //       ).then((value) {
    //         setState(() {
    //           today=value!;
    //         });
    //       });
    // }
 TextEditingController _date =TextEditingController();
   @override
  Widget build(BuildContext context) {
    return
     Scaffold(
      appBar: AppBar(
         backgroundColor: Color(0xFF26A69A),
        title: Text('Selectionne le detail'.tr),
      ),
      body: Center(child: Column(
        
        children: [
      //  final phoneNumber = '1234567890'; // Replace with the desired phone number

          StreamBuilder<QuerySnapshot>(
            stream: FirebaseFirestore.instance.collection('destination').snapshots(),
            

            builder: (context ,snapshot){
              List <DropdownMenuItem> destinationItems =[];
              if(!snapshot.hasData){
             const   CircularProgressIndicator();
              }
              else{
                final destinations=snapshot.data?.docs.reversed.toList();
              destinationItems.add(DropdownMenuItem(value: "0",child: Text('selected destination'),));
                for(var destination in destinations!){
                destinationItems.add(DropdownMenuItem( 
                    value:destination.id,
                    child: Text(destination['name'],),),);
                }
              }
              return
               Padding(
                 padding: const EdgeInsets.all(30.0),
                 child: DropdownButton(items:destinationItems,onChanged: (destinationValue){
                  setState((){
                    //  print(clientValue);
                           selecteddestination = destinationValue;
               
                             });
               print(destinationValue) ;  
                       
                             },
                             value:selecteddestination,
               isExpanded: false,
                             ),
               );
              
            }
          ),
          
          
          StreamBuilder<QuerySnapshot>(
            stream: FirebaseFirestore.instance.collection('temp').snapshots(),
            

            builder: (context ,snapshot){
              List <DropdownMenuItem> tempItems =[];
              if(!snapshot.hasData){
             const   CircularProgressIndicator();
              }
              else{
                final temps=snapshot.data?.docs.reversed.toList();
              tempItems.add(DropdownMenuItem(value:"0" ,child: Text('selected temp'),));
                for(var temp in temps!){
                  tempItems.add(DropdownMenuItem( 
                    value:temp.id,
                    child: Text(temp['heur'],),),);
                    
                }
              }
              return
               Padding(
                 padding: const EdgeInsets.all(30.0),
                 child: DropdownButton(items:tempItems,onChanged: (tempValue){
                  setState((){
                    //  print(clientValue);
                           selectedtemp= tempValue;
                             });
               print(tempValue) ;             
                             } 
               //   value:selecteddestination,
               //isExpanded: true,
                           //   value: selectedStudents,
                      
                            // isExpanded: false,
                             ),
               );
              
            }
         
    

          
       
          ),
          //  TableCalendar(
          //   locale: "en_US",
          //   rowHeight: 43,
          //   headerStyle: HeaderStyle(formatButtonVisible: false,titleCentered: true),
          //   availableGestures: AvailableGestures.all,
          //   focusedDay: today,
          //     firstDay:DateTime.utc(2010,10,16),
          //     lastDay:DateTime.utc(2030,3,14), 

          //     ),
        Padding(
          padding: const EdgeInsets.all(30.0),
          child: TextField(
            controller: _date,
            decoration: const InputDecoration(
              icon: Icon(Icons.calendar_today_rounded),
              labelText: 'select date'
            ),
            onTap: () async{
              DateTime? pickeddate = await showDatePicker(
                context: context,
                 initialDate: DateTime.now(),
                  firstDate: DateTime(2000), 
                  lastDate:DateTime(2101));
                  if(pickeddate != null){
                    setState(() {
                      _date.text=DateFormat('yyyy-MM-dd').format(pickeddate);
                    });
                  }
            },
          ),
        ),
              
             
             Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                
              ButtonPrimary(
                label: "Continue".tr,
                onTap: () {
                //  trip.title = _titleController.text;
                 Navigator.push(context, MaterialPageRoute(
               builder: (context)=>Ticket()
                
                     )    
                  );
                },
              ),
              ],
             ),
             SizedBox(height: 5,),
             Row(
              children: [
                  ButtonPrimary(
                
                label: "Annuller".tr,
                onTap: () {
                //  trip.title = _titleController.text;
                 Navigator.push(context, MaterialPageRoute(
               builder: (context)=>Dashborder()
                //  Navigator.push(
                      //context,
                     )    // MaterialPageRoute(builder: (context) => NewTripDateView(trip: trip)),
                  );
                },
              ),
              ],
             )
        ],)),
      
        
    );
        // ignore: dead_code
       }
    // ignore: dead_code
  //  Widget buildButton (){
   //   final number='4567';

  //  return ElevatedButton(
        //style: ElevatedButton.styleFrom(
       // padding: EdgeInsets.symmetric(horizontal: 48,vertical: 12),
       // textStyle: TextStyle(fontSize: 24),
     // ),
     // child: Text('call'),
    //  onPressed: () async{
        //launch('tel//$number');
       // await FlutterPhone
    //  },
    //  );
      }


class PageH extends StatefulWidget {
  // const PageH({super.key});
  @override
  _PageHState createState() => _PageHState();
}

class _PageHState extends State<PageH> {
   @override
    @override
  Widget build(BuildContext context) =>Scaffold(
    appBar: AppBar(
        title: Text('Dropdown Example'),
      ),
      body: Center(child: buildButton(),),
  
  );
 Widget buildButton(){
  final number ='+22248223445';

  
  // ElevatedButton( style: ElevatedButton.styleFrom(padding: EdgeInsets.symmetric(horizontal: 48,vertical: 12),
 // textStyle: TextStyle(fontSize: 24)),
  return  ListTile(title: Text('Salama'),
subtitle: Text(number),
trailing: TextButton(style: TextButton.styleFrom(
  padding: EdgeInsets.symmetric(horizontal: 32,vertical: 12),
  shape:RoundedRectangleBorder(
    side:BorderSide(color:Colors.blue),

  )
),
child: Text('call'),onPressed: () async{
      await FlutterPhoneDirectCaller.callNumber(number);
     // launch('tel://$numbre');
    },
),
  );
   //// child: Text('call'),onPressed: () async{
     // await FlutterPhoneDirectCaller.callNumber(number);
     // launch('tel://$numbre');
// }
 
 // void launch(String s) {}
 // Widget build(BuildContext context) {
   // return Scaffold(
     // appBar: AppBar(
       // title: Text('Dropdown Example'),
      //),
        // body: Container(),
    //);
//}

}
 Widget buildTripCard(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Icon Example'),
      ),
      body: Center(
        child: Icon(
          Icons.favorite,
          color: Colors.red,
          size: 48.0,
        ),
      ),
    );
 }
}