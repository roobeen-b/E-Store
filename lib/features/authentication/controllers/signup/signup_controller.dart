import 'package:estore/data/repositories/authentication/authentication_repository.dart';
import 'package:estore/data/repositories/user/user_repository.dart';
import 'package:estore/features/authentication/models/user_model.dart';
import 'package:estore/features/authentication/screens/signup/verify_email.dart';
import 'package:estore/utils/constants/image_strings.dart';
import 'package:estore/utils/helpers/network_manager.dart';
import 'package:estore/utils/popups/full_screen_loader.dart';
import 'package:estore/utils/popups/loaders.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class SignupController extends GetxController {
  static SignupController get instance => Get.find();

  final hidePassword = true.obs;
  final privacyPolicy = true.obs;
  final firstname = TextEditingController();
  final lastname = TextEditingController();
  final username = TextEditingController();
  final email = TextEditingController();
  final phoneNumber = TextEditingController();
  final password = TextEditingController();
  GlobalKey<FormState> signupFormKey = GlobalKey<FormState>();

  void signup() async {
    try {
      // Start Loading
      TFullScreenLoader.openLoadingDialog(
          "We are processing your information ...",
          TImages.successfulPaymentIcon);

      // Checking internet connectivity
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        TFullScreenLoader.stopLoading();
        return;
      }

      // Form validation
      if (!signupFormKey.currentState!.validate()) {
        TFullScreenLoader.stopLoading();
        return;
      }

      // Privacy Policy Check
      if (!privacyPolicy.value) {
        TFullScreenLoader.stopLoading();
        TLoaders.warningSnackBar(
            title: 'Accept Privacy Policy',
            message:
                "In Order to create account, you must have to read and accept the Privacy Policy & Terms of Use");
        return;
      }

      // User registration with firebase auth and saving user info to database
      final userCredential = await AuthenticationRepository.instance
          .registerWithEmailAndPassword(
              email.text.trim(), password.text.trim());

      // Save new user to firebase firestore
      final newUser = UserModel(
          id: userCredential.user!.uid,
          firstName: firstname.text.trim(),
          lastName: lastname.text.trim(),
          userName: username.text.trim(),
          email: email.text.trim(),
          phoneNumber: phoneNumber.text.trim(),
          profilePicture: '');

      final userRepository = Get.put(UserRepository());
      await userRepository.saveUserRecord(newUser);

      TFullScreenLoader.stopLoading();

      // Showing success message if all is successful
      TLoaders.successSnackBar(
          title: 'Congratulations',
          message: 'Your account has been created! Verify email to continue');

      Get.to(() => VerifyEmail(email: email.text.trim()));
    } catch (e) {
      TLoaders.errorSnackBar(title: "An Error Occured", message: e.toString());
    }
  }
}
