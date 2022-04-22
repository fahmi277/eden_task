// ignore_for_file: avoid_print

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:test_eden_farm/app/data/models/user_model.dart';

import '../../models/model_user_weigth.dart';

class WriteFirebase {
  Future<bool> writeRecordFirebase(ModelUserWeigth modelUserWeigth) async {
    // print(modelUserWeigth.toJson());
    final jsonUpload = {
      modelUserWeigth.tanggal.toString(): modelUserWeigth.toJson()
    };
    // final jsonUpload = {
    //   modelUserWeigth.tanggal.toString(): {
    //     'berat_badan': modelUserWeigth.beratBadan
    //   }
    // };

    final users = FirebaseFirestore.instance.collection('users').doc('12345');

    try {
      await users.update(jsonUpload).then((value) {
        print("Completed");
      });
      return true;
    } catch (e) {
      return false;
    }
  }

  Future<bool> writeProfileFirebase(User user) async {
    final jsonUpload = {'profile': user.toJson()};

    final users = FirebaseFirestore.instance.collection('users').doc('12345');

    try {
      await users
          .update(jsonUpload)
          .then((value) {
            print("Completed");
          })
          .then((value) => print("Data uplaoded"))
          .catchError((error) => print("Failed to add user: $error"));
      return true;
    } catch (e) {
      return false;
    }
  }
}
