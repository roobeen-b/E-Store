import 'package:estore/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import '../../../../utils/constants/colors.dart';
import '../../../../utils/constants/image_strings.dart';
import '../../../../utils/constants/sizes.dart';
import '../../images/t_rounded_image.dart';
import '../../texts/brand_title_text_with_verified_icon.dart';
import '../../texts/product_title_text.dart';

class TCartItem extends StatelessWidget {
  const TCartItem({
    super.key,
  });


  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);

    return Row(
      children: [
        TRoundedImage(
          imageUrl: TImages.productImage1,
          width: 60,
          height: 60,
          backgroundColor:
          dark ? TColors.darkerGrey : TColors.light,
          padding: const EdgeInsets.all(TSizes.sm),
        ),
        const SizedBox(
          width: TSizes.spaceBtwItems,
        ),
        Expanded(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const TBrandTitleTextWithVerifiedIcon(title: "Nike"),

              const TProductTitleText(
                title: "Black Sports Shoes",
                maxLines: 1,
              ),
              Text.rich(TextSpan(
                  children: [
                    TextSpan(text: "Color ", style: Theme.of(context).textTheme.bodySmall),
                    TextSpan(text: "Green ", style: Theme.of(context).textTheme.bodyLarge),
                    TextSpan(text: "Size ", style: Theme.of(context).textTheme.bodySmall),
                    TextSpan(text: "EU 36 ", style: Theme.of(context).textTheme.bodyLarge),
                  ]
              ))
            ],
          ),
        )
      ],
    );
  }
}