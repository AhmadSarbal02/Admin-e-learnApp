import 'package:admin/core/class/statusrequest.dart';
import 'package:admin/core/constant/routes.dart';
import 'package:admin/core/function/handlingdata.dart';
import 'package:admin/core/services/services.dart';
import 'package:admin/data/datasource/remote/auth/login.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

abstract class LoginController extends GetxController {
  // GoogleSignIn googleSignIn = GoogleSignIn(scopes: ['email']);
  // FirebaseAuth auth = FirebaseAuth.instance;
  login();
  goToSignUp();
  goToForgetPassword();
}

class LoginControllerImp extends LoginController {
  GlobalKey<FormState> formstate = GlobalKey<FormState>();
  late TextEditingController email;
  late TextEditingController password;
  bool isshowpassword = true;
  MyServices myServices = Get.find();
  StatusRequest? statusRequest;
  LoginData loginData = LoginData(Get.find());

  showPassword() {
    isshowpassword = isshowpassword == true ? false : true;
    update();
  }

  @override
  login() async {
    if (formstate.currentState!.validate()) {
      statusRequest = StatusRequest.loading;
      update();
      var response = await loginData.postdata(email.text, password.text);
      // ignore: avoid_print
      print("=============================== Controller $response ");
      statusRequest = handlingData(response);
      if (StatusRequest.success == statusRequest) {
        if (response['status'] == "success") {
          myServices.sharedPreferences
              .setInt("id", response['data']['admin_id']);
          myServices.sharedPreferences
              .setString("username", response['data']['admin_name']);
          myServices.sharedPreferences
              .setString("email", response['data']['admin_email']);
          myServices.sharedPreferences
              .setString("phone", response['data']['admin_phone']);
          myServices.sharedPreferences.setString("step", "2");
          Get.offNamed(AppRoute.home);
        } else {
          Get.defaultDialog(
              title: "ُWarning", middleText: "Password Or Email Not Correct");
          statusRequest = StatusRequest.failure;
        }
      }
      update();
    } else {}
  }

  @override
  goToSignUp() {}

  @override
  goToForgetPassword() {}

  @override
  void onInit() {
    email = TextEditingController();
    password = TextEditingController();
    super.onInit();
  }

  @override
  void dispose() {
    email.dispose();
    password.dispose();
    super.dispose();
  }
}
