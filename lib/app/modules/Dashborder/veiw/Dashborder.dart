

import 'package:flextrip/app/models/recommended_places.dart';
import 'package:flextrip/app/modules/Dashborder/components/customappbar.dart';

import 'package:flextrip/app/modules/Guide%20de%20voyage/maps.dart';

import 'package:flextrip/app/modules/home/components/home_header.dart';
import 'package:flextrip/app/modules/home/tab/tab_home.dart';

import 'package:flextrip/app/modules/home/views/home_view.dart';
import 'package:flextrip/app/modules/hotel_booking/bottom_tab/bottom_tab_screen.dart';
import 'package:flextrip/app/modules/hotel_booking/explore/home_explore_screen.dart';
import 'package:flextrip/app/modules/hotel_booking/filtertest.dart';
import 'package:flextrip/app/modules/hotel_booking/hotel_detailes/HomeScreen.dart';
import 'package:flextrip/app/modules/hotel_booking/hotel_detailes/sub_collection.dart';
import 'package:flextrip/app/modules/hotel_booking/hotel_home_screen.dart';
import 'package:flextrip/app/modules/hotel_booking/utils/helper.dart';
import 'package:flextrip/app/modules/hotel_booking/utils/text_styles.dart';
import 'package:flextrip/app/modules/hotel_booking/widgets/common_card.dart';
import 'package:flextrip/app/modules/nearby_hotels/test_screen.dart';
import 'package:flextrip/app/modules/test/core/theme/app_color.dart';
import 'package:flextrip/app/modules/transport%20locale/HomeW.dart';



import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flextrip/constants/constent_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';



class Dashborder extends StatefulWidget {
 //  final AnimationController animationController;
 late AnimationController _animationController;
   Dashborder({super.key,});

  @override
  State<Dashborder> createState() => _DashborderState();
}

class _DashborderState extends State<Dashborder>with TickerProviderStateMixin{
  //  var hotelList = HotelListData.hotelList;
  // late ScrollController controller;
  // late AnimationController _animationController;
  // var sliderImageHieght = 0.0;
  int _current=0;

late AnimationController _animationController;
  @override
  void initState() {
    _animationController =
        AnimationController(duration: Duration(milliseconds: 400), vsync:this );
    //_indexView = Container();
    WidgetsBinding.instance.addPostFrameCallback((_) => _startLoadScreen());
    super.initState();
  }

  Future _startLoadScreen() async {
    await Future.delayed(const Duration(milliseconds: 480));
    setState(() {
      // _isFirstTime = false;
      // _indexView = HomeExploreScreen(
      //   animationController: _animationController,
      // );
    });
    _animationController..forward();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

 // ignore: non_constant_identifier_names
 List<T> map<T>(List list,Function handler){
    List<T> result =[];
    for(var i = 0; i<list.length;i++){
      result.add(handler(i,list[i]));
    }
    return result;
 }

//  void initState() {
//     _animationController =
//         AnimationController(duration: Duration(milliseconds: 0), vsync: this);
//     widget.animationController.forward();
//     controller = ScrollController(initialScrollOffset: 0.0);
//     controller
//       ..addListener(() {
//         if (mounted) {
//           if (controller.offset < 0) {
//             // we static set the just below half scrolling values
//             _animationController.animateTo(0.0);
//           } else if (controller.offset > 0.0 &&
//               controller.offset < sliderImageHieght) {
//             // we need around half scrolling values
//             if (controller.offset < ((sliderImageHieght / 1.5))) {
//               _animationController
//                   .animateTo((controller.offset / sliderImageHieght));
//             } else {
//               // we static set the just above half scrolling values "around == 0.64"
//               _animationController
//                   .animateTo((sliderImageHieght / 1.5) / sliderImageHieght);
//             }
//           }
//         }
//       });
//     super.initState();
//   }

  @override
  Widget build(BuildContext context) {
     BuildContext myContext = context; // Get the context of the current widget
   
    return Scaffold(
    body: Flex(
       direction: Axis.vertical,
      children: [
        const HomeHeader(),
     // Padding(
       // padding: const EdgeInsets.only(left: 10,right: 10),
       Container(
          decoration: BoxDecoration(
             borderRadius: BorderRadius.only(
                topLeft: Radius.circular(10),
                bottomLeft: Radius.circular(10),
                bottomRight: Radius.circular(10),
                topRight: Radius.circular(80)
              ),
              boxShadow:[
                BoxShadow(
                       offset: Offset(5, 10),
                  blurRadius: 10,
                  color: Colors.white38.withOpacity(0.2)
               ),
              ]
          ),
          child: SingleChildScrollView(
          child:   Padding(
            padding: const EdgeInsets.only(right: 20,left: 20),
            child: ClipRRect(
               borderRadius: BorderRadius.only(
                topLeft: Radius.circular(10),
                bottomLeft: Radius.circular(10),
                bottomRight: Radius.circular(10),
                topRight: Radius.circular(80)
              ),
                       // borderRadius: const BorderRadius.all(Radius.circular(16.0)),
                        child: Stack(
                          children: <Widget>[
                            Column(
                              children: <Widget>[
                                Stack(
                                  children:[
                                    AspectRatio(
                                    aspectRatio: 2,
                                    child: Image.asset(
                                      'assets/images/imgdestination5.jpg',
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                  Padding(
                                     padding: EdgeInsets.only(left: 20,top: 25,right: 20),
                                    child: Column(
                                      children: [
                                         Text('Nous esperons',style: TextStyle(fontSize: 16,color: Colors.white),
                                                        ),
                                                        SizedBox(height: 5,),
                                                         Text(' que vous passerez un',style: TextStyle(fontSize: 25,color: Colors.white)),
                                                       SizedBox(height: 5,),
                                                         Text('bon moment',style: TextStyle(fontSize: 25,color: Colors.white),
                                                        ),
                                                        SizedBox(height: 25,),
                                                         SizedBox(height: 25,),
                                                         Row(
                                                          children: [
                                                              Icon(Icons.timer,size: 20,color: Colors.white,),
                              SizedBox(width: 10,),
                              Text('60 min',style: TextStyle(fontSize: 14,color: Colors.white),
                      ),
                                                          ],
                                                         ),
                                                        
                                      ],
                                    ),
                                  ),
                                       Container(
                                        padding: EdgeInsets.only(top: 125,left: 310,),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(60),
                              boxShadow:[
                                BoxShadow(
                                  color: Colors.transparent,
                                  blurRadius: 10,
                                  offset: Offset(4, 8)
                                )
                              ]
                            ),
                             child: Icon(Icons.play_circle_fill,
                                             color: Colors.white,
                                             size: 60,
                                             ),
                           ),
                        SizedBox(height: 5,)
           
                                  ] ,
                                ),
                             // Text('yade'),
                            
                        
                   //   physics: ClampingScrollPhysics(),
              // Column(
              //  children: [
                //  SizedBox(height: 10,),
                  
            //       Container(
            //         margin: EdgeInsets.only(left: 16,right: 16,),
            //      width: MediaQuery.of(context).size.width,
            //      height: 200,
                 
            //      decoration: BoxDecoration(
            //       gradient: LinearGradient(
            //         colors:[
            //         // AppColor.myColor,
            //         //Colors.black,
            //         // Color(0xFF26A69A),
            //         //  Color(0xFFB2DFDB)
            //          ],
            //          begin: Alignment.bottomLeft,
            //          end: Alignment.centerRight
            //         ),
                    
            //  //   color: Colors.red,
            //     borderRadius: BorderRadius.only(
            //       topLeft: Radius.circular(10),
            //       bottomLeft: Radius.circular(10),
            //       bottomRight: Radius.circular(10),
            //       topRight: Radius.circular(80)
            //     ),
            //     boxShadow:[
            //       BoxShadow(
            //              offset: Offset(5, 10),
            //         blurRadius: 10,
            //         color: Colors.white38.withOpacity(0.2)
            //      ),
            //     ] 
            //      ),
            //     child:
            // Container(
            //       padding: EdgeInsets.only(left: 20,top: 25,right: 20),
            //       child: Column(
            //         crossAxisAlignment: CrossAxisAlignment.start,
            //         children: [
            //           Text('Nous esperons',style: TextStyle(fontSize: 16,color: Colors.white),
            //           ),
            //           SizedBox(height: 5,),
            //            Text(' que vous passerez un',style: TextStyle(fontSize: 25,color: Colors.white)),
            //          SizedBox(height: 5,),
            //            Text('bon moment',style: TextStyle(fontSize: 25,color: Colors.white),
            //           ),
            //           SizedBox(height: 25,),
            //           Row(
            //           //  crossAxisAlignment: CrossAxisAlignment.end,
            //             children: [
            //               Row(
            //                 children: [
            //                   Icon(Icons.timer,size: 20,color: Colors.white,),
            //                   SizedBox(width: 10,),
            //                   Text('60 min',style: TextStyle(fontSize: 14,color: Colors.white),
            //           ),
                            
            //                 ],
            //               ),
            //               Expanded(child: Container()),
            //                Container(
            //                 decoration: BoxDecoration(
            //                   borderRadius: BorderRadius.circular(60),
            //                   boxShadow:[
            //                     BoxShadow(
            //                       color: Color(0xFF26A69A),
            //                       blurRadius: 10,
            //                       offset: Offset(4, 8)
            //                     )
            //                   ]
            //                 ),
            //                  child: Icon(Icons.play_circle_fill,
            //                                  color: Colors.white,
            //                                  size: 60,
            //                                  ),
            //                ),
            //             SizedBox(height: 5,)
                
            //             ],
                        
            //           ),
            //         ],
            //       ),
            //     ),
              //  ]
                 // ),
                 SizedBox(height: 18,),
             Row(
              crossAxisAlignment: CrossAxisAlignment.start,
               children: [
                 Padding(padding: EdgeInsets.only(left: 16,right:24,bottom: 12),
                    child: Text('Let\'s Start'.tr,style: mtravelingtitle,),
                    ),
               ],
             ),
             SizedBox(height: 5,),
                Container(
                  height: 144,
                 // margin: EdgeInsets.only(left: 16,right: 16),
                  //child: Padding(
                   // padding: const EdgeInsets.only(right: 30),
                    child: Column(
                      children: <Widget>[
                    //     Row(
                    //       children: <Widget>[
                           
                          
                    //             GestureDetector(
                    //               onTap: (){
                    //                  Navigator.push(context,
                    //      MaterialPageRoute(builder: (context)=> 
                    //     // HomeScreens()
                    //   //  FirebaseSearchScreen()
                    //  // SplashScreen()
                    // // HomeView()
                    //        HomeExploreScreen(
                    // animationController: _animationController,
                    //   )
                    //                         ));
                    //               },
                                  
                    //                child: Expanded(
                    //                  child: Container(
                    //                                        margin: EdgeInsets.only(right: 8),
                    //                                        padding: EdgeInsets.only(left: 16),
                    //                                        height: 64,
                    //                                        decoration: BoxDecoration(
                    //                  // color: Color(0xFFFFFFFF),
                    //                   borderRadius: BorderRadius.circular(12),
                    //                   border: Border.all(color: Color(0xFFE8E8F3),width: 1),
                                                         
                    //                                        ),
                    //                                        child: Row(
                    //                   children: <Widget>[
                                        
                    //                          Image.asset('assets/icons/bus1.png',
                                            
                                          
                                                                      
                    //                         fit: BoxFit.cover,
                    //                         ),
                                          
                                        
                    //                    // Image.asset('assets/icons/flight.png',
                    //                     // width: 64,
                    //                     // height: 64,
                                        
                    //                    // ),
                    //                     Padding(padding: EdgeInsets.only(left: 16),
                    //                     child: Column(
                    //                       mainAxisAlignment: MainAxisAlignment.center,
                    //                       crossAxisAlignment: CrossAxisAlignment.start,
                    //                      children: <Widget>[
                    //                       Text('Flight'.tr,style: mservicetitel,),
                    //                       Text('Feel freedom'.tr,style: mservicesubtitel,)
                    //                      ],
                    //                     ),
                    //                     )
                                        
                    //                   ],
                    //                                        ),
                    //                                   ),
                    //                ),
                    //              ),
                    //              GestureDetector(
                    //               onTap: (){
                                    
                    //           Navigator.push(context,
                    //               MaterialPageRoute(builder: (context)=>
                    //           //     MotelApp()
                    //           TabHome()
                    //                         ));
                    //               },
                    //                child: Expanded(
                    //                  child: Container(
                    //                                        margin: EdgeInsets.only(right: 8),
                    //                                        padding: EdgeInsets.only(left: 16),
                    //                                        height: 64,
                    //                                        decoration: BoxDecoration(
                    //                  // color: Color(0xFFFFFFFF),
                    //                   borderRadius: BorderRadius.circular(12),
                    //                   border: Border.all(color: Color(0xFFE8E8F3),width: 1),
                                                         
                    //                                        ),
                    //                                        child: Row(
                    //                   children: <Widget>[
                                        
                    //                          Image.asset('assets/icons/plane1.png',
                                             
                                                                     
                                            
                    //                         ),
                                          
                                        
                    //                     Padding(padding: EdgeInsets.only(left: 16),
                    //                     child: Column(
                    //                       mainAxisAlignment: MainAxisAlignment.center,
                    //                       crossAxisAlignment: CrossAxisAlignment.start,
                    //                      children: <Widget>[
                    //                       Text('Trains'.tr,style: mservicetitel,),
                    //                       Text('Security'.tr,style: mservicesubtitel,)
                    //                      ],
                    //                     ),
                    //                     )
                                        
                    //                   ],
                    //                                        ),
                    //                                   ),
                    //                ),
                    //              ),
                              
                              
                    //       ],
                    //     ),
                    
                       // SizedBox(height: 16,),
                         Row(
                          children: <Widget>[
                           
                          
                                 GestureDetector(
                                 onTap: (){
                                    
                              Navigator.push(context,
                                   MaterialPageRoute(builder: (context)=>
                              //     MotelApp()
                               TabHome()
                               //MapSample()
                                            ));
                                },
                                   child: Expanded(
                                     child: Container(
                                                           margin: EdgeInsets.only(right: 8),
                                                           padding: EdgeInsets.only(left: 16),
                                                           height: 64,
                                                           decoration: BoxDecoration(
                                    //  color: Color(0xFFFFFFFF),
                                      borderRadius: BorderRadius.circular(12),
                                      border: Border.all(color: Color(0xFFE8E8F3),width: 1),
                                                         
                                                           ),
                                                           child: Row(
                                      children: <Widget>[
                                        Image.asset('assets/icons/flight.png',
                                      
                                        
                                        ),
                                        Padding(padding: EdgeInsets.only(left: 16),
                                        child: Column(
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                         children: <Widget>[
                                          Text('Vols'.tr,style: mservicetitel,),
                                          Text('Lets comfortob'.tr,style: mservicesubtitel,)
                                         ],
                                        ),
                                        )
                                        
                                      ],
                                                           ),
                                                      ),
                                   ),
                                 ),
                                 GestureDetector(
                                    onTap: (){
                                     Navigator.push(context,
                         MaterialPageRoute(builder: (context)=> 
                        // HomeScreens()
                      //  FirebaseSearchScreen()
                     // SplashScreen()
                                   // HomeView()
                           HomeExploreScreen(
                    animationController: _animationController,
                      )
                                            ));
                                  },
                                   child: Expanded(
                                     child: Container(
                                                           margin: EdgeInsets.only(right: 8),
                                                           padding: EdgeInsets.only(left: 16),
                                                           height: 64,
                                                           decoration: BoxDecoration(
                                     // color: Color(0xFFFFFFFF),
                                      borderRadius: BorderRadius.circular(12),
                                      border: Border.all(color: Color(0xFFE8E8F3),width: 1),
                                                         
                                                           ),
                                                           child: Row(
                                      children: <Widget>[
                                        Image.asset('assets/icons/reservation.png',
                                       
                                        ),
                                        Padding(padding: EdgeInsets.only(left: 16),
                                        child: Column(
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                         children: <Widget>[
                                          Text('Hotels'.tr,style: mservicetitel,),
                                         // Text('Around the city'.tr,style: mservicesubtitel,)
                                         ],
                                        ),
                                        )
                                        
                                      ],
                                                           ),
                                                      ),
                                   ),
                                 ),
                                  
                               ]
                         ),
                         
                        
                         SizedBox(height: 16,),
                                           Row(
                          children: <Widget>[
                           
                          
                                 GestureDetector(
                                    onTap: (){
                                     Navigator.push(context,
                         MaterialPageRoute(builder: (context)=> 
                       Home()
                                            ));
                                  },
                                   child: Expanded(
                                     child: Container(
                                                           margin: EdgeInsets.only(right: 8),
                                                           padding: EdgeInsets.only(left: 16),
                                                           height: 64,
                                                           decoration: BoxDecoration(
                                    //  color: Color(0xFFFFFFFF),
                                      borderRadius: BorderRadius.circular(12),
                                      border: Border.all(color: Color(0xFFE8E8F3),width: 1),
                                                         
                                                           ),
                                                           child: Row(
                                      children: <Widget>[
                                        Image.asset('assets/icons/transport.png',
                                      
                                        
                                        ),
                                        Padding(padding: EdgeInsets.only(left: 16),
                                        child: Column(
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                         children: <Widget>[
                                          Text('Transport'.tr,style: mservicetitel,),
                                          Text('Lets comfortob'.tr,style: mservicesubtitel,)
                                         ],
                                        ),
                                        )
                                        
                                      ],
                                                           ),
                                                      ),
                                   ),
                                 ),
                                 GestureDetector(
                                  onTap: (){
                                    
                              Navigator.push(context,
                                   MaterialPageRoute(builder: (context)=>
                              //     MotelApp()
                              // TabHome()
                         
                               MapScreen()
                                            ));
                                },
                                   child: Expanded(
                                     child: Container(
                                                           margin: EdgeInsets.only(right: 12,),
                                                           padding: EdgeInsets.only(left: 16),
                                                           height: 64,
                                                           decoration: BoxDecoration(
                                     // color: Color(0xFFFFFFFF),
                                      borderRadius: BorderRadius.circular(12),
                                      border: Border.all(color: Color(0xFFE8E8F3),width: 1),
                                                         
                                                           ),
                                                           child: Row(
                                      children: <Widget>[
                                        Image.asset('assets/icons/others.png',
                                       
                                        ),
                                        Padding(padding: EdgeInsets.only(left: 16,),
                                        child: Column(
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                         children: <Widget>[
                                          Text('Guide'.tr,style: mservicetitel,),
                                        // Text('de voyage '.tr,style: mservicetitel,),
                                        //  Text('Around the city'.tr,style: mservicesubtitel,)
                                         ],
                                        ),
                                        )
                                        
                                      ],
                                                           ),
                                                      ),
                                   ),
                                 ),
                              
                              
                          ],
                        )
                      ],
                    ),
                  ),
                
                
                
                SizedBox(height: 25),
             //populair destination section
             Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                   children: [
             Padding(padding: EdgeInsets.only(left: 16,right:24,bottom: 12),
                    child: Text('Populair Destination!'.tr,style: mtravelingtitle,),
                    ),
                   ],
             ),
                Container(
                  height: 140,
                  child: ListView.builder(
                    itemCount: recommendedplaces.length,
                    padding: EdgeInsets.only(left: 16,right: 16),
                    scrollDirection:Axis.horizontal,
                    itemBuilder: (context,index){
                      return Card(
                        elevation: 0,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12)
                        ),
                        child: Container(
                        // height: 350,
                          width: 140,
                          margin: EdgeInsets.all(10),
                          padding: EdgeInsets.symmetric(vertical: 4),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            border: Border.all(color: Color(0xFFE8E8F3),width: 1),
                            boxShadow: [BoxShadow(
                              color: Colors.white,
                              blurRadius: 4,
                              spreadRadius: 2
                            )]
                          ),
                          
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            // crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              
                               
                                  CircleAvatar(
                                    radius: 35,
                                    
                                    backgroundImage:AssetImage(recommendedplaces[index].image,) ,
                                  ),
                                  Text(recommendedplaces[index].location,style: mPopulairdestination,),
                           
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
                
                    ],
                  ),
                          ]
                ),
              ),
            ),
                  ),
                // Padding(padding: EdgeInsets.only(left: 16,right:24,bottom: 12),
                // child: Text('Travlog!'.tr,style: mtravelingtitle,),
                // ),
                              
              )
                          
               // SizedBox(height: 12),
               
            
              //  SizedBox(height: 12),
               
              
             //service section
            
              //  SizedBox(height: 10,),
                // Container(child: ImageCards()),
                          ] 
            ),
            );
        
  }
}
//  Container(
//               height: 144,
//               margin: EdgeInsets.only(left: 16,right: 16),
//               child: Column(
//                 children: <Widget>[
//                   Row(
//                     children: <Widget>[
                     
                    
//                           GestureDetector(
//                             onTap: (){
//                                Navigator.push(context,
//                    MaterialPageRoute(builder: (context)=> 
//                   // HomeScreens()
//                 //  FirebaseSearchScreen()
//                // SplashScreen()
//               // HomeView()
//                      HomeExploreScreen(
//               animationController: _animationController,
//                 )
//                                       ));
//                             },
                            
//                              child: Expanded(
//                                child: Container(
//                                                      margin: EdgeInsets.only(right: 8),
//                                                      padding: EdgeInsets.only(left: 16),
//                                                      height: 64,
//                                                      decoration: BoxDecoration(
//                                // color: Color(0xFFFFFFFF),
//                                 borderRadius: BorderRadius.circular(12),
//                                 border: Border.all(color: Color(0xFFE8E8F3),width: 1),
                                                   
//                                                      ),
//                                                      child: Row(
//                                 children: <Widget>[
                                  
//                                        Image.asset('assets/icons/bus1.png',
                                      
                                    
                                                                
//                                       fit: BoxFit.cover,
//                                       ),
                                    
                                  
//                                  // Image.asset('assets/icons/flight.png',
//                                   // width: 64,
//                                   // height: 64,
                                  
//                                  // ),
//                                   Padding(padding: EdgeInsets.only(left: 16),
//                                   child: Column(
//                                     mainAxisAlignment: MainAxisAlignment.center,
//                                     crossAxisAlignment: CrossAxisAlignment.start,
//                                    children: <Widget>[
//                                     Text('Flight'.tr,style: mservicetitel,),
//                                     Text('Feel freedom'.tr,style: mservicesubtitel,)
//                                    ],
//                                   ),
//                                   )
                                  
//                                 ],
//                                                      ),
//                                                 ),
//                              ),
//                            ),
//                            GestureDetector(
//                             onTap: (){
                              
//                         Navigator.push(context,
//                             MaterialPageRoute(builder: (context)=>
//                         //     MotelApp()
//                         TabHome()
//                                       ));
//                             },
//                              child: Expanded(
//                                child: Container(
//                                                      margin: EdgeInsets.only(right: 8),
//                                                      padding: EdgeInsets.only(left: 16),
//                                                      height: 64,
//                                                      decoration: BoxDecoration(
//                                // color: Color(0xFFFFFFFF),
//                                 borderRadius: BorderRadius.circular(12),
//                                 border: Border.all(color: Color(0xFFE8E8F3),width: 1),
                                                   
//                                                      ),
//                                                      child: Row(
//                                 children: <Widget>[
                                  
//                                        Image.asset('assets/icons/plane1.png',
                                       
                                                               
                                      
//                                       ),
                                    
                                  
//                                   Padding(padding: EdgeInsets.only(left: 16),
//                                   child: Column(
//                                     mainAxisAlignment: MainAxisAlignment.center,
//                                     crossAxisAlignment: CrossAxisAlignment.start,
//                                    children: <Widget>[
//                                     Text('Trains'.tr,style: mservicetitel,),
//                                     Text('Security'.tr,style: mservicesubtitel,)
//                                    ],
//                                   ),
//                                   )
                                  
//                                 ],
//                                                      ),
//                                                 ),
//                              ),
//                            ),
                        
                        
//                     ],
//                   ),
//                   SizedBox(height: 16,),
//                    Row(
//                     children: <Widget>[
                     
                    
//                            Expanded(
//                              child: Container(
//                                                    margin: EdgeInsets.only(right: 8),
//                                                    padding: EdgeInsets.only(left: 16),
//                                                    height: 64,
//                                                    decoration: BoxDecoration(
//                             //  color: Color(0xFFFFFFFF),
//                               borderRadius: BorderRadius.circular(12),
//                               border: Border.all(color: Color(0xFFE8E8F3),width: 1),
                                                 
//                                                    ),
//                                                    child: Row(
//                               children: <Widget>[
//                                 Image.asset('assets/icons/hotel.png',
                              
                                
//                                 ),
//                                 Padding(padding: EdgeInsets.only(left: 16),
//                                 child: Column(
//                                   mainAxisAlignment: MainAxisAlignment.center,
//                                   crossAxisAlignment: CrossAxisAlignment.start,
//                                  children: <Widget>[
//                                   Text('Hotel'.tr,style: mservicetitel,),
//                                   Text('Lets comfortob'.tr,style: mservicesubtitel,)
//                                  ],
//                                 ),
//                                 )
                                
//                               ],
//                                                    ),
//                                               ),
//                            ),
//                            Expanded(
//                              child: Container(
//                                                    margin: EdgeInsets.only(right: 8),
//                                                    padding: EdgeInsets.only(left: 16),
//                                                    height: 64,
//                                                    decoration: BoxDecoration(
//                              // color: Color(0xFFFFFFFF),
//                               borderRadius: BorderRadius.circular(12),
//                               border: Border.all(color: Color(0xFFE8E8F3),width: 1),
                                                 
//                                                    ),
//                                                    child: Row(
//                               children: <Widget>[
//                                 Image.asset('assets/icons/recirculated.png',
                               
//                                 ),
//                                 Padding(padding: EdgeInsets.only(left: 16),
//                                 child: Column(
//                                   mainAxisAlignment: MainAxisAlignment.center,
//                                   crossAxisAlignment: CrossAxisAlignment.start,
//                                  children: <Widget>[
//                                   Text('Car Rental'.tr,style: mservicetitel,),
//                                   Text('Around the city'.tr,style: mservicesubtitel,)
//                                  ],
//                                 ),
//                                 )
                                
//                               ],
//                                                    ),
//                                               ),
//                            ),
                        
                        
//                     ],
//                   )
//                 ],
//               ),
//             ),


  // Container(
  //             alignment: Alignment.centerLeft,
  //             margin: EdgeInsets.only(left: 16,right: 16),
  //             width: MediaQuery.of(context).size.width,
  //             child: Column(
  //               crossAxisAlignment: CrossAxisAlignment.start,
  //               mainAxisAlignment: MainAxisAlignment.start,
  //               children: <Widget>[
  //                 Container(
  //                   width: MediaQuery.of(context).size.width,
  //                    padding: EdgeInsets.all(16.0),
  //                   decoration: BoxDecoration(
  //                     borderRadius: BorderRadius.circular(10)
  //                   ),
  //                   height: 190,
  //                   child: Image.asset('assets/slider_3.png'),
  //                 )
                           
                        
  //               ,
  //                 SizedBox(height: 18,),
                
  //               ],
  //             ),
  //           )