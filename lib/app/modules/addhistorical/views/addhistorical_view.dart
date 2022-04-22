// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../../components/custom_button.dart';
import '../../../../components/custom_text.dart';
import '../controllers/addhistorical_controller.dart';

class AddhistoricalView extends GetView<AddhistoricalController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            CustomText(
              text: "Add your weigth",
              fontSize: 20,
              fontColor: Colors.white,
              fontWeight: FontWeight.bold,
            ),
            // Icon(Icons.edit)
          ],
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.fromLTRB(15, 15, 15, 0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              InkWell(
                onTap: () {
                  showDatePicker(
                          context: context,
                          initialDate: DateTime.now(),
                          firstDate: DateTime(1900),
                          lastDate: DateTime.now())
                      .then((value) {
                    if (value == null) {
                      return null;
                    } else {
                      controller.dayInputWeigth.value =
                          value.toString().split(' ')[0]; // get only date

                    }
                    // print(controller.);
                  });
                },
                child: SizedBox(
                  height: 70,
                  width: double.infinity,
                  child: Card(
                      child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Obx(() => CustomText(
                              text: controller.dayInputWeigth.value.isEmpty
                                  ? "Select your date record"
                                  : "Time Record ${controller.dayInputWeigth.value}",
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              fontColor: Colors.lightBlue,
                            )),
                        Icon(
                          Icons.arrow_drop_down,
                          size: 50,
                          color: Colors.lightBlue,
                        )
                      ],
                    ),
                  )),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              SizedBox(height: 10),
              CustomTexformField(
                  textInputType: TextInputType.number,
                  header: "Heigth (Kg)",
                  textEditingController: controller.weigthController),
              SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  CustomButton(
                      onPressed: () {
                        // controller.simpanData();
                        controller.simpanData();
                      },
                      text: "Simpan Data",
                      fontSize: 16,
                      color: Colors.white,
                      fontWeight: FontWeight.bold),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

class CardGender extends StatelessWidget {
  Color colorBg;
  Color colorText;
  String cardText;
  CardGender(
      {Key? key,
      this.colorBg = Colors.white,
      this.colorText = Colors.lightBlue,
      this.cardText = ''})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        print("object");
      },
      child: SizedBox(
        height: 50,
        width: 100,
        child: Card(
            color: colorBg,
            child: Center(
                child: CustomText(
              text: cardText,
              fontSize: 16,
              fontWeight: FontWeight.bold,
              fontColor: colorText,
            ))),
      ),
    );
  }
}

class CustomTexformField extends StatelessWidget {
  TextEditingController textEditingController;
  String header;
  TextInputType textInputType;
  CustomTexformField(
      {Key? key,
      required this.textEditingController,
      this.header = '',
      this.textInputType = TextInputType.name})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomText(
          text: header,
          fontSize: 16,
          fontWeight: FontWeight.bold,
          fontColor: Colors.lightBlue,
        ),
        SizedBox(
          height: 10,
        ),
        TextFormField(
          keyboardType: textInputType,
          controller: textEditingController,
          decoration: InputDecoration(
            focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.lightBlue),
                borderRadius: BorderRadius.all(Radius.circular(5))),
            enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.lightBlue),
                borderRadius: BorderRadius.all(Radius.circular(5))),
          ),
        )
      ],
    );
  }
}
