import 'package:get/get.dart';

import '../../../data/services/firebase_services/read_service.dart';

class HomeController extends GetxController {
  //TODO: Implement HomeController

  final isLoading = true.obs;
  @override
  void onInit() {
    super.onInit();
    ReadFirebase().readProfileFirebase("null");
    ReadFirebase().readFirebase("null");
    isLoading.value = false;
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}
}
