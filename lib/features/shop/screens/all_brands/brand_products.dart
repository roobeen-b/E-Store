import 'package:estore/common/widgets/appbar/appbar.dart';
import 'package:estore/common/widgets/brands/brand_card.dart';
import 'package:estore/common/widgets/products/sortable/sortable_products.dart';
import 'package:estore/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

class BrandProducts extends StatelessWidget {
  const BrandProducts({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TAppBar(
        title: Text(
          "Nike",
          style: Theme.of(context).textTheme.headlineSmall,
        ),
        showBackArrow: true,
      ),
      body: const SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            children: [
              TBrandCard(showBorder: true),
              SizedBox(
                height: TSizes.spaceBtwItems,
              ),
              TSortableProducts()
            ],
          ),
        ),
      ),
    );
  }
}
