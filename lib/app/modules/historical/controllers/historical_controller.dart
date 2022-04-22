// ignore_for_file: avoid_print

import 'package:get/get.dart';
import 'package:test_eden_farm/app/data/services/firebase_services/read_service.dart';

import '../../../data/models/model_user_weigth.dart';

// List<ModelUserWeigth> listWeigth = [];
var listWeigth = [].obs;

class HistoricalController extends GetxController {
  final isLoading = true.obs;
  final errorStatus = false.obs;
  // late List<ModelUserWeigth> listWeigth = [];

  void read() async {
    ReadFirebase().readFirebase("id").then((value) {
      // print(value);
      listWeigth.value = value;
      isLoading.value = false;
    }).onError((error, stackTrace) {
      isLoading.value = false;
      errorStatus.value = true;
    });

    // print(listWeigth);
  }

  @override
  void onInit() {
    super.onInit();

    read();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}
}
