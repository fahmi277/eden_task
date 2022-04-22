import 'package:get/get.dart';

import '../modules/addhistorical/bindings/addhistorical_binding.dart';
import '../modules/addhistorical/views/addhistorical_view.dart';
import '../modules/historical/bindings/historical_binding.dart';
import '../modules/historical/views/historical_view.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/landing/bindings/landing_binding.dart';
import '../modules/landing/views/landing_view.dart';
import '../modules/profile/bindings/profile_binding.dart';
import '../modules/profile/views/profile_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.HOME;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.LANDING,
      page: () => LandingView(),
      binding: LandingBinding(),
    ),
    GetPage(
      name: _Paths.PROFILE,
      page: () => ProfileView(),
      binding: ProfileBinding(),
    ),
    GetPage(
      name: _Paths.HISTORICAL,
      page: () => HistoricalView(),
      binding: HistoricalBinding(),
    ),
    GetPage(
      name: _Paths.ADDHISTORICAL,
      page: () => AddhistoricalView(),
      binding: AddhistoricalBinding(),
    ),
  ];
}
