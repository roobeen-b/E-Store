import 'package:estore/common/widgets/appbar/appbar.dart';
import 'package:estore/features/personalization/controllers/update_name_controller.dart';
import 'package:estore/utils/constants/sizes.dart';
import 'package:estore/utils/validators/validation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ChangeNameScreen extends StatelessWidget {
  const ChangeNameScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(UpdateNameController());
    return Scaffold(
      appBar: TAppBar(
        title: Text(
          'Change Name',
          style: Theme.of(context).textTheme.headlineSmall,
        ),
        showBackArrow: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(TSizes.defaultSpace),
          child: Form(
            key: controller.updateNameFormKey,
            child: Column(
              children: [
                Text(
                  "Use real name for easy verification. This name will appear on several pages.",
                  style: Theme.of(context).textTheme.labelMedium,
                ),
                const SizedBox(
                  height: TSizes.spaceBtwSections,
                ),
                TextFormField(
                  controller: controller.firstName,
                  validator: (value) =>
                      TValidator.validateEmptyText('First Name', value),
                  expands: false,
                  decoration: const InputDecoration(
                      labelText: "First Name", prefixIcon: Icon(Icons.person)),
                ),
                const SizedBox(
                  height: TSizes.spaceBtwInputFields,
                ),
                TextFormField(
                  controller: controller.lastName,
                  validator: (value) =>
                      TValidator.validateEmptyText('Last Name', value),
                  expands: false,
                  decoration: const InputDecoration(
                      labelText: "Last Name", prefixIcon: Icon(Icons.person)),
                ),
                const SizedBox(
                  height: TSizes.spaceBtwSections,
                ),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    child: const Text('Save'),
                    onPressed: () => controller.updateUserName(),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
