import 'package:estore/common/widgets/loaders/shimmer.dart';
import 'package:estore/features/personalization/controllers/user_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../utils/constants/colors.dart';
import '../../../utils/constants/image_strings.dart';
import '../images/t_circular_image.dart';

class TUserProfileTile extends StatelessWidget {
  const TUserProfileTile({
    super.key,
    required this.onPressed,
  });

  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    final controller = UserController.instance;
    return ListTile(
      leading: Obx(
        () {
          final networkImage = controller.user.value.profilePicture;
          final image = networkImage.isNotEmpty ? networkImage : TImages.user;

          return controller.isImageUploading.value
              ? const TShimmerEffect(
                  width: 80,
                  height: 80,
                  radius: 80,
                )
              : TCircularImage(
                  width: 60,
                  height: 60,
                  imageUrl: image,
                  isNetworkImage: networkImage.isNotEmpty,
                );
        },
      ),
      title: Text(
        controller.user.value.fullName,
        style: Theme.of(context)
            .textTheme
            .headlineSmall!
            .apply(color: TColors.white),
      ),
      subtitle: Text(
        controller.user.value.email,
        style:
            Theme.of(context).textTheme.bodyMedium!.apply(color: TColors.white),
      ),
      trailing: IconButton(
        onPressed: onPressed,
        icon: const Icon(Icons.edit_note),
        color: TColors.white,
      ),
    );
  }
}
