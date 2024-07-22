import 'package:estore/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:estore/common/widgets/products/ratings/rating_bar_indicator.dart';
import 'package:estore/utils/constants/colors.dart';
import 'package:estore/utils/constants/image_strings.dart';
import 'package:estore/utils/constants/sizes.dart';
import 'package:estore/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:readmore/readmore.dart';

class TUserReviewCard extends StatelessWidget {
  const TUserReviewCard({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);

    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                const CircleAvatar(
                  backgroundImage: AssetImage(TImages.userProfileImage1),
                ),
                const SizedBox(
                  width: TSizes.spaceBtwItems,
                ),
                Text(
                  "John Doe",
                  style: Theme.of(context).textTheme.titleLarge,
                )
              ],
            ),
            IconButton(onPressed: () {}, icon: const Icon(Icons.more_vert))
          ],
        ),
        const SizedBox(
          height: TSizes.spaceBtwItems,
        ),
        Row(
          children: [
            const TRatingBarIndicator(rating: 4),
            const SizedBox(
              width: TSizes.spaceBtwItems,
            ),
            Text(
              "11 Jul, 2024",
              style: Theme.of(context).textTheme.bodyMedium,
            )
          ],
        ),
        const ReadMoreText(
          trimLines: 2,
            trimMode: TrimMode.Line,
            trimExpandedText: " Show less",
            trimCollapsedText: " Show more",
            moreStyle: TextStyle(color: TColors.primary, fontSize: 14, fontWeight: FontWeight.bold),
            lessStyle: TextStyle(color: TColors.primary, fontSize: 14, fontWeight: FontWeight.bold),
            "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s"),
        const SizedBox(height: TSizes.spaceBtwItems,),
        TRoundedContainer(
          backgroundColor: dark ? TColors.darkerGrey : TColors.grey,
          padding: const EdgeInsets.all(TSizes.md),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("ABC pvt. ltd.", style: Theme.of(context).textTheme.titleMedium,),
                  Text("07 Jul, 2024", style: Theme.of(context).textTheme.bodyMedium,),
                ],
              ),
              const SizedBox(height: TSizes.spaceBtwItems,),
              const ReadMoreText(
                  trimLines: 2,
                  trimMode: TrimMode.Line,
                  trimExpandedText: " Show less",
                  trimCollapsedText: " Show more",
                  moreStyle: TextStyle(color: TColors.primary, fontSize: 14, fontWeight: FontWeight.bold),
                  lessStyle: TextStyle(color: TColors.primary, fontSize: 14, fontWeight: FontWeight.bold),
                  "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s"),
            ],
          ),
        ),
        const SizedBox(height: TSizes.spaceBtwSections,),
      ],
    );
  }
}
