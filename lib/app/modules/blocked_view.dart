import 'package:flextrip/styles/styles.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BlockedView extends StatelessWidget {
  const BlockedView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: Insets.xl),
          child: Text(
            'jailbreakDevice'.tr,
            style: TextStyles.title,
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}
