import 'package:admin/core/services/services.dart';

import 'package:get/get.dart';

abstract class HomeController extends GetxController {
  initialData();
}

class HomeControllerImp extends HomeController {
  MyServices myServices = Get.find();

  String? username;
  int? id;
  String? phone;
  String? email;

  List categories = [];
  List courses = [];

  @override
  initialData() {
    username = myServices.sharedPreferences.getString("username");
    email = myServices.sharedPreferences.getString("email");
    id = myServices.sharedPreferences.getInt("id");
    phone = myServices.sharedPreferences.getString("phone");
  }

  @override
  void onInit() {
    initialData();
    super.onInit();
  }
}
