import 'package:flextrip/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
void main() {
   // WidgetsFlutterBinding.ensureInitialized();
  //Stripe.publishableKey = 'pk_test_51N8MoKCM4OZnSL6OMZYaqPDBkderCkXlwd12vBJmkySZtKyz3gqqpcI2dSQMbGKP4FEYT4CmXz3QWAUWOEYHD9cW00scvpL6ym';

    // Stripe.merchantIdentifier = 'any string works';

    
  // await Stripe.instance.applySettings();
  setupApp(isStaging: true);
}
