import 'package:flextrip/app/models/booking_model.dart';
import 'package:flextrip/app/models/product_model.dart';
import 'package:flextrip/app/models/recommended_places.dart';
import 'package:flextrip/app/modules/hotel%20booking/chekout_page.dart';
import 'package:flextrip/app/modules/hotel%20booking/core/theme/app_color.dart';
import 'package:flextrip/app/modules/hotel%20booking/feature/detail_destionation/constent_style.dart';
import 'package:flextrip/app/modules/hotel%20booking/feature/detail_destionation/presentation/reveiws.dart';
import 'package:flextrip/app/modules/hotel%20booking/feature/detail_destionation/recommendedItems.dart';
import 'package:flextrip/app/modules/hotel%20booking/feature/detail_destionation/recommendedView.dart';
import 'package:flextrip/app/modules/hotel%20booking/feature/detail_destionation/reviewUI.dart';
import 'package:flextrip/app/modules/hotel%20booking/feature/detail_destionation/suggestion_list.dart';
import 'package:flextrip/app/modules/hotel%20booking/feature/home/model/place.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:carousel_slider/carousel_controller.dart';
import 'package:carousel_slider/utils.dart';
import 'package:flextrip/app/modules/hotel%20booking/ticket_detail_view.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:flextrip/styles/styles.dart';
import 'package:flextrip/utils/app_asset.dart';
import 'package:flutter/material.dart';




// class DetailDestinationScreen extends StatelessWidget {
//    DetailDestinationScreen({ super.key, required this.destination});
//   final Place destination;
//   @override
//   Widget build(BuildContext context) {
//    //final destination = ModalRoute.of(context)?.settings.arguments as Place;
    
//     return Scaffold(
//       body: Column(
//         children: [
//          Container(
//           child: Center(
//             child: ListView(
//               children: [
//                 SizedBox(
//                   height: 200.0,
//                   width: double.infinity,
//                   child: Carousel(
//                      images: [
//                       // 
//                       destination.photos
//                      ],
//                   ),
//                 )
//               ],
//             ),
//           ),
//          )
                
//               ],
//             ),
//           );
        
        
      
    
//   }
// }





class DetailDestinationScreen extends StatelessWidget {
   DetailDestinationScreen( {Key? key,
  required this.productModel,  })
      : super(key: key);
      int activeIndex = 0;
  final controller = CarouselController();
         final urlImages = [
     "assets/images/profile_1.jpeg",
      "assets/images/profile_2.jpeg",
      "assets/images/profile_3.jpeg",
  ];


      final ProductModel productModel;
      
  bool isMore = false;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
       body:
             Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(height: 12),
                Stack(
                  children: [
                   CarouselSlider.builder(
                  carouselController: controller,
                  itemCount:2,
                  itemBuilder: (context, index, realIndex) {
                    //final urlImage = productList[index];
                    return  ClipRRect(
      borderRadius:BorderRadius.circular(20),
      child: SizedBox(
        width: 300,
        child:
          Row(
           children: [
              ...productModel.photos.map((e) {
                final index = productModel.photos.indexOf(e);
                return 
                   Padding(
                     padding: const EdgeInsets.all(8.0),
                     child: Container(
                       child: Image.network(
                          AppAsset.image(e),
                          fit: BoxFit.cover,
                         
                        ),
                     ),
                   );
              }
              )
            ],
          )
           
          ),
              
            
              
          
        );
      ;
                  },
                  options: CarouselOptions(height: 300,
                  
                      autoPlay: true,
                      enableInfiniteScroll: false,
                      autoPlayAnimationDuration: Duration(seconds: 2),
                      enlargeCenterPage: true,
                    )),

                    Positioned(

                     left: 0,
                      right: 0,
                     bottom: 20,
                      child:
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                       buildIndicator()
                  ])
                    )
                  ]
                ),
                
                Expanded(
            child: SingleChildScrollView(
             padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                height: 300,
              ),   
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              productModel.name,
                              style: Theme.of(context).textTheme.headlineMedium,
                            ),
                            const SizedBox(height: 8),
                            Row(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                const Icon(
                                  Icons.place,
                                  color: Colors.red,
                                ),
                                const SizedBox(width: 8),
                                Text(productModel.location),
                              ],
                            ),
                            SizedBox(height: 10,),
                           //
                           Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text('related room',style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 18.0
        ),),
        TextButton(onPressed: (() {
          
        }), child: 
        Container(
          margin: EdgeInsets.only(left:10),
          child: Text("See All",style: TextStyle(
            color: Color(0xFF26A69A)
          ),),
        )
        )
      ],
    ),
           
                           const SizedBox(height:16),
                            Row(
                              children: [
                                Wrap(
                                  spacing: -24,
                                  children: productModel.testimonials
                                      .map((e) => Container(
                                            height: 48,
                                            width: 48,
                                            decoration: BoxDecoration(
                                              border: Border.all(
                                                color: Colors.white,
                                                width: 2,
                                              ),
                                              shape: BoxShape.circle,
                                              image: DecorationImage(
                                                image: AssetImage(e),
                                                fit: BoxFit.cover,
                                              ),
                                            ),
                                          ))
                                      .toList(),
                                ),
                                const SizedBox(width: 8),
                                TextButton(
                                  onPressed: () {},
                                  child: const Text(
                                    "see what they say.",
                                  ),
                                )
                              ],
                            ),
                          ],
                        ),
                      ),
                      Column(
                        children: [
                          Container(
                            padding: const EdgeInsets.all(8),
                            decoration: BoxDecoration(
                              color: Colors.amber[100],
                              borderRadius: BorderRadius.circular(16),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                const Icon(
                                  Icons.star_rounded,
                                  color: Colors.amber,
                                ),
                                const SizedBox(width: 8),
                                Text(productModel.rating.toString()),
                                const SizedBox(width: 8),
                              ],
                            ),
                          ),
                          const SizedBox(height: 16),
                          RichText(
                            text: TextSpan(
                              children: [
                                TextSpan(
                                  text: "\$${productModel.price}",
                                  style: Theme.of(context)
                                      .textTheme
                                      .headlineSmall
                                      ?.copyWith(
                                        color: AppColor.primaryColor,
                                      ),
                                ),
                                const TextSpan(text: "\n"),
                                // TextSpan(
                                //   text: "/Person",
                                //   style: Theme.of(context).textTheme.bodyMedium,
                                // ),
                              ],
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                  
 const SizedBox(height: 16),
                 //
                           Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text('special for you',style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 18.0
        ),),
        TextButton(onPressed: (() {
          
        }), child: 
        Container(
          margin: EdgeInsets.only(left:10),
          child: Text("See All",style: TextStyle(
            color: Color(0xFF26A69A)
          ),),
        )
        )
      ],
    ),
              const SizedBox(height: 16),








                 Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                   children: [
                   
                                                   Container(
                                                      // margin: EdgeInsets.all(5),
                                                      // padding: EdgeInsets.all(10),
                                                      height: 64,
                                                       decoration: BoxDecoration(
                                 // color: Color(0xFFFFFFFF),
                                  borderRadius: BorderRadius.circular(12),
                                  border: Border.all(color: Color(0xFFE8E8F3),width: 1),
                                                     
                                                       ),
                                                       child: Column(
                                                      //  mainAxisAlignment:MainAxisAlignment,
                                  children: <Widget>[
                                    
                                        // Image.asset('assets/icons/plane1.png',),
                                      Icon(Icons.pool,color: Colors.grey.shade500,),
                                    
                                   // Padding(padding: EdgeInsets.only(left: 16),
                                     Column(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                     children: <Widget>[
                                      Text('Trains',style: mservicetitel,),
                                     // Text('Security',style: mservicesubtitel,)
                                     ],
                                    ),
                                  //  )
                                    
                                  ],
                                                       ),
                                                  ),
                                                                                                     Container(
                                                      // margin: EdgeInsets.all(5),
                                                      // padding: EdgeInsets.all(10),
                                                      height: 64,
                                                       decoration: BoxDecoration(
                                 // color: Color(0xFFFFFFFF),
                                  borderRadius: BorderRadius.circular(12),
                                  border: Border.all(color: Color(0xFFE8E8F3),width: 1),
                                                     
                                                       ),
                                                       child: Column(
                                                      //  mainAxisAlignment:MainAxisAlignment,
                                  children: <Widget>[
                                    
                                        // Image.asset('assets/icons/plane1.png',),
                                      Icon(Icons.pool,color: Colors.grey.shade500,),
                                    
                                   // Padding(padding: EdgeInsets.only(left: 16),
                                     Column(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                     children: <Widget>[
                                      Text('Trains',style: mservicetitel,),
                                     // Text('Security',style: mservicesubtitel,)
                                     ],
                                    ),
                                  //  )
                                    
                                  ],
                                                       ),
                                                  ),
                                                   Container(
                                                    //  margin: EdgeInsets.all(5),
                                                      // padding: EdgeInsets.all(10),
                                                      height: 64,
                                                       decoration: BoxDecoration(
                                 // color: Color(0xFFFFFFFF),
                                  borderRadius: BorderRadius.circular(12),
                                  border: Border.all(color: Color(0xFFE8E8F3),width: 1),
                                                     
                                                       ),
                                                       child:Column(
                                  children: <Widget>[
                                    
                                       //  Image.asset('assets/icons/plane1.png' ),
                                      Icon(Icons.games,color: Colors.grey.shade500,),
                                    
                                   // Padding(padding: EdgeInsets.only(left: 16),
                                     Column(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                     children: <Widget>[
                                      Text('Trains',style: mservicetitel,),
                                     // Text('Security',style: mservicesubtitel,)
                                     ],
                                    ),
                                  //  )
                                    
                                  ],
                                                       ),
                                                  ),
                                                   Container(
                                                      // margin: EdgeInsets.all(5),
                                                      // padding: EdgeInsets.all(10),
                                                      height: 64,
                                                       decoration: BoxDecoration(
                                 // color: Color(0xFFFFFFFF),
                                  borderRadius: BorderRadius.circular(12),
                                  border: Border.all(color: Color(0xFFE8E8F3),width: 1),
                                                     
                                                       ),
                                                       child: Column(
                                  children: <Widget>[
                                    
                                       //  Image.asset('assets/icons/plane1.png', ),
                                      Icon(Icons.kitchen,color: Colors.grey.shade500,),
                                    
                                   // Padding(padding: EdgeInsets.only(left: 16),
                                   Column(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                     children: <Widget>[
                                      Text('Trains',style: mservicetitel,),
                                     // Text('Security',style: mservicesubtitel,)
                                     ],
                                    ),
                                  //  )
                                    
                                  ],
                                                       ),
                                                  ),
                                                   Container(
                                                      // margin: EdgeInsets.all(5),
                                                     //  padding: EdgeInsets.all(10),
                                                      height: 64,
                                                       decoration: BoxDecoration(
                                 // color: Color(0xFFFFFFFF),
                                  borderRadius: BorderRadius.circular(12),
                                  border: Border.all(color: Color(0xFFE8E8F3),width: 1),
                                                     
                                                       ),
                                                       child: Column(
                                  children: <Widget>[
                                    
                                      //   Image.asset('assets/icons/plane1.png',),
                                      Icon(Icons.wifi,color: Colors.grey.shade500,),
                                    
                                    //Padding(padding: EdgeInsets.only(left: 16),
                                    Column(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                     children: <Widget>[
                                      Text('Trains',style: mservicetitel,),
                                     // Text('Security',style: mservicesubtitel,)
                                     ],
                                    ),
                                  //  )
                                    
                                  ],
                                                       ),
                                                  ),
                   ],
                 ),
                     
 const SizedBox(height: 16),
                //
                           Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text('related room',style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 18.0
        ),),
        TextButton(onPressed: (() {
          
        }), child: 
        Container(
          margin: EdgeInsets.only(left:10),
          child: Text("See All",style: TextStyle(
            color: Color(0xFF26A69A)
          ),),
        )
        )
      ],
    ),
               Row(
            children: [
              ...productModel.photos.map((e) {
                final index = productModel.photos.indexOf(e);
                return Padding(
                  padding: EdgeInsets.only(
                    left: index == 0 ? 0 : 16,
                    right: index == productModel.photos.length - 1 ? 16 : 0,
                    top: 4,
                  ),
                  child: ClipRRect(
                    borderRadius: Corners.medBorder,
                    child: Image.network(
                      AppAsset.image(e),
                      fit: BoxFit.cover,
                      width: 70,
                      height: 70,
                    ),
                  ),
                );
              }),
SizedBox(height: 16,),

//  Padding(
//                //  padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 24),
//                 padding: const EdgeInsets.only(right: 20,left: 20),
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                     Text(
//                       "Top related rooms",
//                       style: Theme.of(context).textTheme.titleMedium,
//                     ),
//                      GestureDetector(
//                       onTap: (){
//                          Navigator.push(context,
//                           MaterialPageRoute(builder: (context)=> Reveiws()
//                                     ));
//                           },
                      
//                        child: Text(
//                         "veiw all",
//                         style: Theme.of(context).textTheme.titleMedium,
//                                          ),
//                      ),
//                   ]
//                 )
//                 )


 
        



            ],
          ),
          
             SizedBox(height: 24),
                  Text(
                    productModel.headline,
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                  const SizedBox(height: 16),
                  Text(
                    productModel.desc,
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                   ReviewUI(
                  image: productModel.asset,
                  name: productModel.name,
                  date: productModel.headline,
                  comment: productModel.price.toString(),
                  rating: productModel.rating,
                  onPressed: () {},
                  onTap: (){
                    
                  },
                  isLess: isMore,
                  // onTap: () => setState(() {
                  //   isMore = !isMore;
                  // }),
                  // isLess: isMore,
                ),
                ],
              ),
              
            ),
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            height: 56,
            margin: EdgeInsets.only(
              bottom: MediaQuery.of(context).padding.bottom,
              left: 24,
              right: 24,
            ),
            child: ElevatedButton(
              onPressed: () {
                Navigator.push(context,
                          MaterialPageRoute(builder: (context)=> TicketDetailView()
                                    ));
                
              },
              
              style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
                
              )),
              child: const Text("BOOK NOW"),
            ),
          ),
        ],
      ),
              
             );
             
          
         
                
                
               
  }
  
  Widget buildIndicator() => AnimatedSmoothIndicator(
        onDotClicked: animateToSlide,
        effect: ExpandingDotsEffect(dotWidth: 15, activeDotColor: Colors.blue),
        activeIndex: activeIndex,
        count: urlImages.length,
      );

  void animateToSlide(int index) => controller.animateToPage(index);

          
//     Widget buildImage(String urlImage, int index) =>
//     ClipRRect(
//       borderRadius:BorderRadius.circular(20),
//       child: SizedBox(
//         width: 300,
//         child:
          
//           Container(
//                  margin: EdgeInsets.only(top: 20),
//                 child: Image.asset(productModel.photos as String,
//                  fit: BoxFit.cover)),
                
              
//             ),
              
          
//         );
      

}
  
 