import 'package:flextrip/app.dart';

import 'package:flextrip/app_config.dart';
import 'package:flextrip/firebase_options.dart';
import 'package:flextrip/services/api_service.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get_storage/get_storage.dart';

import 'package:provider/provider.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:awesome_notifications/awesome_notifications.dart';

Future<void> setupApp({
  bool isProduction = false,
  bool isDevelopment = false,
  bool isStaging = false,
}) async {
  AwesomeNotifications().initialize(
    null,
    [
      NotificationChannel(
        channelKey:'com.example.flextrip',
        channelName:'flextrip',
        channelDescription:' howe are you'
      )
    ],
    debug: true
  );
  WidgetsFlutterBinding.ensureInitialized();
  Stripe.publishableKey = 'pk_test_51N8MoKCM4OZnSL6OMZYaqPDBkderCkXlwd12vBJmkySZtKyz3gqqpcI2dSQMbGKP4FEYT4CmXz3QWAUWOEYHD9cW00scvpL6ym';

     //Stripe.merchantIdentifier = 'any string works';

    
   //await Stripe.instance.applySettings();
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
  WidgetsFlutterBinding.ensureInitialized();
  
  // await FirebaseService().initializeFirebaseMessaging();
  // await FirebaseService().initializeFirebaseMessagingHandler();
}
