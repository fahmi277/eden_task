import 'package:get/get.dart';

import '../controllers/addhistorical_controller.dart';

class AddhistoricalBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AddhistoricalController>(
      () => AddhistoricalController(),
    );
  }
}
