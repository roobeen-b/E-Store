import 'package:estore/features/authentication/controllers/login/login_controller.dart';
import 'package:estore/features/authentication/screens/password_configuration/forget_password.dart';
import 'package:estore/features/authentication/screens/signup/signup.dart';
import 'package:estore/utils/validators/validation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../utils/constants/sizes.dart';
import '../../../../../utils/constants/text_strings.dart';

class TLoginForm extends StatelessWidget {
  const TLoginForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(LoginController());
    return Form(
      key: controller.loginFormKey,
      child: Column(
        children: [
          TextFormField(
            controller: controller.email,
            validator: (value) => TValidator.validateEmail(value),
            decoration: const InputDecoration(
                prefixIcon: Icon(Icons.mail), labelText: TTexts.email),
          ),
          const SizedBox(
            height: TSizes.spaceBtwInputFields,
          ),
          Obx(
            () => TextFormField(
              obscureText: controller.hidePassword.value,
              controller: controller.password,
              validator: (value) =>
                  TValidator.validateEmptyText('Password', value),
              decoration: InputDecoration(
                  prefixIcon: const Icon(Icons.lock),
                  labelText: TTexts.password,
                  suffixIcon: IconButton(
                    icon: Icon(controller.hidePassword.value
                        ? Icons.visibility_off
                        : Icons.visibility),
                    onPressed: () => controller.hidePassword.value =
                        !controller.hidePassword.value,
                  )),
            ),
          ),
          const SizedBox(
            height: TSizes.spaceBtwInputFields / 2,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Obx(() => Checkbox(
                      value: controller.rememberMe.value,
                      onChanged: (value) => controller.rememberMe.value =
                          !controller.rememberMe.value)),
                  const Text(TTexts.rememberMe)
                ],
              ),
              TextButton(
                  onPressed: () => Get.to(() => const ForgetPassword()),
                  child: const Text(TTexts.forgetPassword))
            ],
          ),
          const SizedBox(
            height: TSizes.spaceBtwSections,
          ),
          SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                  onPressed: () => controller.emailAndPasswordSignIn(),
                  child: const Text(TTexts.signIn))),
          const SizedBox(
            height: TSizes.spaceBtwItems,
          ),
          SizedBox(
              width: double.infinity,
              child: OutlinedButton(
                  onPressed: () {
                    Get.to(() => const SignupScreen());
                  },
                  child: const Text(TTexts.createAccount))),
        ],
      ),
    );
  }
}
