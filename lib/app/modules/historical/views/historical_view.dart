// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:test_eden_farm/app/routes/app_pages.dart';
import 'package:test_eden_farm/components/custom_button.dart';
import 'package:test_eden_farm/components/custom_text.dart';

import '../controllers/historical_controller.dart';

class HistoricalView extends GetView<HistoricalController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("List of Weigth"),
      ),
      body: Obx(() => controller.isLoading.isTrue
          ? Center(child: CircularProgressIndicator())
          : SafeArea(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomText(
                      text: "List of your weigth from start until now",
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      fontColor: Colors.lightBlue,
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Expanded(
                      child: listWeigth.isEmpty
                          ? Center(
                              child: Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 30),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    CustomText(
                                        text:
                                            "Data not Found, do you want to add your weigth?",
                                        fontColor: Colors.lightBlue,
                                        fontSize: 20),
                                    CustomButton(
                                        onPressed: () {
                                          Get.toNamed(Routes.ADDHISTORICAL);
                                        },
                                        text: "Add your weight",
                                        fontSize: 16,
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold)
                                  ],
                                ),
                              ),
                            )
                          : ListView.builder(
                              itemCount: listWeigth.length,
                              itemBuilder: ((context, index) {
                                return SizedBox(
                                  height: 100,
                                  child: Card(
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 10),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              CustomText(
                                                text:
                                                    '${listWeigth[index].tanggal}',
                                                fontSize: 20,
                                                fontWeight: FontWeight.bold,
                                                fontColor: Colors.lightBlue,
                                              ),
                                              CustomText(
                                                text:
                                                    '${listWeigth[index].beratBadan} Kg',
                                                fontSize: 20,
                                                fontWeight: FontWeight.bold,
                                                fontColor: listWeigth[index]
                                                            .beratBadan >
                                                        50
                                                    ? Colors.red
                                                    : Colors.lightBlue,
                                              ),
                                            ],
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                );
                              })),
                    )
                  ],
                ),
              ),
            )),
    );
  }
}
