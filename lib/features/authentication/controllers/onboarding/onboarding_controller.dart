import 'package:estore/features/authentication/screens/login/login.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class OnBoardingController extends GetxController {
  static OnBoardingController get instance => Get.find();

  final pageController = PageController();
  Rx<int> currentPageIndex = 0.obs;

  final storage = GetStorage();

  // Update current index on page scroll
  void updatePageIndicator(index) {
    currentPageIndex.value = index;
  }

  // Jump to specific dot selected page
  void dotNavigationClick(index) {
    currentPageIndex.value = index;
    pageController.jumpToPage(index);
  }

  // Update current index & jump to next page
  void nextPage() {
    if (currentPageIndex.value == 2) {
      storage.write("IsFirstTime", false);
      Get.offAll(() => const LoginScreen());
    } else {
      int page = currentPageIndex.value + 1;
      pageController.jumpToPage(page);
    }
  }

  // Update current index & jump to the last page
  void skipPage() {
    storage.write("IsFirstTime", false);
    Get.offAll(() => const LoginScreen());
    // currentPageIndex.value = 2;
    // pageController.jumpToPage(2);
  }
}
