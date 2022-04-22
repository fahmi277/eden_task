import 'package:get/get.dart';

import '../controllers/historical_controller.dart';

class HistoricalBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HistoricalController>(
      () => HistoricalController(),
    );
  }
}
