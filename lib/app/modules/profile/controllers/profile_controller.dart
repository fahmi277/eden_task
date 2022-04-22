// ignore_for_file: avoid_print

import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:test_eden_farm/app/data/services/firebase_services/write_service.dart';

import '../../../data/models/model_user_weigth.dart';
import '../../../data/models/user_model.dart';
import '../../../data/services/firebase_services/read_service.dart';

List listGender = ['Male', 'Female'];

var userProfil = User().obs;

class ProfileController extends GetxController {
  //TODO: Implement ProfileController

  TextEditingController nameController = TextEditingController();
  TextEditingController heightController = TextEditingController();
  final dateOfBirth = ''.obs;
  final genderUser = ''.obs;
  final isProfileNull = true.obs;

  User user = User();

  @override
  void onInit() {
    super.onInit();
    bacaProfile();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    nameController.dispose();
    heightController.dispose();
  }

  // void writeFirebase(ModelUserWeigth modelUserWeigth) {
  //   final jsonUpload = {
  //     modelUserWeigth.tanggal.toString(): {
  //       'berat_badan': modelUserWeigth.beratBadan
  //     }
  //   };

  //   final users = FirebaseFirestore.instance.collection('users').doc('12345');
  //   users
  //       .update(jsonUpload)
  //       .then((value) => print("Data uplaoded"))
  //       .catchError((error) => print("Failed to add user: $error"));
  // }

  simpanData() async {
    user.dayofBirth = dateOfBirth.value;
    user.heigth = double.parse(heightController.value.text);
    user.gender = genderUser.value;
    user.name = nameController.value.text;

    var data = await WriteFirebase().writeProfileFirebase(user);

    print(user.toJson());
    print(data);
    ReadFirebase().readProfileFirebase("");
    Get.back();
  }

  bacaProfile() {
    ReadFirebase().readProfileFirebase("");
  }

  saveData() async {
    ModelUserWeigth modelUserWeigth = ModelUserWeigth();
    modelUserWeigth.beratBadan = 56.3;
    modelUserWeigth.tanggal = "2022-01-08";

    var data = await WriteFirebase().writeRecordFirebase(modelUserWeigth);
    print(data);

    // var data = await ReadFirebase().readFirebase("id");
    // print(data[0].toJson());

    // if (nameController.value.text.isEmpty) {
    //   Get.snackbar("Error !", "Please enter your name",
    //       snackPosition: SnackPosition.BOTTOM);
    // } else if (heightController.value.text.isEmpty) {
    //   Get.snackbar("Error !", "Please enter your height",
    //       snackPosition: SnackPosition.BOTTOM);
    // } else {
    //   writeFirebase();
    // }
  }
}
