

import 'package:flextrip/app/models/recommended_places.dart';
import 'package:flextrip/app/modules/Dashborder/components/customappbar.dart';
import 'package:flextrip/app/modules/home/tab/tab_home.dart';

import 'package:flextrip/app/modules/home/views/home_view.dart';
import 'package:flextrip/app/modules/hotel_booking/bottom_tab/bottom_tab_screen.dart';
import 'package:flextrip/app/modules/hotel_booking/explore/home_explore_screen.dart';
import 'package:flextrip/app/modules/hotel_booking/filtertest.dart';
import 'package:flextrip/app/modules/hotel_booking/hotel_detailes/HomeScreen.dart';
import 'package:flextrip/app/modules/hotel_booking/hotel_detailes/sub_collection.dart';
import 'package:flextrip/app/modules/hotel_booking/hotel_home_screen.dart';
import 'package:flextrip/app/modules/nearby_hotels/test_screen.dart';




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
      
      // appBar: AppBar(
      //   //backgroundColor: Mbackgroundcolor,
      //   title:SvgPicture.asset('assets/icons/apple_box.svg') ,
      //   elevation: 0,
      // ),
      
    //  backgroundColor: Mbackgroundcolor,
      
    body: Container(
      
      child: ListView(
        physics: ClampingScrollPhysics(),
        children:<Widget> [
          SizedBox(height: 12),
          CustomAppBar(),
          SizedBox(height: 12),
          // Padding(padding: EdgeInsets.only(left: 16,right:24,bottom: 12),
          // child: Text('Hi, Mintmalainin  this promos for you',style: mtravelingtitle,),
          // ),
          Container(
            alignment: Alignment.centerLeft,
            margin: EdgeInsets.only(left: 16,right: 16),
            width: MediaQuery.of(context).size.width,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Container(
                  width: MediaQuery.of(context).size.width,
                   padding: EdgeInsets.all(16.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10)
                  ),
                  height: 190,
                  child: Image.asset('assets/slider_3.png'),
                )
                         
                      
              ,
                SizedBox(height: 18,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Row(
                      children: map<Widget>(recommendedplaces,(index,image){
                        return Container(
                          alignment: Alignment.centerLeft,
                          height: 6,
                          width: 6,
                          margin: EdgeInsets.only(right: 8),
                          padding: EdgeInsets.only(right: 10,left: 10),
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: _current ==index
                            ?Color(0XFF2C53B1)
                            :Colors.grey
                          ),
                        );
                      }),
                    ),
                    //more
                    Text('More...',style: mtravelingplaces,)
                  ],
                )
              ],
            ),
          )
       ,//service section
       SizedBox(height: 12,),
       Padding(padding: EdgeInsets.only(left: 16,right:24,bottom: 12),
          child: Text('Let\'s Start'.tr,style: mtravelingtitle,),
          ),
          Container(
            height: 144,
            margin: EdgeInsets.only(left: 16,right: 16),
            child: Column(
              children: <Widget>[
                Row(
                  children: <Widget>[
                   
                  
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
                                
                                     Image.asset('assets/icons/bus1.png',
                                    
                                  
                                                              
                                    fit: BoxFit.cover,
                                    ),
                                  
                                
                               // Image.asset('assets/icons/flight.png',
                                // width: 64,
                                // height: 64,
                                
                               // ),
                                Padding(padding: EdgeInsets.only(left: 16),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                 children: <Widget>[
                                  Text('Flight'.tr,style: mservicetitel,),
                                  Text('Feel freedom'.tr,style: mservicesubtitel,)
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
                      TabHome()
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
                                
                                     Image.asset('assets/icons/plane1.png',
                                     
                                                             
                                    
                                    ),
                                  
                                
                                Padding(padding: EdgeInsets.only(left: 16),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                 children: <Widget>[
                                  Text('Trains'.tr,style: mservicetitel,),
                                  Text('Security'.tr,style: mservicesubtitel,)
                                 ],
                                ),
                                )
                                
                              ],
                                                   ),
                                              ),
                           ),
                         ),
                      
                      
                  ],
                ),
                SizedBox(height: 16,),
                 Row(
                  children: <Widget>[
                   
                  
                         Expanded(
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
                              Image.asset('assets/icons/hotel.png',
                            
                              
                              ),
                              Padding(padding: EdgeInsets.only(left: 16),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                               children: <Widget>[
                                Text('Hotel'.tr,style: mservicetitel,),
                                Text('Lets comfortob'.tr,style: mservicesubtitel,)
                               ],
                              ),
                              )
                              
                            ],
                                                 ),
                                            ),
                         ),
                         Expanded(
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
                              Image.asset('assets/icons/recirculated.png',
                             
                              ),
                              Padding(padding: EdgeInsets.only(left: 16),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                               children: <Widget>[
                                Text('Car Rental'.tr,style: mservicetitel,),
                                Text('Around the city'.tr,style: mservicesubtitel,)
                               ],
                              ),
                              )
                              
                            ],
                                                 ),
                                            ),
                         ),
                      
                      
                  ],
                )
              ],
            ),
          ),
          SizedBox(height: 18),
       //populair destination section
 Padding(padding: EdgeInsets.only(left: 16,right:24,bottom: 12),
          child: Text('Populair Destination!'.tr,style: mtravelingtitle,),
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
                           Text(recommendedplaces[index].type,style: mservicesubtitel,),
                          
                        
                        // Image.asset(recommendedplaces[index].image),
                        // Text(recommendedplaces[index].location,style: mPopulairdestination,),
                        //  Text(recommendedplaces[index].type,style: mservicesubtitel,),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
          Padding(padding: EdgeInsets.only(left: 16,right:24,bottom: 12),
          child: Text('Travlog!'.tr,style: mtravelingtitle,),
          ),
        //  SizedBox(height: 10,),
          // Container(child: ImageCards()),
        ],
      ),
    ),
    );
  }
}