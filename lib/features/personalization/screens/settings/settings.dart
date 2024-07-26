import 'package:estore/common/widgets/appbar/appbar.dart';
import 'package:estore/common/widgets/custom_shapes/containers/primary_header_container.dart';
import 'package:estore/common/widgets/list_tiles/settings_menu_tile.dart';
import 'package:estore/common/widgets/texts/section_heading.dart';
import 'package:estore/data/repositories/authentication/authentication_repository.dart';
import 'package:estore/features/personalization/screens/address/address.dart';
import 'package:estore/features/personalization/screens/profile/profile.dart';
import 'package:estore/features/shop/screens/order/order.dart';
import 'package:estore/utils/constants/colors.dart';
import 'package:estore/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../common/widgets/list_tiles/user_profile_tile.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            TPrimaryHeaderContainer(
                child: Column(
              children: [
                TAppBar(
                  title: Text(
                    "Account",
                    style: Theme.of(context)
                        .textTheme
                        .headlineMedium!
                        .apply(color: TColors.white),
                  ),
                ),
                TUserProfileTile(
                    onPressed: () => Get.to(() => const ProfileScreen())),
                const SizedBox(
                  height: TSizes.spaceBtwSections,
                ),
              ],
            )),
            Padding(
              padding: const EdgeInsets.all(TSizes.defaultSpace),
              child: Column(
                children: [
                  const TSectionHeading(
                    title: "Account Settings",
                    showActionButton: false,
                  ),
                  const SizedBox(
                    height: TSizes.spaceBtwItems,
                  ),
                  TSettingsMenuTile(
                    title: "My Address",
                    subtitle: "Set shopping delivery address",
                    icon: Icons.home,
                    onTap: () => Get.to(() => const UserAddressScreen()),
                  ),
                  TSettingsMenuTile(
                    title: "My Cart",
                    subtitle: "Add, remove products and move to checkout",
                    icon: Icons.shopping_cart,
                    onTap: () {},
                  ),
                  TSettingsMenuTile(
                    title: "My Orders",
                    subtitle: "In-progress and Completed Orders",
                    icon: Icons.shopping_bag,
                    onTap: () => Get.to(() => const OrderScreen()),
                  ),
                  TSettingsMenuTile(
                    title: "Bank Account",
                    subtitle: "Withdraw balance to registered bank account",
                    icon: Icons.food_bank,
                    onTap: () {},
                  ),
                  TSettingsMenuTile(
                    title: "My Coupons",
                    subtitle: "List of all the discounted coupons",
                    icon: Icons.discount,
                    onTap: () {},
                  ),
                  TSettingsMenuTile(
                    title: "Notifications",
                    subtitle: "Set any kind of notification message",
                    icon: Icons.notification_add,
                    onTap: () {},
                  ),
                  TSettingsMenuTile(
                    title: "Account Privacy",
                    subtitle: "Manage data usage and connected accounts",
                    icon: Icons.security,
                    onTap: () {},
                  ),
                  const SizedBox(
                    height: TSizes.spaceBtwSections,
                  ),
                  const TSectionHeading(
                    title: "App Settings",
                    showActionButton: false,
                  ),
                  const SizedBox(
                    height: TSizes.spaceBtwItems,
                  ),
                  TSettingsMenuTile(
                    title: "Load Data",
                    subtitle: "Upload Data to your Cloud Firebase",
                    icon: Icons.upload_file_rounded,
                    onTap: () {},
                  ),
                  TSettingsMenuTile(
                    title: "Geolocation",
                    subtitle: "Set recommendation based on location",
                    icon: Icons.location_on,
                    trailing: Switch(
                      value: true,
                      onChanged: (value) {},
                    ),
                  ),
                  TSettingsMenuTile(
                    title: "Safe Mode",
                    subtitle: "Search result is safe for all ages",
                    icon: Icons.supervised_user_circle,
                    trailing: Switch(
                      value: false,
                      onChanged: (value) {},
                    ),
                  ),
                  TSettingsMenuTile(
                    title: "HD Image Quality",
                    subtitle: "Set image quality to be seen",
                    icon: Icons.image,
                    trailing: Switch(
                      value: true,
                      onChanged: (value) {},
                    ),
                  ),
                  const SizedBox(
                    height: TSizes.spaceBtwSections,
                  ),
                  SizedBox(
                    width: double.infinity,
                    child: OutlinedButton(
                      onPressed: () =>
                          AuthenticationRepository.instance.logout(),
                      child: const Text("Logout"),
                    ),
                  ),
                  const SizedBox(
                    height: TSizes.spaceBtwSections * 2.5,
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
