import 'package:cached_network_image/cached_network_image.dart';
import 'package:estore/common/widgets/shimmers/shimmer.dart';
import 'package:flutter/material.dart';
import '../../../utils/constants/colors.dart';
import '../../../utils/constants/sizes.dart';
import '../../../utils/helpers/helper_functions.dart';

class TVerticalImageText extends StatelessWidget {
  const TVerticalImageText(
      {super.key,
      required this.image,
      required this.title,
      this.onTap,
      this.textColor = TColors.white,
      this.backgroundColor,
      this.isNetworkImage = false,
      this.fit = BoxFit.cover});

  final String image, title;
  final void Function()? onTap;
  final Color textColor;
  final Color? backgroundColor;
  final bool isNetworkImage;
  final BoxFit? fit;

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);

    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.only(right: TSizes.spaceBtwItems),
        child: Column(
          children: [
            Container(
              height: 56,
              width: 56,
              padding: const EdgeInsets.all(TSizes.sm),
              decoration: BoxDecoration(
                  color:
                      backgroundColor ?? (dark ? TColors.black : TColors.white),
                  borderRadius: BorderRadius.circular(100)),
              child: Center(
                child: isNetworkImage
                    ? CachedNetworkImage(
                        imageUrl: image,
                        fit: fit,
                        progressIndicatorBuilder: (context, url, progress) =>
                            const TShimmerEffect(
                          width: 80,
                          height: 80,
                          radius: 80,
                        ),
                        errorWidget: (context, url, error) =>
                            const Icon(Icons.error),
                      )
                    : Image(
                        image: AssetImage(image),
                        fit: fit,
                      ),
              ),
            ),
            const SizedBox(
              height: TSizes.spaceBtwItems / 2,
            ),
            SizedBox(
              width: 55,
              child: Text(
                title,
                style: Theme.of(context)
                    .textTheme
                    .labelMedium!
                    .apply(color: textColor),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.center,
              ),
            )
          ],
        ),
      ),
    );
  }
}
