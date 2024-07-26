import 'package:estore/features/authentication/screens/signup/widgets/terms_and_conditions_checkbox.dart';
import 'package:estore/utils/validators/validation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../utils/constants/sizes.dart';
import '../../../../../utils/constants/text_strings.dart';
import '../../../controllers/signup/signup_controller.dart';

class TSignUpForm extends StatelessWidget {
  const TSignUpForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(SignupController());

    return Form(
        key: controller.signupFormKey,
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: TextFormField(
                    controller: controller.firstname,
                    validator: (value) =>
                        TValidator.validateEmptyText('First Name', value),
                    expands: false,
                    decoration: const InputDecoration(
                        prefixIcon: Icon(
                          Icons.person,
                        ),
                        labelText: TTexts.firstName),
                  ),
                ),
                const SizedBox(
                  width: TSizes.spaceBtwInputFields,
                ),
                Expanded(
                  child: TextFormField(
                    controller: controller.lastname,
                    validator: (value) =>
                        TValidator.validateEmptyText('Last Name', value),
                    expands: false,
                    decoration: const InputDecoration(
                        prefixIcon: Icon(
                          Icons.person,
                        ),
                        labelText: TTexts.lastName),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: TSizes.spaceBtwInputFields,
            ),
            TextFormField(
              controller: controller.username,
              validator: (value) =>
                  TValidator.validateEmptyText('User Name', value),
              decoration: const InputDecoration(
                  prefixIcon: Icon(
                    Icons.person_add_alt_1,
                  ),
                  labelText: TTexts.username),
            ),
            const SizedBox(
              height: TSizes.spaceBtwInputFields,
            ),
            TextFormField(
              controller: controller.email,
              validator: (value) => TValidator.validateEmail(value),
              decoration: const InputDecoration(
                  prefixIcon: Icon(
                    Icons.mail,
                  ),
                  labelText: TTexts.email),
            ),
            const SizedBox(
              height: TSizes.spaceBtwInputFields,
            ),
            TextFormField(
              controller: controller.phoneNumber,
              validator: (value) => TValidator.validatePhoneNumber(value),
              decoration: const InputDecoration(
                  prefixIcon: Icon(
                    Icons.phone,
                  ),
                  labelText: TTexts.phoneNo),
            ),
            const SizedBox(
              height: TSizes.spaceBtwInputFields,
            ),
            Obx(
              () => TextFormField(
                obscureText: controller.hidePassword.value,
                controller: controller.password,
                validator: (value) => TValidator.validatePassword(value),
                decoration: InputDecoration(
                    prefixIcon: const Icon(
                      Icons.lock,
                    ),
                    labelText: TTexts.password,
                    suffixIcon: IconButton(
                        onPressed: () => controller.hidePassword.value =
                            !controller.hidePassword.value,
                        icon: Icon(controller.hidePassword.value
                            ? Icons.visibility_off
                            : Icons.visibility))),
              ),
            ),
            const SizedBox(
              height: TSizes.spaceBtwSections,
            ),
            const TTermsAndConditionsCheckbox(),
            const SizedBox(
              height: TSizes.spaceBtwSections,
            ),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                  onPressed: () => controller.signup(),
                  child: const Text(TTexts.createAccount)),
            )
          ],
        ));
  }
}
