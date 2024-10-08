import 'package:estore/features/authentication/controllers/onboarding/onboarding_controller.dart';
import 'package:estore/utils/constants/sizes.dart';
import 'package:estore/utils/device/device_utility.dart';
import 'package:flutter/material.dart';

class OnBoardingSkip extends StatelessWidget {
  const OnBoardingSkip({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = OnBoardingController.instance;

    return Positioned(
        top: TDeviceUtils.getAppBarHeight(),
        right: TSizes.defaultSpace,
        child: TextButton(
            onPressed: () {
              controller.skipPage();
            },
            child: const Text("Skip")));
  }
}
