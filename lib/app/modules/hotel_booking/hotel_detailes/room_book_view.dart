import 'package:flextrip/app/modules/hotel_booking/hotel_detailes/booking_details.dart';
import 'package:flextrip/app/modules/hotel_booking/model/hotel_list_data.dart';
import 'package:flextrip/app/modules/hotel_booking/model/room_data.dart';
import 'package:flextrip/app/modules/hotel_booking/utils/helper.dart';
import 'package:flextrip/app/modules/hotel_booking/utils/text_styles.dart';
import 'package:flextrip/app/modules/hotel_booking/widgets/common_button.dart';
import 'package:flextrip/language/appLocalizations.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:awesome_notifications/awesome_notifications.dart';
class RoomeBookView extends StatefulWidget {
  final HotelListData roomData;
  
  final AnimationController animationController;
  final Animation<double> animation;

  const RoomeBookView(
      {Key? key,
      required this.roomData,
      required this.animationController,
      
      required this.animation})
      : super(key: key);

  @override
  _RoomeBookViewState createState() => _RoomeBookViewState();
}

class _RoomeBookViewState extends State<RoomeBookView> {
  var pageController = PageController(initialPage: 0);
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
    List<String> images = widget.roomData.imagePath.split(" ");
    return AnimatedBuilder(
      animation: widget.animationController,
      builder: (BuildContext context, Widget? child) {
        return FadeTransition(
          opacity: widget.animation,
          child: new Transform(
            transform: new Matrix4.translationValues(
                0.0, 40 * (1.0 - widget.animation.value), 0.0),
            child: Column(
              children: <Widget>[
                Stack(
                  alignment: Alignment.bottomCenter,
                  children: <Widget>[
                    AspectRatio(
                      aspectRatio: 1.5,
                      child: PageView(
                        controller: pageController,
                        pageSnapping: true,
                        scrollDirection: Axis.horizontal,
                        children: <Widget>[
                          for (var image in images)
                            Image.asset(
                              image,
                              fit: BoxFit.cover,
                            ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: SmoothPageIndicator(
                        controller: pageController, // PageController
                        count: 3,
                        effect: WormEffect(
                            activeDotColor: Theme.of(context).primaryColor,
                            dotColor: Theme.of(context).backgroundColor,
                            dotHeight: 10.0,
                            dotWidth: 10.0,
                            spacing: 5.0), // your preferred effect
                        onDotClicked: (index) {},
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(
                      left: 16, right: 16, bottom: 16, top: 16),
                  child: Column(
                    children: <Widget>[
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            widget.roomData.titleTxt.tr,
                            maxLines: 2,
                            textAlign: TextAlign.left,
                            style: TextStyles(context)
                                .getBoldStyle()
                                .copyWith(fontSize: 24),
                            overflow: TextOverflow.ellipsis,
                          ),
                          Expanded(child: SizedBox()),
                          SizedBox(
                            height: 38,
                            child: CommonButton(
                             
                              buttonTextWidget: Padding(
                                padding: const EdgeInsets.only(
                                    left: 16.0, right: 16.0, top: 4, bottom: 4),
                                child: Text(
                                  "book_now".tr,
                                  textAlign: TextAlign.center,
                                  style: TextStyles(context).getRegularStyle(),
                                ),
                              ),
                              
                               onTap: () {
                                
                                Navigator.push(context,
                 MaterialPageRoute(builder: (context)=>  Booking_Details()
                                   ));
                                //    triggerNotification();
                              }
                            ),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            "${widget.roomData.perNight}",
                            textAlign: TextAlign.left,
                            style: TextStyles(context)
                                .getBoldStyle()
                                .copyWith(fontSize: 22),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(bottom: 0),
                            child: Text(
                              "per_night".tr,
                              style: TextStyles(context)
                                  .getRegularStyle()
                                  .copyWith(fontSize: 14),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          
                          Text(
                            
                             Helper.getPeopleandChildren(
                               widget.roomData.roomData!
                               
                               ),
                            // \"${widget.roomData.dateTxt}",
                            textAlign: TextAlign.left,
                            style: TextStyles(context).getDescriptionStyle(),
                          ),
                          InkWell(
                            borderRadius:
                                BorderRadius.all(Radius.circular(4.0)),
                            onTap: () {},
                            child: Padding(
                              padding: const EdgeInsets.only(left: 8, right: 4),
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: <Widget>[
                                  Text(
                                "more_details".tr,
                                    style: TextStyles(context).getBoldStyle(),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 2),
                                    child: Icon(
                                      Icons.keyboard_arrow_down,
                                      // color: Theme.of(context).backgroundColor,
                                      size: 24,
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Divider(
                  height: 1,
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
