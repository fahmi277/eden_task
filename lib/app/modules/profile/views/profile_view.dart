// ignore_for_file: prefer_const_constructors, avoid_print, must_be_immutable

import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:test_eden_farm/components/custom_button.dart';
import 'package:test_eden_farm/components/custom_text.dart';
import 'package:toggle_switch/toggle_switch.dart';

import '../controllers/profile_controller.dart';

class ProfileView extends GetView<ProfileController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CustomText(
                text: "Profile",
                fontSize: 20,
                fontColor: Colors.white,
                fontWeight: FontWeight.bold,
              ),
              // Icon(Icons.edit)
            ],
          ),
          centerTitle: true,
        ),
        body: Obx(
          () => SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.fromLTRB(15, 15, 15, 0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomTexformField(
                      header: "Name",
                      content: userProfil.value.name,
                      textEditingController: controller.nameController),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        height: 50,
                        width: 170,
                        child: Card(
                            child: Center(
                                child: CustomText(
                          text: "Select your Gender",
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          fontColor: Colors.lightBlue,
                        ))),
                      ),
                      ToggleSwitch(
                        minWidth: 90.0,
                        initialLabelIndex: 1,
                        cornerRadius: 20.0,
                        activeFgColor: Colors.white,
                        inactiveBgColor: Colors.grey,
                        inactiveFgColor: Colors.white,
                        totalSwitches: 2,
                        labels: ['Male', 'Female'],
                        icons: [Icons.male, Icons.female],
                        activeBgColors: [
                          [Colors.blue],
                          [Colors.pink]
                        ],
                        onToggle: (index) {
                          // print('switched to: $index');
                          controller.genderUser.value = listGender[index!];
                        },
                      ),
                    ],
                  ),
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
                          controller.dateOfBirth.value =
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
                                  text: controller.dateOfBirth.value.isEmpty ||
                                          userProfil.value.dayofBirth.isEmpty
                                      ? "Select your Date of Birth"
                                      : 'Your date of birth ${controller.dateOfBirth.value}',
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
                  SizedBox(height: 10),
                  CustomTexformField(
                      content: '${userProfil.value.heigth} cm',
                      textInputType: TextInputType.number,
                      header: "Height (Centimeter)",
                      textEditingController: controller.heightController),
                  SizedBox(
                    height: 20,
                  ),
                  Align(
                    alignment: Alignment.centerRight,
                    child: Row(
                      children: [
                        CustomButton(
                            onPressed: () {
                              controller.simpanData();
                            },
                            text: "Simpan Data",
                            fontSize: 16,
                            color: Colors.white,
                            fontWeight: FontWeight.bold),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ));
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
  String content;
  CustomTexformField(
      {Key? key,
      required this.textEditingController,
      this.header = '',
      this.content = '',
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
            hintText: content,
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
