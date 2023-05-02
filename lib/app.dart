// ignore_for_file: depend_on_referenced_packages

import 'package:flextrip/app/bindings/initial_bindings.dart';
import 'package:flextrip/app/controllers/utility_controller.dart';
import 'package:flextrip/app/modules/api_log/components/api_log_overlay_button.dart';
import 'package:flextrip/app/routes/app_pages.dart';
import 'package:flextrip/generated/locales.g.dart';
import 'package:flextrip/styles/styles.dart';
import 'package:flextrip/utils/app_utils.dart';
import 'package:flextrip/widgets/pages/page_info.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

start() {
  Get.put(UtilityController());
  runApp(const App());
}

class App extends StatefulWidget {
  const App({Key? key}) : super(key: key);

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  final cUtility = Get.find<UtilityController>();
  String pageName = '';

  void updatePageRoute(Routing? value) {
    try {
      final name = value!.route!.settings.name.toString();
      cUtility.currentPage.value = name;
      setState(() {
        pageName = name;
      });
    } catch (_) {}
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);

    return ScreenUtilInit(
      designSize: const Size(375, 812),
      builder: (context, child) {
        return GetMaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Airpedia',
          theme: AppStyle.appTheme(0xFF5C40CC, Colors.white),
          builder: (context, child) {
            return MediaQuery(
              data: MediaQuery.of(context)
                  .copyWith(textScaleFactor: Get.width <= 360 ? .85 : 1),
              child: GestureDetector(
                behavior: HitTestBehavior.translucent,
                onTap: AppUtils.dismissKeyboard,
                child: Obx(
                  () => Stack(
                    children: [
                      child!,
                      if (cUtility.isShowLog.value) const ApiLogOverlayButton(),
                      if (cUtility.isShowLog.value)
                        PageInfo(pageName: pageName),
                    ],
                  ),
                ),
              ),
            );
          },
          initialBinding: InitialBindings(),
          initialRoute: Routes.SPLASH_SCREEN,
          getPages: AppPages.routes,
          locale: Get.deviceLocale,
          routingCallback: (value) {
            if (value != null) updatePageRoute(value);
          },
          translationsKeys: AppTranslation.translations,
          localizationsDelegates: const [GlobalMaterialLocalizations.delegate],
        );
      },
    );
  }
}
