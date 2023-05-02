import 'package:flextrip/app/modules/edit_profile/components/edit_profile_form.dart';
import 'package:flextrip/app/modules/edit_profile/components/edit_profile_header.dart';
import 'package:flextrip/app/modules/edit_profile/controllers/edit_profile_controller.dart';
import 'package:flextrip/widgets/buttons/button_primary.dart';
import 'package:flextrip/widgets/pages/page_default.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class EditProfileView extends GetView<EditProfileController> {
  const EditProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return PageDefault(
        shadowColor: Colors.transparent,
        title: 'editProfile'.tr,
        bottomBarHeight: 90.w,
        bottomBar: Padding(
          padding: EdgeInsets.symmetric(horizontal: Get.width / 10),
          child: ButtonPrimary(
            enabled: controller.isValidForm.value,
            isLoading: controller.isLoading.value,
            label: 'update'.tr,
            onTap: controller.submit,
          ),
        ),
        child: Flex(
          direction: Axis.vertical,
          children: const [
            EditProfileHeader(),
            EditProfileForm(),
          ],
        ),
      );
    });
  }
}
