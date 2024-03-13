import 'dart:core';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controller/onboarding_controller.dart';
import '../widget/onboarding/controller_onboarding.dart';
import '../widget/onboarding/custombutton.dart';
import '../widget/onboarding/customslider.dart';

class OnBoarding extends StatelessWidget {
  const OnBoarding({super.key});

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    Get.put(OnBoardingImplement());
    return Scaffold(
      body: Stack(
        children: [
          CustomSliderOnBoarding(height: height, width: width),
          Positioned(
            top: height / 1.1,
            right: width / 8,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Center(child: CustomButtonOnBoarding(width: width)),
                  const SizedBox(height: 15),
                  const ControllerOnBoarding()
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
