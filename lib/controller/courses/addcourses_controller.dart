import 'dart:io';

import 'package:admin/controller/courses/viewcourses_controller.dart';
import 'package:admin/core/class/statusrequest.dart';
import 'package:admin/core/constant/routes.dart';
import 'package:admin/core/function/handlingdata.dart';
import 'package:admin/core/function/upload_file.dart';
import 'package:admin/data/datasource/remote/categories_data.dart';

import 'package:admin/data/datasource/remote/courses_data.dart';
import 'package:admin/data/model/categoriesmodel.dart';
import 'package:drop_down_list/drop_down_list.dart';
import 'package:drop_down_list/model/selected_list_item.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

class CoursesAddController extends GetxController {
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

  StatusRequest? statusRequest = StatusRequest.none;
  File? file;

  chooseImage() async {
    file = await fileUploadGallery(false);
    update();
  }

  getCategories() async {
    CategoriesData categoriesData = CategoriesData(Get.find());
    statusRequest = StatusRequest.loading;
    update();
    var response = await categoriesData.get();
    // ignore: avoid_print
    print("=============================== Controller $response ");
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        List<CategoriesModel> data = [];

        List datalist = response['data'];
        data.addAll(datalist.map((e) => CategoriesModel.fromJson(e)));
        for (int i = 0; i < data.length; i++) {
          dropdownList.add(SelectedListItem(
              name: data[i].categoriesName!,
              value: data[i].categoriesId.toString()));
        }
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  addData() async {
    if (formstate.currentState!.validate()) {
      if (file == null) Get.snackbar("Warning", "Please Choose Image");
      statusRequest = StatusRequest.loading;
      update();
      Map data = {
        "name": name.text,
        "details": details.text,
        "desc": desc.text,
        "catid": catid!.text,
      };
      var response = await coursesData.add(data, file!);
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

  @override
  void onInit() {
    getCategories();
    name = TextEditingController();
    details = TextEditingController();
    desc = TextEditingController();
    catName = TextEditingController();
    catid = TextEditingController();
    dropDownName = TextEditingController();
    dropDownId = TextEditingController();

    super.onInit();
  }

  showDropdownList(context) {}
}
