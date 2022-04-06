import 'package:get/get.dart';

import '../controllers/gallery_view_controller.dart';

class GalleryViewBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<GalleryViewController>(
      () => GalleryViewController(),
    );
  }
}
