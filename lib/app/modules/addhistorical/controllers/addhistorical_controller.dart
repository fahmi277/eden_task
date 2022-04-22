// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../data/models/model_user_weigth.dart';
import '../../../data/services/firebase_services/read_service.dart';
import '../../../data/services/firebase_services/write_service.dart';

class AddhistoricalController extends GetxController {
  //TODO: Implement AddhistoricalController

  TextEditingController weigthController = TextEditingController();
  final dayInputWeigth = ''.obs;
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}

  Future<void> simpanData() async {
    ModelUserWeigth modelUserWeigth = ModelUserWeigth();
    modelUserWeigth.beratBadan = double.parse(weigthController.value.text);
    modelUserWeigth.tanggal = dayInputWeigth.value;

    print(modelUserWeigth.toJson());

    var data = await WriteFirebase()
        .writeRecordFirebase(modelUserWeigth)
        .then((value) {
      ReadFirebase().readFirebase("id");
      Get.snackbar("Success", "Greats, you a so diligent",
          snackPosition: SnackPosition.BOTTOM);
      weigthController.text = "";
      dayInputWeigth.value = "";
    }).onError((error, stackTrace) {
      Get.snackbar(
          "Error", "We are error, please try again and check your connection",
          snackPosition: SnackPosition.BOTTOM);
    });
  }
}
