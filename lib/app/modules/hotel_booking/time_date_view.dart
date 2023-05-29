import 'package:flextrip/app/modules/hotel_booking/calendar_popup_view.dart';
import 'package:flextrip/app/modules/hotel_booking/model/room_data.dart';
import 'package:flextrip/app/modules/hotel_booking/providers/theme_provider.dart';
import 'package:flextrip/app/modules/hotel_booking/room_pop_up_view.dart';
import 'package:flextrip/app/modules/hotel_booking/utils/enum.dart';
import 'package:flextrip/app/modules/hotel_booking/utils/helper.dart';
import 'package:flextrip/app/modules/hotel_booking/utils/text_styles.dart';
import 'package:flextrip/language/appLocalizations.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';


BuildContext? applicationcontext;
class TimeDateView extends StatefulWidget {
  @override
  _TimeDateViewState createState() => _TimeDateViewState();
}

class _TimeDateViewState extends State<TimeDateView> {
  RoomData _roomData = RoomData(1, 2);
  DateTime startDate = DateTime.now();
  DateTime endDate = DateTime.now().add(Duration(days: 5));
  LanguageType _languageType = applicationcontext == null
      ? LanguageType.en
      : applicationcontext!.read<ThemeProvider>().languageType;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 16, bottom: 16, right: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          _getDateRoomUi("choose_date".tr,
              "${DateFormat("dd, MMM", _languageType.toString().split(".")[1]).format(startDate)} - ${DateFormat("dd, MMM", _languageType.toString().split(".")[1]).format(endDate)}",
              () {
            _showDemoDialog(context);
          }),
          Container(
            width: 1,
            height: 42,
            color: Colors.grey.withOpacity(0.8),
          ),
          _getDateRoomUi("number_room".tr,
              Helper.getRoomText(_roomData), () {
            _showPopUp();
          }),
        ],
      ),
    );
  }

  Widget _getDateRoomUi(String title, String subtitle, VoidCallback onTap) {
    return Expanded(
      child: Row(
        children: <Widget>[
          Material(
            color: Colors.transparent,
            child: InkWell(
              borderRadius: BorderRadius.all(
                Radius.circular(4.0),
              ),
              onTap: onTap,
              child: Padding(
                padding:
                    const EdgeInsets.only(left: 8, right: 8, top: 4, bottom: 4),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      title,
                      // "Choose date",
                      style: TextStyles(context)
                          .getDescriptionStyle()
                          .copyWith(fontSize: 16),
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    Text(
                      subtitle,
                      // "${DateFormat("dd, MMM").format(startDate)} - ${DateFormat("dd, MMM").format(endDate)}",
                      style: TextStyles(context).getRegularStyle(),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _showDemoDialog(BuildContext context) {
    showDialog(
      context: context,
      //custome calendar view
      builder: (BuildContext context) => CalendarPopupView(
        barrierDismissible: true,
        minimumDate: DateTime.now(),
        maximumDate: DateTime(
            DateTime.now().year, DateTime.now().month, DateTime.now().day + 10),
        initialEndDate: endDate,
        initialStartDate: startDate,
        onApplyClick: (DateTime startData, DateTime endData) {
          setState(() {
            startDate = startData;
            endDate = endData;
          });
        },
        onCancelClick: () {},
      ),
    );
  }

  void _showPopUp() {
    showDialog(
      context: context,
      builder: (BuildContext context) => RoomPopupView(
        roomData: _roomData,
        barrierDismissible: true,
        onChnage: (data) {
          setState(() {
            _roomData = data;
          });
        },
      ),
    );
  }
}
