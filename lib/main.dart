import 'package:flextrip/app.dart';
import 'package:flextrip/app_config.dart';
import 'package:flextrip/firebase_options.dart';
import 'package:flextrip/services/api_service.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';

Future<void> setupApp({
  bool isProduction = false,
  bool isDevelopment = false,
  bool isStaging = false,
}) async {
  WidgetsFlutterBinding.ensureInitialized();
  AppConfig.appFlavor = isProduction
      ? Flavor.production
      : isStaging
          ? Flavor.staging
          : Flavor.development;
  await GetStorage.init();
  await initFirebase();
  await ApiService().init();

  start();
}

Future<void> initFirebase() async {
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  // await FirebaseService().initializeFirebaseMessaging();
  // await FirebaseService().initializeFirebaseMessagingHandler();
}
