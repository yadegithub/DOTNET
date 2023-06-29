import 'package:flextrip/app/models/app_language_model.dart';
import 'package:flextrip/app/modules/login/controllers/login_controller.dart';
import 'package:flextrip/app/modules/login/controllers/login_with_facbook.dart';
import 'package:flextrip/app/modules/login/controllers/login_with_googel.dart';
import 'package:flextrip/app/routes/app_pages.dart';
import 'package:flextrip/styles/colors.dart';
import 'package:flextrip/styles/styles.dart';
import 'package:flextrip/widgets/buttons/button_primary.dart';
import 'package:flextrip/widgets/buttons/button_text_rich.dart';
import 'package:flextrip/widgets/cards/card_app.dart';
import 'package:flextrip/widgets/inputs/input_dropdown.dart';
import 'package:flextrip/widgets/inputs/input_email.dart';
import 'package:flextrip/widgets/inputs/input_password.dart';
import 'package:flextrip/widgets/others/input_dropdwon_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class LoginView extends GetView<LoginController> {
  const LoginView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.backgroundColor,
      body: Obx(() {
        return Stack(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.w),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'loginTitle'.tr,
                    style: TextStyles.title,
                  ),
                  verticalSpace(30.w),
                  CardApp(
                    width: double.infinity,
                    radius: Insets.lg,
                    padding: EdgeInsets.all(Insets.lg),
                    isShowShadows: true,
                    shadows: Shadows.universal,
                    child: Column(
                      children: [
                        InputEmail(
                          label: 'emailAddressLabel'.tr,
                          hint: 'emailAddressHint'.tr,
                          controller: controller.cEmail,
                          value: controller.setEmail,
                          validation: (value) => value.isNotEmpty,
                          validationText: 'emailAddressValidationText'.tr,
                        ),
                        InputPassword(
                          label: 'passwordLabel'.tr,
                          hint: 'passwordHint'.tr,
                          value: controller.setPassword,
                          validation: (value) => value.isNotEmpty,
                          validationText: 'passwordValidationText'.tr,
                        ),
                      ],
                    ),
                  ),
                  verticalSpace(30.w),
                  ButtonPrimary(
                    label: 'signIn'.tr,
                    onTap: controller.login,
                    isLoading: controller.isLoading.value,
                    enabled: controller.isValidForm.value,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [

                      GestureDetector(
                        onTap: (){
                           Navigator.push(context,
                   MaterialPageRoute(builder: (context)=> 
                 LoginWitheFacbook()
                    
                                      ));
                        },
      child: Padding(
        padding: const EdgeInsets.only(right: 20,left: 20),
        child: Container(
          width: 60,
          height: 60,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.white,
            boxShadow: const [
              BoxShadow(
                color: Colors.black26,offset: Offset(0,2),blurRadius: 0.6
              ),
            ],
            image: DecorationImage(
              image: AssetImage('assets/images/facebook.png'),
            )
          ),
        ),
      ),
    ),
      GestureDetector(
          onTap: (){
                           Navigator.push(context,
                   MaterialPageRoute(builder: (context)=> 
                 LoginWithGoogel()
                    
                                      ));
                        },
      child: Container(
        width: 60,
        height: 60,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.white,
          boxShadow: const [
            BoxShadow(
              color: Colors.black26,offset: Offset(0,2),blurRadius: 0.6
            ),
          ],
          image: DecorationImage(
            image: AssetImage('assets/images/google.jpg'),
          )
        ),
      ),
    ),
      GestureDetector(
      child: Container(
        width: 60,
        height: 60,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.white,
          boxShadow: const [
            BoxShadow(
              color: Colors.black26,offset: Offset(0,2),blurRadius: 0.6
            ),
          ],
          image: DecorationImage(
            image: AssetImage('assets/yade/img2.png'),
          )
        ),
      ),
    ),
                    ],
                  ),
                  SizedBox(
                    width: double.infinity,
                    child: ButtonTextRich(
                      label1: 'dontHaveAccount'.tr,
                      label2: 'signUp'.tr,
                      onPressed: () => Get.toNamed(Routes.REGISTER),
                    ),
                  ),
                ],
              ),
            ),
            Positioned(
              top: 40.w,
              right: 30.w,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text('chooseLanguage'.tr, style: TextStyles.text),
                  verticalSpace(Insets.xs),
                  SizedBox(
                    width: 72.w,
                    child: InputDropdown(
                      hintText: '',
                      borderColor: Colors.blueGrey[200],
                      outlinedBorderColor: Colors.transparent,
                      textAlign: TextAlign.center,
                      items: [
                        ...controller.cUtility.appLanguageOptions.map((item) {
                          return DropdownMenuItem<AppLanguageModel>(
                            value: item,
                            child: InputDropdownItem(value: item.language),
                          );
                        })
                      ],
                      selectedItem:
                          controller.cUtility.appLanguage.value.language,
                      onChanged: (value) {
                        if (value != null) {
                          final data = value as AppLanguageModel;
                          controller.cUtility.changeLanguage(data);
                        }
                      },
                    ),
                  ),
                ],
              ),
            )
          ],
        );
      }),
    );
  }
}
