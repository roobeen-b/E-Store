import 'package:estore/common/widgets/login_signup/form_divider.dart';
import 'package:estore/common/widgets/login_signup/social_buttons.dart';
import 'package:estore/features/authentication/screens/signup/widgets/signup_form.dart';
import 'package:flutter/material.dart';
import '../../../../utils/constants/sizes.dart';
import '../../../../utils/constants/text_strings.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                TTexts.signupTitle,
                style: Theme.of(context).textTheme.headlineMedium,
              ),
              const SizedBox(
                height: TSizes.spaceBtwSections,
              ),
              const TSignUpForm(),
              const SizedBox(
                height: TSizes.spaceBtwSections,
              ),
              const TFormDivider(formDividerText: TTexts.orSignUpWith),
              const SizedBox(
                height: TSizes.spaceBtwItems,
              ),
              const TSocialButtons()
            ],
          ),
        ),
      ),
    );
  }
}
