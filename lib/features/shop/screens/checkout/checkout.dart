import 'package:estore/common/widgets/appbar/appbar.dart';
import 'package:estore/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:estore/common/widgets/success_screen/success_screen.dart';
import 'package:estore/features/shop/screens/cart/widgets/cart_items.dart';
import 'package:estore/features/shop/screens/checkout/widgets/billing_address_section.dart';
import 'package:estore/features/shop/screens/checkout/widgets/billing_amount_section.dart';
import 'package:estore/features/shop/screens/checkout/widgets/billing_payment_section.dart';
import 'package:estore/navigation_menu.dart';
import 'package:estore/utils/constants/colors.dart';
import 'package:estore/utils/constants/image_strings.dart';
import 'package:estore/utils/constants/sizes.dart';
import 'package:estore/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../common/widgets/products/cart/coupon_widget.dart';

class CheckoutScreen extends StatelessWidget {
  const CheckoutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return Scaffold(
      appBar: TAppBar(
          title: Text(
            "Order Review",
            style: Theme.of(context).textTheme.headlineSmall,
          ),
          showBackArrow: true),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            children: [
              const TCartItems(
                showAddRemoveButtons: false,
              ),
              const SizedBox(
                height: TSizes.spaceBtwSections,
              ),
              const TCouponCode(),
              const SizedBox(
                height: TSizes.spaceBtwSections,
              ),
              TRoundedContainer(
                showBorder: true,
                backgroundColor: dark ? TColors.black : TColors.white,
                padding: const EdgeInsets.all(TSizes.md),
                child: const Column(
                  children: [
                    TBillingAmountSection(),
                    SizedBox(
                      height: TSizes.spaceBtwItems,
                    ),
                    Divider(),
                    SizedBox(
                      height: TSizes.spaceBtwItems,
                    ),
                    TBillingPaymentSection(),
                    SizedBox(
                      height: TSizes.spaceBtwItems,
                    ),
                    TBillingAddressSection()
                  ],
                ),
              )
            ],
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(TSizes.md),
        child: ElevatedButton(
          onPressed: () => Get.to(() => SuccessScreen(
              image: TImages.successfulPaymentIcon,
              title: "Payment Success",
              subTitle: "Your item will be shipped soon",
              onPressed: () => Get.offAll(() => const NavigationMenu()))),
          child: const Text("Checkout \$222.22"),
        ),
      ),
    );
  }
}
