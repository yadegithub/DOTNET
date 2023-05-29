
import 'package:flextrip/app/modules/hotel_booking/hotel_app_theme.dart';
import 'package:flextrip/app/modules/hotel_booking/hotel_list_view.dart';
import 'package:flextrip/app/modules/hotel_booking/model/hotel_list_data.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter/material.dart';

import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';

class FirebaseSearchScreen extends StatefulWidget  {
 
   FirebaseSearchScreen({Key? key}) : super(key: key);

  @override
  State<FirebaseSearchScreen> createState() => _FirebaseSearchScreenState();
}

class _FirebaseSearchScreenState extends State<FirebaseSearchScreen> {
   AnimationController? animationController;
    List<HotelListData> hotelList = HotelListData.hotelList;
  List _allResults = [];
  List resultList = [];
  final TextEditingController _searchController = TextEditingController();

  // void searchFromFirebase(String query) async {
  //   final result = await FirebaseFirestore.instance
  //       .collection('yade')
  //       .where('name', arrayContains: query)
  //       .get();

  //   setState(() {
  //     searchResult = result.docs.map((e) => e.data()).toList();
  //   });
  // }

@override
void initState(){
  _searchController.addListener(_onSearchChanged);
}

getClientStream() async{
var data = await FirebaseFirestore.instance.collection('yade').orderBy('name').get();

setState(() {
  _allResults = data.docs;
});

searchResultListe();

}
searchResultListe(){
var showResults  = [];
if(_searchController.text!=""){
     for(var cleintSnapshot in _allResults){
          var name = cleintSnapshot['name'].toString().toLowerCase();
          if(name.contains(_searchController.text.toLowerCase())){
          showResults.add(cleintSnapshot);
          }
     }
}else{
    showResults=List.from(_allResults);
}
setState(() {
  _allResults=showResults;
});
}


_onSearchChanged(){
  //print(_searchController.text);
  searchResultListe();
}


@override
  void dispose() {
  _searchController.removeListener(_onSearchChanged);
  _searchController.dispose();
    super.dispose();
  }

@override
  void didChangeDependencies() {
    getClientStream();
    super.didChangeDependencies();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Firebase Search"),
      ),
      body:Column(
        children: [
            Padding(
            padding: const EdgeInsets.all(15.0),
            child: TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: "Search Here",
              ),
             // onChanged:() {
               // searchFromFirebase(query);
             // },
              controller: _searchController,
            ),
           ),
          ListView.builder(
            itemCount: resultList .length,
            itemBuilder: (context,index){
              return
              ListTile(
                title: Text(resultList[index]['name']),
              );
            },
            ),
        ],
      )







//        Column(
//         children: [
//           Padding(
//             padding: const EdgeInsets.all(15.0),
//             child: TextField(
//               decoration: InputDecoration(
//                 border: OutlineInputBorder(),
//                 hintText: "Search Here",
//               ),
//              // onChanged:() {
//                // searchFromFirebase(query);
//              // },
//               controller: _searchController,
//             ),
//           ),

//           StreamBuilder<QuerySnapshot>(
//                 stream: FirebaseFirestore.instance.collection("yade").snapshots(),
//                 builder:((context, snapshot) {
                  

//  if(snapshot.connectionState==ConnectionState.active){
//                 if(snapshot.hasData&& snapshot.data !=null){
//                   return Expanded(
//                     child:ListView.builder(
//                       itemCount: snapshot.data!.docs.length,
//                       itemBuilder: (context,index){
                        
//                       Map<String ,dynamic> userMap = snapshot.data!.docs[index].data() as Map<String, dynamic>;
//                       return ListTile(
//                         title: Text(userMap["name"]),
//                       );
                      
//                       })
//                      );
//                 }
//                 else{
//                   Text('no data');
//                 }
//               }
//               else{
//                 return Center(
//                   child: CircularProgressIndicator(),
//                 );
//               }
//                return Text("No widget to build");
//                 }),
                
                

//                ),




















    //        Container(
    //                       color:
    //                           HotelAppTheme.buildLightTheme().backgroundColor,
    //                       child: ListView.builder(
    //                         itemCount: searchResult.length,
    //                         padding: const EdgeInsets.only(top: 8),
    //                         scrollDirection: Axis.vertical,
    //                         itemBuilder: (BuildContext context, int index) {
    //                           final int count =
    //                               searchResult.length > 10 ? 10 : searchResult.length;
    //                           final Animation<double> animation =
    //                               Tween<double>(begin: 0.0, end: 1.0).animate(
    //                                   CurvedAnimation(
    //                                       parent: animationController!,
    //                                       curve: Interval(
    //                                           (1 / count) * index, 1.0,
    //                                           curve: Curves.fastOutSlowIn)));
    //                           animationController?.forward();
    //                           return
    //                             AnimatedBuilder(
    //   animation: animationController!,
    //   builder: (BuildContext context, Widget? child) {
    //     return FadeTransition(
    //       opacity: animation,
    //       child: Transform(
    //         transform: Matrix4.translationValues(
    //             0.0, 50 * (1.0 - 2), 0.0),
    //         child: Padding(
    //           padding: const EdgeInsets.only(
    //               left: 24, right: 24, top: 8, bottom: 16),
    //           child: InkWell(
    //             splashColor: Colors.transparent,
    //             onTap: (){},
    //             child: Container(
    //               decoration: BoxDecoration(
    //                 borderRadius: const BorderRadius.all(Radius.circular(16.0)),
    //                 boxShadow: <BoxShadow>[
    //                   BoxShadow(
    //                     color: Colors.grey.withOpacity(0.6),
    //                     offset: const Offset(4, 4),
    //                     blurRadius: 16,
    //                   ),
    //                 ],
    //               ),
    //               child: ClipRRect(
    //                 borderRadius: const BorderRadius.all(Radius.circular(16.0)),
    //                 child: Stack(
    //                   children: <Widget>[
    //                     Column(
    //                       children: <Widget>[
    //                         AspectRatio(
    //                           aspectRatio: 2,
    //                           child: Image.asset(
    //                             'hotel_1.jpg',
    //                             fit: BoxFit.cover,
    //                           ),
    //                         ),
    //                         Container(
    //                           color: HotelAppTheme.buildLightTheme()
    //                               .backgroundColor,
    //                           child: Row(
    //                             mainAxisAlignment: MainAxisAlignment.center,
    //                             crossAxisAlignment: CrossAxisAlignment.start,
    //                             children: <Widget>[
    //                               Expanded(
    //                                 child: Container(
    //                                   child: Padding(
    //                                     padding: const EdgeInsets.only(
    //                                         left: 16, top: 8, bottom: 8),
    //                                     child: Column(
    //                                       mainAxisAlignment:
    //                                           MainAxisAlignment.center,
    //                                       crossAxisAlignment:
    //                                           CrossAxisAlignment.start,
    //                                       children: <Widget>[
    //                                         Text(
    //                                           searchResult[index]['titleTxt'],
    //                                           textAlign: TextAlign.left,
    //                                           style: TextStyle(
    //                                             fontWeight: FontWeight.w600,
    //                                             fontSize: 22,
    //                                           ),
    //                                         ),
    //                                         Row(
    //                                           crossAxisAlignment:
    //                                               CrossAxisAlignment.center,
    //                                           mainAxisAlignment:
    //                                               MainAxisAlignment.start,
    //                                           children: <Widget>[
    //                                             Text(
    //                                               searchResult[index]['subTxt'],
    //                                               style: TextStyle(
    //                                                   fontSize: 14,
    //                                                   color: Colors.grey
    //                                                       .withOpacity(0.8)),
    //                                             ),
    //                                             const SizedBox(
    //                                               width: 4,
    //                                             ),
    //                                             Icon(
    //                                               FontAwesomeIcons.locationDot,
    //                                               size: 12,
    //                                               color: HotelAppTheme
    //                                                       .buildLightTheme()
    //                                                   .primaryColor,
    //                                             ),
    //                                             Expanded(
    //                                               child: Text(
    //                                                 'yade',
    //                                               //  '${hotelData!.dist.toStringAsFixed(1)} km to city',
    //                                                 overflow:
    //                                                     TextOverflow.ellipsis,
    //                                                 style: TextStyle(
    //                                                     fontSize: 14,
    //                                                     color: Colors.grey
    //                                                         .withOpacity(0.8)),
    //                                               ),
    //                                             ),
    //                                           ],
    //                                         ),
    //                                         Padding(
    //                                           padding:
    //                                               const EdgeInsets.only(top: 4),
    //                                           child: Row(
    //                                             children: <Widget>[
    //                                               RatingBar(
    //                                                 initialRating:
    //                                                     searchResult[index][' rating'],
    //                                                 direction: Axis.horizontal,
    //                                                 allowHalfRating: true,
    //                                                 itemCount: 5,
    //                                                 itemSize: 24,
    //                                                 ratingWidget: RatingWidget(
    //                                                   full: Icon(
    //                                                     Icons.star_rate_rounded,
    //                                                     color: HotelAppTheme
    //                                                             .buildLightTheme()
    //                                                         .primaryColor,
    //                                                   ),
    //                                                   half: Icon(
    //                                                     Icons.star_half_rounded,
    //                                                     color: HotelAppTheme
    //                                                             .buildLightTheme()
    //                                                         .primaryColor,
    //                                                   ),
    //                                                   empty: Icon(
    //                                                     Icons
    //                                                         .star_border_rounded,
    //                                                     color: HotelAppTheme
    //                                                             .buildLightTheme()
    //                                                         .primaryColor,
    //                                                   ),
    //                                                 ),
    //                                                 itemPadding:
    //                                                     EdgeInsets.zero,
    //                                                 onRatingUpdate: (rating) {
    //                                                   print(rating);
    //                                                 },
    //                                               ),
    //                                               Text(
    //                                                 ' ${searchResult[index]['reviews']} Reviews',
    //                                                 style: TextStyle(
    //                                                     fontSize: 14,
    //                                                     color: Colors.grey
    //                                                         .withOpacity(0.8)),
    //                                               ),
    //                                             ],
    //                                           ),
    //                                         ),
    //                                       ],
    //                                     ),
    //                                   ),
    //                                 ),
    //                               ),
    //                               Padding(
    //                                 padding: const EdgeInsets.only(
    //                                     right: 16, top: 8),
    //                                 child: Column(
    //                                   mainAxisAlignment:
    //                                       MainAxisAlignment.center,
    //                                   crossAxisAlignment:
    //                                       CrossAxisAlignment.end,
    //                                   children: <Widget>[
    //                                     Text(
                                          
    //                                       '\$${searchResult[index][' par neight']}',
    //                                       textAlign: TextAlign.left,
    //                                       style: TextStyle(
    //                                         fontWeight: FontWeight.w600,
    //                                         fontSize: 22,
    //                                       ),
    //                                     ),
    //                                     Text(
    //                                       '/per night',
    //                                       style: TextStyle(
    //                                           fontSize: 14,
    //                                           color:
    //                                               Colors.grey.withOpacity(0.8)),
    //                                     ),
    //                                   ],
    //                                 ),
    //                               ),
    //                             ],
    //                           ),
    //                         ),
    //                       ],
    //                     ),
    //                     Positioned(
    //                       top: 8,
    //                       right: 8,
    //                       child: Material(
    //                         color: Colors.transparent,
    //                         child: InkWell(
    //                           borderRadius: const BorderRadius.all(
    //                             Radius.circular(32.0),
    //                           ),
    //                           onTap: () {},
    //                           child: Padding(
    //                             padding: const EdgeInsets.all(8.0),
    //                             child: Icon(
    //                               Icons.favorite_border,
    //                               color: HotelAppTheme.buildLightTheme()
    //                                   .primaryColor,
    //                             ),
    //                           ),
    //                         ),
    //                       ),
    //                     )
    //                   ],
    //                 ),
    //               ),
    //             ),
    //           ),
    //         ),
    //       ),
    //     );
    //   },
    // );
  




    //                         },
    //                       ),
    //                     ),
          // Expanded(
          //   child: ListView.builder(
          //     itemCount: searchResult.length,
          //     itemBuilder: (context, index) {
          //       return ListTile(
          //         title: Text(searchResult[index]['name']),
          //         //subtitle: Text(searchResult[index]['string_id']),
          //       );
          //     },
          //   ),
          // ),
      //  ],
      );
  //  );
  }
  
  //  Widget HotelListView() {
  //   final Animation<double> animation =
  //                                 Tween<double>(begin: 0.0, end: 1.0).animate(
  //                                     CurvedAnimation(
  //                                         parent: animationController!,
  //                                         curve: Interval(
  //                                             (1 / 3) * 3, 1.0,
  //                                             curve: Curves.fastOutSlowIn)));
  //                             animationController?.forward();
  //   return 
}