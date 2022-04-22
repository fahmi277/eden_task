// ignore_for_file: avoid_print

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:test_eden_farm/app/data/models/user_model.dart';

import '../../../modules/historical/controllers/historical_controller.dart';
import '../../../modules/profile/controllers/profile_controller.dart';
import '../../models/model_user_weigth.dart';

var publicUser = User().obs;

class ReadFirebase {
  // baca dokumen di firestore
  Future<List<ModelUserWeigth>> readFirebase(String id) async {
    var data =
        await FirebaseFirestore.instance.collection('users').doc('12345').get();

    Map<String, dynamic> data2 = data.data() as Map<String, dynamic>;
    List<ModelUserWeigth> listDataWeigth = [];
    // print(data.data());
    data2.forEach((key, value) {
      if (key != 'profile') {
        ModelUserWeigth modelUserWeigth = ModelUserWeigth();
        modelUserWeigth.beratBadan = value['berat_badan'];
        modelUserWeigth.tanggal = key;
        print('$key  $value');

        listDataWeigth.add(modelUserWeigth);
      }
    });

    print(listDataWeigth);

    listDataWeigth.sort((a, b) => b.tanggal!.compareTo(a.tanggal!));
    // print(listDataWeigth.to);

    //   listDataWeigth.sort((a, b) => b["price"].compareTo(a["price"]));
    // print('High to low in price: $myProducts');

    //   myProducts.sort((a, b) => b["price"].compareTo(a["price"]));
    // print('High to low in price: $myProducts');

    listWeigth.value = listDataWeigth;

    return listDataWeigth;
  }

  Future<User> readProfileFirebase(String id) async {
    print("Read Profile");
    User user = User();
    var data =
        await FirebaseFirestore.instance.collection('users').doc('12345').get();
    data.data()!.forEach((key, value) {
      if (key == 'profile') {
        // Check if the profile already registred
        print(value);
        user = User.fromJson(value);
      }
    });

    publicUser.value = user;
    print(publicUser.value.toJson());

    userProfil.value = user;

    return user;
  }
}
