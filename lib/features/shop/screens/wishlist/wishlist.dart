import 'package:estore/common/widgets/appbar/appbar.dart';
import 'package:estore/common/widgets/icons/t_rounded_icon.dart';
import 'package:estore/common/widgets/layouts/grid_layout.dart';
import 'package:estore/common/widgets/products/product_card/product_card_vertical.dart';
import 'package:estore/features/shop/screens/home/home.dart';
import 'package:estore/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FavouriteScreen extends StatelessWidget {
  const FavouriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: TAppBar(
          title: Text(
            "Wishlist",
            style: Theme.of(context).textTheme.headlineMedium,
          ),
          actions: [
            TRoundedIcon(
              icon: Icons.add,
              onPressed: () => Get.to(() => const HomeScreen()),
            )
          ],
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(TSizes.defaultSpace),
            child: Column(
              children: [
                TGridLayout(itemCount: 6, itemBuilder: (_, index) {
                  return const TProductCardVertical();
                })
              ],
            ),
          ),
        ));
  }
}
