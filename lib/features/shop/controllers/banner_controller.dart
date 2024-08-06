import 'package:estore/data/repositories/banners/banner_repository.dart';
import 'package:estore/features/shop/models/banner_model.dart';
import 'package:estore/utils/popups/loaders.dart';
import 'package:get/get.dart';

class BannerController extends GetxController {
  final carousalCurrentIndex = 0.obs;
  final isLoading = false.obs;
  final RxList<BannerModel> banners = <BannerModel>[].obs;

  @override
  void onInit() {
    fetchBanners();
    super.onInit();
  }

  void updatePageIndicator(index) {
    carousalCurrentIndex.value = index;
  }

  Future<void> fetchBanners() async {
    try {
      isLoading.value = true;

      final bannerRepository = Get.put(BannerRepository());
      final banners = await bannerRepository.getAllBanners();
      this.banners.assignAll(banners);
    } catch (e) {
      TLoaders.errorSnackBar(title: 'An Error Occured', message: e.toString());
    } finally {
      isLoading.value = false;
    }
  }
}
