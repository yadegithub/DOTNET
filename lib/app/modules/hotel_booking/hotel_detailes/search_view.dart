import 'package:flextrip/app/modules/hotel_booking/model/hotel_list_data.dart';
import 'package:flextrip/app/modules/hotel_booking/utils/helper.dart';
import 'package:flextrip/app/modules/hotel_booking/utils/text_styles.dart';
import 'package:flextrip/app/modules/hotel_booking/utils/themes.dart';
import 'package:flextrip/app/modules/hotel_booking/widgets/common_card.dart';
import 'package:flextrip/app/modules/hotel_booking/widgets/list_cell_animation_view.dart';
import 'package:flutter/material.dart';


class SerchView extends StatelessWidget {
  final HotelListData hotelInfo;
  final AnimationController animationController;
  final Animation<double> animation;

  const SerchView(
      {Key? key,
      required this.hotelInfo,
      required this.animationController,
      required this.animation})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListCellAnimationView(
      animation: animation,
      animationController: animationController,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: AspectRatio(
          aspectRatio: 0.75,
          child: CommonCard(
            color: AppTheme.backgroundColor,
            radius: 16,
            child: ClipRRect(
              borderRadius: BorderRadius.all(Radius.circular(16.0)),
              child: Column(
                children: <Widget>[
                  AspectRatio(
                    aspectRatio: 1.5,
                    child: Image.asset(
                      hotelInfo.imagePath,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            hotelInfo.titleTxt,
                            style: TextStyles(context).getBoldStyle(),
                          ),
                          Text(
                            Helper.getRoomText(hotelInfo.roomData!),
                            // Helper.getRoomText(hotelInfo.roomData!),
                            style:
                                TextStyles(context).getRegularStyle().copyWith(
                                      fontWeight: FontWeight.w100,
                                      fontSize: 12,
                                      color: Theme.of(context)
                                          .disabledColor
                                          .withOpacity(0.6),
                                    ),
                          ),
                          Text(
                            Helper.getLastSearchDate(hotelInfo.date!),
                            // Helper.getRoomText(hotelInfo.roomData!),
                            style:
                                TextStyles(context).getRegularStyle().copyWith(
                                      fontWeight: FontWeight.w100,
                                      fontSize: 12,
                                      color: Theme.of(context)
                                          .disabledColor
                                          .withOpacity(0.6),
                                    ),
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
