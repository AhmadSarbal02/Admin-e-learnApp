import 'dart:io';

import 'package:admin/controller/categories/viewcategorise_controller.dart';
import 'package:admin/core/class/statusrequest.dart';
import 'package:admin/core/constant/routes.dart';
import 'package:admin/core/function/handlingdata.dart';
import 'package:admin/core/function/upload_file.dart';
import 'package:admin/data/datasource/remote/categories_data.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

class CategoriesAddController extends GetxController {
  CategoriesData categoriesData = CategoriesData(Get.find());

  GlobalKey<FormState> formstate = GlobalKey<FormState>();
  late TextEditingController name;

  StatusRequest? statusRequest = StatusRequest.none;
  File? file;

  chooseImage() async {
    file = await fileUploadGallery(true);
    update();
  }

  addData() async {
    if (formstate.currentState!.validate()) {
      if (file == null) Get.snackbar("Warning", "Please Choose SVG Image");
      statusRequest = StatusRequest.loading;
      update();
      Map data = {
        "name": name.text,
      };
      var response = await categoriesData.add(data, file!);
      // ignore: avoid_print
      print("=============================== Controller $response ");
      statusRequest = handlingData(response);
      if (StatusRequest.success == statusRequest) {
        if (response['status'] == "success") {
          Get.offNamed(AppRoute.categoriesView);
          CategoriesViewController c = Get.find();
          c.getData();
        } else {
          statusRequest = StatusRequest.failure;
        }
      }
      update();
    }
  }

  @override
  void onInit() {
    name = TextEditingController();

    super.onInit();
  }
}
