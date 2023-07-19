import 'dart:io';

import 'package:chips_choice/chips_choice.dart';
import 'package:ecommerce_admin/commonWidgets/customAppbarWidget.dart';
import 'package:ecommerce_admin/commonWidgets/elevatedButton.dart';
import 'package:ecommerce_admin/commonWidgets/textField.dart';
import 'package:ecommerce_admin/const/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

// ignore: must_be_immutable
class UpdateOutfitsScreen extends StatefulWidget {
  UpdateOutfitsScreen({super.key});

  @override
  State<UpdateOutfitsScreen> createState() => _UpdateEquipOutfitsScreen();
}

class _UpdateEquipOutfitsScreen extends State<UpdateOutfitsScreen> {
  String? imagePath;

  List<String> selectedChoices = [];

  List<String> choices = [
    'Large',
    'Small',
    'XL',
    'XXL',
    'XXXl',
  ];

  TextEditingController productNameController = TextEditingController();
  TextEditingController quantityController = TextEditingController();
  TextEditingController priceController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            const CustomAppBArWidget(title: "Edit Product", size: 188),
            kHeight100,
            Stack(
              children: [
                Container(
                  height: 550.h,
                  width: 550.w,
                  decoration: BoxDecoration(
                      color: greyShade,
                      borderRadius: BorderRadius.circular(30.r)),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(15),
                        child: SizedBox(
                          height: 450.h,
                          width: 400.w,
                          child: ClipRRect(
                            child: imagePath == null
                                ? Image.asset("asset/default/DefaultImages.png")
                                : Image.file(File(imagePath!)),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Positioned(
                  right: 0,
                  bottom: 0,
                  left: 140,
                  child: IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.add_a_photo_outlined,
                        size: 50,
                      )),
                )
              ],
            ),
            kHeight80,
            TextFieldWidget(
                controller: productNameController,
                hlength: 150,
                title: "Product Name",
                wlength: 0,
                hintText: "Product Name"),
            kFormField30,
            SizedBox(
              width: double.infinity,
              height: 200.h,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  ChipsChoice<String>.multiple(
                    value: selectedChoices,
                    onChanged: (val) {
                      setState(() {
                        selectedChoices = val;
                      });
                      // print(selectedChoices);
                    },
                    choiceItems: C2Choice.listFrom<String, String>(
                      source: choices,
                      value: (i, v) => v,
                      label: (i, v) => v,
                    ),
                    choiceStyle: C2ChipStyle.outlined(
                      borderWidth: 2,
                      selectedStyle: C2ChipStyle(
                        borderColor: darkShades,
                        foregroundColor: darkShades,
                      ),
                    ),
                  )
                ],
              ),
            ),
            kFormField30,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextFieldWidget(
                    title: "Quantity",
                    wlength: 2.5,
                    hintText: "Quantity",
                    hlength: 150,
                    controller: quantityController),
                TextFieldWidget(
                    title: "Price",
                    wlength: 2.5,
                    hintText: "Price",
                    hlength: 150,
                    controller: priceController),
              ],
            ),
            kFormField30,
            TextFieldWidget(
                title: "Description",
                wlength: 0,
                hintText: "Description",
                hlength: 500,
                controller: descriptionController),
            SizedBox(
              height: 100.h,
            ),
            ElevatedButtonWidget(
              title: "Add Product",
              action: () {},
            ),
            SizedBox(
              height: 100.h,
            ),
          ],
        ),
      ),
    );
  }
}
