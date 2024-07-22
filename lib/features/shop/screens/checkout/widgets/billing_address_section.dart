import 'package:estore/common/widgets/texts/section_heading.dart';
import 'package:estore/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

class TBillingAddressSection extends StatelessWidget {
  const TBillingAddressSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TSectionHeading(title: "Shipping Address", buttonTitle: "Change", onPressed: (){},),
        const SizedBox(height: TSizes.spaceBtwItems / 2,),
        Text("Rubin Baidhya", style: Theme.of(context).textTheme.bodyLarge,),
        const SizedBox(height: TSizes.spaceBtwItems / 2,),
        Row(
          children: [
            const Icon(Icons.phone, size: 16, color: Colors.grey,),
            const SizedBox(width: TSizes.spaceBtwItems,),
            Text("9865230258", style: Theme.of(context).textTheme.bodyMedium,)
          ],
        ),
        const SizedBox(height: TSizes.spaceBtwItems / 2,),
        Row(
          children: [
            const Icon(Icons.location_history, size: 16, color: Colors.grey,),
            const SizedBox(width: TSizes.spaceBtwItems,),
            Text("Kamal Binayak, Bhaktapur, Nepal", style: Theme.of(context).textTheme.bodyMedium,)
          ],
        )
      ],
    );
  }
}
