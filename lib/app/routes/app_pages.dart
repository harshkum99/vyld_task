import 'package:get/get.dart';
import 'package:vyld/app/modules/HomePage/bindings/homepage_bindings.dart';
import 'package:vyld/app/modules/HomePage/views/homepage_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.HOMEPAGE;

  static final routes = [
    GetPage(
      name: _Paths.HOMEPAGE,
      page: () => const MyHomePage(),
      binding: HomePageBinding(),
    )
  ];
}
