import 'dart:io';

import 'package:admin/controller/courses/viewcourses_controller.dart';
import 'package:admin/core/class/statusrequest.dart';
import 'package:admin/core/constant/routes.dart';
import 'package:admin/core/function/handlingdata.dart';
import 'package:admin/core/function/upload_file.dart';

import 'package:admin/data/datasource/remote/courses_data.dart';
import 'package:admin/data/model/Coursesmodel.dart';
import 'package:drop_down_list/model/selected_list_item.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

class CoursesEditController extends GetxController {
  CoursesData coursesData = CoursesData(Get.find());

  List<SelectedListItem> dropdownList = [];
  GlobalKey<FormState> formstate = GlobalKey<FormState>();
  late TextEditingController dropDownName;
  late TextEditingController dropDownId;
  late TextEditingController name;
  late TextEditingController desc;
  late TextEditingController details;
  TextEditingController? catid;
  TextEditingController? catName;
  String? active;

  CoursesModel? coursesModel;
  StatusRequest? statusRequest = StatusRequest.none;
  File? file;

  chooseImage() async {
    file = await fileUploadGallery(true);
    update();
  }

  editData() async {
    if (formstate.currentState!.validate()) {
      // if (file == null) Get.snackbar("Warning", "Please Choose SVG Image");
      statusRequest = StatusRequest.loading;
      update();
      Map data = {
        "id": coursesModel!.coursesId.toString(),
        "imageold": coursesModel!.coursesImage,
        "active": active,
        "name": name.text,
        "details": details.text,
        "desc": desc.text,
        "catid": catid!.text,
      };
      var response = await coursesData.edit(data, file);
      // ignore: avoid_print
      print("=============================== Controller $response ");
      statusRequest = handlingData(response);
      if (StatusRequest.success == statusRequest) {
        if (response['status'] == "success") {
          Get.offNamed(AppRoute.coursesView);
          CoursesViewController c = Get.find();
          c.getData();
        } else {
          statusRequest = StatusRequest.failure;
        }
      }
      update();
    }
  }

  changeStatusActive(val) {
    active = val;
    update();
  }

  @override
  void onInit() {
    coursesModel = Get.arguments["coursesModel"];
    name = TextEditingController();
    details = TextEditingController();
    desc = TextEditingController();
    catName = TextEditingController();
    catid = TextEditingController();
    dropDownName = TextEditingController();
    dropDownId = TextEditingController();
    name.text = coursesModel!.coursesName!;
    desc.text = coursesModel!.coursesDesc!;
    details.text = coursesModel!.coursesVideo!;
    active = coursesModel!.coursesMore.toString();

    catid!.text = coursesModel!.categoriesId.toString();
    catName!.text = coursesModel!.categoriesName!;
    super.onInit();
  }
}
