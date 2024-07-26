import 'package:estore/common/widgets/loaders/animation_loader.dart';
import 'package:estore/utils/constants/colors.dart';
import 'package:estore/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TFullScreenLoader {
  static void openLoadingDialog(String text, String animation) {
    showDialog(
        barrierDismissible: false,
        context: Get.overlayContext!,
        builder: (_) => PopScope(
            canPop: false,
            child: Container(
              color: THelperFunctions.isDarkMode(Get.context!)
                  ? TColors.dark
                  : TColors.white,
              width: double.infinity,
              height: double.infinity,
              child: SizedBox(
                  height: 300,
                  child:
                      TAnimationLoaderWidget(text: text, animation: animation)),
            )));
  }

  static stopLoading() {
    Navigator.of(Get.overlayContext!).pop();
  }
}
