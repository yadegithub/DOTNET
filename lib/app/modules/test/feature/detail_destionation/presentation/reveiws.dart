 
import 'package:flextrip/app/models/product_model.dart';
import 'package:flextrip/app/models/recommended_places.dart';
import 'package:flextrip/app/modules/hotel%20booking/feature/detail_destionation/reviewUI.dart';
import 'package:flutter/material.dart';
import 'package:flextrip/app/modules/hotel%20booking/feature/detail_destionation/defaultAppBar.dart';
import 'package:flextrip/app/modules/hotel%20booking/feature/detail_destionation/defaultBackButton.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';


 import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class Reveiws extends StatefulWidget {
  const Reveiws({super.key});

  @override
  State<Reveiws> createState() => _ReveiwsState();
}

class _ReveiwsState extends State<Reveiws> {

  bool isMore = false;
  List<double> ratings = [0.1, 0.3, 0.5, 0.7, 0.9];
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: DefaultAppBar(
        title: "Reviews",
        child: DefaultBackButton(),
      ),
      body: Column(
        children: [
          Container(
            color: Colors.white,
            padding: EdgeInsets.symmetric(
              horizontal: 16.0,
              vertical: 16.0,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text.rich(
                      TextSpan(
                        children: [
                          TextSpan(
                            text: "4.5",
                            style: TextStyle(fontSize: 48.0),
                          ),
                          TextSpan(
                            text: "/5",
                            style: TextStyle(
                              fontSize: 24.0,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ),
                    // SmoothStarRating(
                    //   starCount: 5,
                    //   rating: 4.5,
                    //   size: 28.0,
                    //   color: Colors.orange,
                    //   borderColor: Colors.orange,
                    // ),
                    SizedBox(height: 16.0),
                    Text(
                      "${4} Reviews",
                      style: TextStyle(
                        fontSize: 20.0,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
                Container(
                  width: 200.0,
                  child: ListView.builder(
                    shrinkWrap: true,
                    reverse: true,
                    itemCount: 5,
                    itemBuilder: (context, index) {
                      return Row(
                        children: [
                          Text(
                            "${index + 1}",
                            style: TextStyle(fontSize: 18.0),
                          ),
                          SizedBox(width: 4.0),
                          Icon(Icons.star, color: Colors.orange),
                          SizedBox(width: 8.0),
                          LinearPercentIndicator(
                            lineHeight: 6.0,
                            // linearStrokeCap: LinearStrokeCap.roundAll,
                            width: MediaQuery.of(context).size.width / 2.8,
                            animation: true,
                            animationDuration: 2500,
                            percent: ratings[index],
                            progressColor: Colors.orange,
                          ),
                        ],
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView.separated(
              padding: EdgeInsets.only(bottom: 8.0, top: 8.0),
              itemCount: 4,
              itemBuilder: (context, index) {
                return ReviewUI(
                  image: recommendedplaces[index].image,
                  name: recommendedplaces[index].location,
                  date: recommendedplaces[index].type,
                  comment: recommendedplaces[index].location,
                  rating: recommendedplaces[index].rating,
                  onPressed: () => print("More Action $index"),
                  onTap: () => setState(() {
                    isMore = !isMore;
                  }),
                  isLess: isMore,
                );
              },
              separatorBuilder: (context, index) {
                return Divider(
                  thickness: 2.0,
                  color: Colors.white,
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}