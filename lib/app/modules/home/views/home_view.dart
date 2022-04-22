// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors, must_be_immutable, invalid_use_of_protected_member

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:get/get.dart';
import 'package:test_eden_farm/app/data/services/firebase_services/read_service.dart';
import 'package:test_eden_farm/app/modules/historical/controllers/historical_controller.dart';
import 'package:test_eden_farm/app/routes/app_pages.dart';
import 'package:test_eden_farm/components/custom_button.dart';
import 'package:test_eden_farm/components/custom_text.dart';

import '../../../data/models/chart_model.dart';
import '../../../data/utils/get_date.dart';
import '../controllers/home_controller.dart';
import 'chart_view.dart';

class HomeView extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    final List<DeveloperSeries> data = [
      DeveloperSeries(
        year: "1",
        developers: listWeigth.value[listWeigth.length - 1].beratBadan,
        barColor: charts.ColorUtil.fromDartColor(Colors.lightBlue),
      ),
      DeveloperSeries(
        year: "2",
        developers: listWeigth.value[listWeigth.length - 2].beratBadan,
        barColor: charts.ColorUtil.fromDartColor(Colors.lightBlue),
      ),
      DeveloperSeries(
        year: "3",
        developers: listWeigth.value[listWeigth.length - 3].beratBadan,
        barColor: charts.ColorUtil.fromDartColor(Colors.lightBlue),
      ),
      // DeveloperSeries(
      //   year: "4",
      //   developers: 56.9,
      //   barColor: charts.ColorUtil.fromDartColor(Colors.lightBlue),
      // ),
      // DeveloperSeries(
      //   year: "5",
      //   developers: 54,
      //   barColor: charts.ColorUtil.fromDartColor(Colors.green),
      // ),
    ];
    return Scaffold(
        body: Obx(
      () => controller.isLoading.isTrue
          ? Center(
              child: CircularProgressIndicator(),
            )
          : publicUser.value.name.isEmpty
              ? Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CustomText(
                        text: "Please fill your profile, first ..",
                        fontSize: 16,
                        fontColor: Colors.lightBlue,
                        fontWeight: FontWeight.bold,
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      CustomButton(
                          onPressed: () {
                            Get.toNamed(Routes.PROFILE);
                          },
                          text: "Login, Follow Me",
                          fontSize: 16,
                          color: Colors.white,
                          fontWeight: FontWeight.bold)
                    ],
                  ),
                )
              : Stack(
                  children: [
                    Container(
                      height: 300,
                      width: double.infinity,
                      color: Colors.lightBlue,
                      child: SafeArea(
                        child: Padding(
                          padding: EdgeInsets.fromLTRB(15, 15, 15,
                              0), // left = 15, top = 15, rigth = 15, bot = 0
                          child: Obx(() => MainDashboard(
                                nama: publicUser.value.name,
                              )),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.fromLTRB(15, 315, 15, 0),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              CustomText(
                                  text: "Overview",
                                  fontColor: Colors.lightBlue,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold),
                              CustomButton(
                                  onPressed: () {
                                    Get.toNamed(Routes.HISTORICAL);
                                  },
                                  text: 'Historical Data',
                                  fontSize: 16,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                              CustomButton(
                                  onPressed: () {
                                    Get.toNamed(Routes.ADDHISTORICAL);
                                  },
                                  text: 'Tambah Data',
                                  fontSize: 16,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold)
                            ],
                          ),
                          DeveloperChart(data: data)
                        ],
                      ),
                    )
                  ],
                ),
    ));
  }
}

class MainDashboard extends StatelessWidget {
  String nama;
  MainDashboard({Key? key, this.nama = ''}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomText(
                  text: GetDatetime().result(),
                  fontColor: Colors.white70,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
                Row(
                  children: [
                    CustomText(
                        text: "Hello, $nama",
                        fontColor: Colors.white,
                        fontSize: 30,
                        fontWeight: FontWeight.bold),
                  ],
                ),
              ],
            ),
            InkWell(
              onTap: () {
                Get.toNamed(Routes.PROFILE);
              },
              child: CircleAvatar(
                backgroundColor: Colors.white,
                child: Icon(Icons.settings),
              ),
            ),
          ],
        ),
        SizedBox(
          height: 5,
        ),
        SizedBox(
          height: 175,
          width: double.infinity,
          child: Card(
            child: Padding(
              padding: const EdgeInsets.only(top: 10, left: 15, right: 15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 5,
                  ),
                  Obx(() => Expanded(
                        child: ListView.builder(
                            itemCount: listWeigth.length,
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (context, index) {
                              return Row(
                                children: [
                                  CardLastInfo(
                                    textDate: '${listWeigth[index].tanggal}',
                                    textInfo: listWeigth[index].beratBadan > 60
                                        ? "Bad"
                                        : "Good",
                                    textWeight:
                                        '${listWeigth[index].beratBadan}',
                                  ),
                                  SizedBox(
                                    width: 5,
                                  )
                                ],
                              );
                            }),
                      )),
                  // Row(
                  //   crossAxisAlignment: CrossAxisAlignment.start,
                  //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  //   children: [

                  //     CardLastInfo(
                  //         textDate: "19, Mei 2022",
                  //         textInfo: "Good",
                  //         textWeight: '55.2'),

                  //     // CardLastInfo(
                  //     //     textDate: "20, Mei 2022",
                  //     //     textInfo: "Good",
                  //     //     textWeight: '55.1'),
                  //     // CardLastInfo(
                  //     //     textDate: "21, Mei 2022",
                  //     //     textInfo: "Good",
                  //     //     textWeight: '54.9'),
                  //   ],
                  // ),

                  SizedBox(
                    height: 10,
                  ),
                  CustomText(
                      text: "Average Last 3 days: .. Kg",
                      fontColor: Colors.lightBlue,
                      fontSize: 16,
                      fontWeight: FontWeight.bold),
                  SizedBox(
                    height: 10,
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class CardLastInfo extends StatelessWidget {
  String textInfo;
  String textWeight;
  String textDate;
  CardLastInfo({
    Key? key,
    required this.textInfo,
    required this.textWeight,
    required this.textDate,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: Container(
            color:
                double.parse(textWeight) > 60 ? Colors.red : Colors.lightBlue,
            height: 50,
            width: 50,
            // margin: EdgeInsets.all(5),
            padding: EdgeInsets.all(5),
            child: FittedBox(
              child: CustomText(
                  text: textInfo,
                  fontColor: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.bold),
            ),
          ),
        ),
        SizedBox(
          height: 5,
        ),
        CustomText(
            text: "$textWeight Kg",
            fontColor: Colors.lightBlue,
            fontSize: 16,
            fontWeight: FontWeight.bold),
        CustomText(
            text: textDate,
            fontColor: Colors.lightBlue,
            fontSize: 16,
            fontWeight: FontWeight.bold),
      ],
    );
  }
}
