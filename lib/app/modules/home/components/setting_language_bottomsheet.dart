import 'package:flextrip/app/modules/home/components/setting_language_item.dart';
import 'package:flextrip/app/modules/home/controllers/setting_controller.dart';
import 'package:flextrip/styles/colors.dart';
import 'package:flextrip/styles/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class SettingLanguageBottomsheet extends GetView<SettingController> {
  const SettingLanguageBottomsheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'chooseLanguage'.tr,
            style: TextStyles.title.copyWith(fontSize: 14.w),
          ),
          const Divider(color: AppColor.primaryColor2),
          verticalSpace(Insets.med),
          ...controller.cUtility.appLanguageOptions.map((item) {
            return SettingLanguageItem(
              label: item.language == 'ID'
                  ? 'Arabic (Mouritania)'
                  : 'French (France)',
                  
              isSelected: item.language ==
                  controller.cUtility.appLanguage.value.language,
              onTap: () {
                controller.cUtility.changeLanguage(item);
                Get.back();
              },
            );
          }).toList(),
        ],
      );
    });
  }
}
