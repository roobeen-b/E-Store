import 'package:estore/common/widgets/appbar/appbar.dart';
import 'package:estore/features/personalization/controllers/user_controller.dart';
import 'package:estore/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ReAuthLoginForm extends StatelessWidget {
  const ReAuthLoginForm({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = UserController.instance;
    return Scaffold(
      appBar: TAppBar(
        title: Text(
          'Re-Authenticate user',
          style: Theme.of(context).textTheme.headlineSmall,
        ),
        showBackArrow: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(TSizes.defaultSpace),
        child: Form(
            child: Column(
          children: [
            TextFormField(
              expands: false,
              decoration: const InputDecoration(
                  labelText: 'E-Mail', prefixIcon: Icon(Icons.mail)),
            ),
            const SizedBox(
              height: TSizes.spaceBtwInputFields,
            ),
            Obx(
              () => TextFormField(
                obscureText: controller.hidePassword.value,
                expands: false,
                decoration: InputDecoration(
                    labelText: 'Password',
                    prefixIcon: const Icon(Icons.lock),
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
              height: TSizes.spaceBtwSections,
            ),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                  onPressed: () =>
                      controller.reAuthenticateEmailAndPasswordUser(),
                  child: const Text('Verify')),
            )
          ],
        )),
      ),
    );
  }
}
