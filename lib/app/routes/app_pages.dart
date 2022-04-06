import 'package:get/get.dart';

import 'package:api_integration/app/modules/gallery_view/bindings/gallery_view_binding.dart';
import 'package:api_integration/app/modules/gallery_view/views/gallery_view_view.dart';
import 'package:api_integration/app/modules/home/bindings/home_binding.dart';
import 'package:api_integration/app/modules/home/views/home_view.dart';
import 'package:api_integration/app/modules/sign_in/bindings/sign_in_binding.dart';
import 'package:api_integration/app/modules/sign_in/views/sign_in_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.SIGN_IN;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.SIGN_IN,
      page: () => SignInView(),
      binding: SignInBinding(),
    ),
    GetPage(
      name: _Paths.GALLERY_VIEW,
      page: () => GalleryViewView(),
      binding: GalleryViewBinding(),
    ),
  ];
}
