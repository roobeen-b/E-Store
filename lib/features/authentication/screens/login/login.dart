import 'package:estore/common/styles/spacing_styles.dart';
import 'package:estore/features/authentication/screens/login/widgets/login_form.dart';
import 'package:estore/features/authentication/screens/login/widgets/login_header.dart';
import 'package:estore/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import '../../../../common/widgets/login_signup/form_divider.dart';
import '../../../../common/widgets/login_signup/social_buttons.dart';
import '../../../../utils/constants/text_strings.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: TSpacingStyle.paddingWithAppBarHeight,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TLoginHeader(),
              SizedBox(
                height: TSizes.spaceBtwItems,
              ),
              TLoginForm(),
              SizedBox(
                height: TSizes.spaceBtwSections,
              ),
              TFormDivider(formDividerText: TTexts.orSignInWith,),
              SizedBox(
                height: TSizes.spaceBtwItems,
              ),
              TSocialButtons()
            ],
          ),
        ),
      ),
    );
  }
}






