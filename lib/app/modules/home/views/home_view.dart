import 'package:flextrip/app/modules/Dashborder/veiw/Dashborder.dart';
import 'package:flextrip/app/modules/home/controllers/home_controller.dart';
import 'package:flextrip/app/modules/home/tab/tab_history.dart';
import 'package:flextrip/app/modules/home/tab/tab_home.dart';
import 'package:flextrip/app/modules/home/tab/tab_setting.dart';
import 'package:flextrip/app/modules/home/tab/tab_ticket.dart';
import 'package:flextrip/app/routes/app_pages.dart';
import 'package:flextrip/utils/app_asset.dart';
import 'package:flextrip/widgets/others/custom_bottom_navbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return Scaffold(
        extendBody: true,
        backgroundColor: const Color(0xFFFAFAFA),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: FloatingActionButton(
          onPressed: () => Get.toNamed(Routes.TOPUP),
          backgroundColor: Color(0xFF26A69A),
          child: Image.asset(
            AppAsset.icon('ic_topup.png'),
            width: 30.w,
            color: Colors.white,
          ),
        ),
        bottomNavigationBar: BottomAppBar(
          shape: const CircularNotchedRectangle(),
          color: Colors.white,
          elevation: 10,
          notchMargin: 10,
          child: CustomBottomNavBar(
            selectedIndex: controller.selectedPage.value,
            onTap: (index) {
              controller.navigation(index);
            },
          ),
        ),
        body: PageView(
          controller: controller.pageController,
          physics: const NeverScrollableScrollPhysics(),
          children:  [
            Dashborder(),
            
            TabTicket(),
            TabHistory(),
            TabSetting(),
          ],
        ),
      );
    });
  }
}
