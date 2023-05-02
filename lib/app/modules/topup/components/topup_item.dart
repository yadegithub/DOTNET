import 'package:flextrip/app/modules/topup/controllers/topup_controller.dart';
import 'package:flextrip/styles/colors.dart';
import 'package:flextrip/styles/styles.dart';
import 'package:flextrip/utils/format_currency.dart';
import 'package:flextrip/widgets/cards/card_app.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TopUpItem extends GetView<TopupController> {
  const TopUpItem({super.key, required this.data, required this.onTap});

  final int data;
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return InkWell(
        onTap: onTap,
        child: CardApp(
          padding: EdgeInsets.zero,
          isShowShadows: true,
          shadows: Shadows.shadowsUp,
          isOutlined: true,
          outlineColor: controller.selectedNominal.value == data
              ? AppColor.myColor
              : Colors.transparent,
          child: Center(
            child: Text(priceFormatWithoutSymbol(data), style: TextStyles.text),
          ),
        ),
      );
    });
  }
}
