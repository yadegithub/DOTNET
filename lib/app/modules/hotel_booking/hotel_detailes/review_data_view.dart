import 'package:flextrip/app/modules/hotel_booking/model/hotel_list_data.dart';
import 'package:flextrip/app/modules/hotel_booking/utils/text_styles.dart';
import 'package:flextrip/app/modules/hotel_booking/utils/themes.dart';
import 'package:flextrip/app/modules/hotel_booking/widgets/common_card.dart';
import 'package:flextrip/app/modules/hotel_booking/widgets/list_cell_animation_view.dart';
import 'package:flextrip/language/appLocalizations.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ReviewsView extends StatelessWidget {
  final VoidCallback callback;
  final HotelListData reviewsList;
  final AnimationController animationController;
  final Animation<double> animation;

  const ReviewsView({
    Key? key,
    required this.reviewsList,
    required this.animationController,
    required this.animation,
    required this.callback,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListCellAnimationView(
      animation: animation,
      animationController: animationController,
      yTranslation: 40,
      child: Padding(
        padding: const EdgeInsets.only(left: 24, right: 24, top: 16),
        child: Column(
          // crossAxisAlignment: CrossAxisAlignment.end,
          children: <Widget>[
            Row(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SizedBox(
                    width: 48,
                    child: CommonCard(
                      radius: 8,
                      color: AppTheme.whiteColor,
                      child: ClipRRect(
                        borderRadius: BorderRadius.all(Radius.circular(8.0)),
                        child: AspectRatio(
                          aspectRatio: 1,
                          child: Image.asset(
                            reviewsList.imagePath,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      reviewsList.titleTxt.tr,
                      style: TextStyles(context).getBoldStyle().copyWith(
                            fontSize: 14,
                            color:  Colors.black,
                          ),
                    ),
                    Row(
                      children: [
                        Text(
                          "last_update".tr,
                          style: new TextStyles(context)
                              .getDescriptionStyle()
                              .copyWith(
                                fontWeight: FontWeight.w100,
                                color: Colors.black,
                              ),
                        ),
                        Text(
                          reviewsList.dateTxt,
                          style: new TextStyles(context)
                              .getDescriptionStyle()
                              .copyWith(
                                fontWeight: FontWeight.w100,
                                color: Colors.black,
                              ),
                        ),
                      ],
                    ),
                    Row(
                      children: <Widget>[
                        Text(
                          "(${reviewsList.rating})",
                          style: new TextStyles(context)
                              .getRegularStyle()
                              .copyWith(
                                fontWeight: FontWeight.w100,
                               color: Colors.black,
                              ),
                        ),
                        //   SmoothStarRating(
                        //     allowHalfRating: true,
                        //     starCount: 5,
                        //     rating: reviewsList.rating / 2,
                        //     size: 16,
                        //     color: Theme.of(context).primaryColor,
                        //     borderColor: Theme.of(context).primaryColor,
                        //   ),
                      ],
                    ),
                  ],
                )
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                reviewsList.subTxt.tr,
                style: TextStyles(context).getDescriptionStyle().copyWith(
                      fontWeight: FontWeight.w100,
                      color: Colors.black,
                    ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              // crossAxisAlignment: CrossAxisAlignment.center,
              // mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                Material(
                  color: Colors.transparent,
                  child: InkWell(
                    borderRadius: BorderRadius.all(Radius.circular(4.0)),
                    onTap: () {},
                    child: Padding(
                      padding: const EdgeInsets.only(left: 8),
                      child: Row(
                        children: <Widget>[
                          Text(
                            "reply".tr,
                            textAlign: TextAlign.left,
                            style:
                                TextStyles(context).getRegularStyle().copyWith(
                                      fontWeight: FontWeight.w600,
                                      fontSize: 14,
                                      color: Theme.of(context).primaryColor,
                                    ),
                          ),
                          SizedBox(
                            height: 38,
                            width: 26,
                            child: Icon(
                              Icons.arrow_forward,
                              size: 14,
                              color: Theme.of(context).primaryColor,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Divider(
              height: 1,
            )
          ],
        ),
      ),
    );
  }
}
