import 'package:flextrip/constants/constent_style.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:math' as math;



class CustomAppBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    Size size = MediaQuery.of(context).size;

    return  Padding(
      padding: EdgeInsets.only(left: 20.0,right: 10.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(appPadding / 8),
                child: Container(
                  decoration: new BoxDecoration(
                    color: Color(0xFF26A69A),
                    shape: BoxShape.circle,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(appPadding / 20),
                    child: Container(
                      decoration: new BoxDecoration(
                        color: Colors.white,
                        shape: BoxShape.circle,
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(appPadding / 8),
                        child: Center(
                          child: CircleAvatar(
                            backgroundImage: AssetImage(
                              'assets/images/peapel.JPG',
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                width: size.width * 0.01,
              ),
              Text(
                'Mint Malainin',
                style: TextStyle(color: Colors.black, fontWeight: FontWeight.w600,fontSize: 18),
              ),
            ],
          ),

          Row(
            children: [
               Icon(
                    Icons.mic_none_rounded,
                    size: 30.0,
                    color: Colors.grey.shade500,
                  ),
              Stack(
                children: [
                  Icon(
                    Icons.notifications_none_rounded,
                    size: 30.0,
                    color: Colors.grey.shade500,
                  ),
                  Container(
                    decoration: BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.circular(30.0)
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: Text('4',style: TextStyle(color: Colors.white,fontSize: 8),),
                    ),
                  )
                ],
              ),
              // Transform(
              //   transform: Matrix4.rotationY(math.pi),
              //   alignment: Alignment.center,
              //   child: Icon(
              //     Icons.sort_rounded,
              //     size: 30.0,
              //     color: Color(0xFF26A69A),
              //   ),
              // )
            ],
          )
        ],
      ),
    );
  }
}
