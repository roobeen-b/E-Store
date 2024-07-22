import 'package:estore/common/widgets/appbar/appbar.dart';
import 'package:estore/features/shop/screens/product_reviews/widgets/overall_product_ratings.dart';
import 'package:estore/features/shop/screens/product_reviews/widgets/user_review_card.dart';
import 'package:estore/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import '../../../../common/widgets/products/ratings/rating_bar_indicator.dart';

class ProductReviewsScreen extends StatelessWidget {
  const ProductReviewsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const TAppBar(
        title: Text("Reviews & Ratings"),
        showBackArrow: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                  "Ratings and reviews are verified and are from people who use the same type of device that you use"),
              const SizedBox(
                height: TSizes.spaceBtwItems,
              ),
              const TOverallProductRatings(),
              const TRatingBarIndicator(
                rating: 4.0,
              ),
              Text(
                "1,847",
                style: Theme.of(context).textTheme.bodySmall,
              ),
              const SizedBox(
                height: TSizes.spaceBtwSections,
              ),
              const TUserReviewCard(),
              const TUserReviewCard(),
            ],
          ),
        ),
      ),
    );
  }
}
