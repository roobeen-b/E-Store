import 'package:estore/data/repositories/authentication/authentication_repository.dart';
import 'package:estore/features/authentication/screens/password_configuration/reset_password.dart';
import 'package:estore/utils/constants/image_strings.dart';
import 'package:estore/utils/helpers/network_manager.dart';
import 'package:estore/utils/popups/full_screen_loader.dart';
import 'package:estore/utils/popups/loaders.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ForgetPasswordController extends GetxController {
  static ForgetPasswordController get instance => Get.find();

  final email = TextEditingController();
  GlobalKey<FormState> forgetPasswordFormKey = GlobalKey<FormState>();

  /// Send password reset email
  sendPasswordResetEmail() async {
    try {
      // Start loader
      TFullScreenLoader.openLoadingDialog(
          "Processing your request...", TImages.docerAnimation);

      // Check internet connectivity
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        TFullScreenLoader.stopLoading();
        return;
      }

      // Form Validation
      if (!forgetPasswordFormKey.currentState!.validate()) {
        TFullScreenLoader.stopLoading();
        return;
      }

      // Send email to reset password
      await AuthenticationRepository.instance
          .sendPasswordResetEmail(email.text.trim());

      // Stop  loader
      TFullScreenLoader.stopLoading();

      // Show success message
      TLoaders.successSnackBar(
          title: "Email sent",
          message: "Email Link Sent to Reset Your Password".tr);

      // Screen redirect
      Get.to(() => ResetPassword(
            email: email.text.trim(),
          ));
    } catch (e) {
      TFullScreenLoader.stopLoading();
      TLoaders.errorSnackBar(title: "An Error Occured", message: e.toString());
    }
  }

  /// Resend password reset email
  resendPasswordResetEmail(String email) async {
    try {
      // Start loader
      TFullScreenLoader.openLoadingDialog(
          "Processing your request...", TImages.docerAnimation);

      // Check internet connectivity
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        TFullScreenLoader.stopLoading();
        return;
      }

      // Send email to reset password
      await AuthenticationRepository.instance.sendPasswordResetEmail(email);

      // Stop  loader
      TFullScreenLoader.stopLoading();

      // Show success message
      TLoaders.successSnackBar(
          title: "Email sent",
          message: "Email Link Sent to Reset Your Password".tr);
    } catch (e) {
      TFullScreenLoader.stopLoading();
      TLoaders.errorSnackBar(title: "An Error Occured", message: e.toString());
    }
  }
}
