import 'package:admin/controller/auth/login_controller.dart';
import 'package:admin/core/class/statusrequest.dart';
import 'package:admin/core/constant/color.dart';
import 'package:admin/core/constant/imageasset.dart';
import 'package:admin/core/function/alertexitapp.dart';
import 'package:admin/core/function/validinput.dart';
import 'package:admin/view/widget/auth/custombuttonauth.dart';
import 'package:admin/view/widget/auth/custometexttitleauth.dart';
import 'package:admin/view/widget/auth/customtextbodyauth.dart';
import 'package:admin/view/widget/auth/customtextformauth.dart';
import 'package:admin/view/widget/auth/customtextsignup.dart';
import 'package:admin/view/widget/auth/logoauth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(LoginControllerImp());
    return Scaffold(
        appBar: AppBar(
          // toolbarHeight: 90,
          backgroundColor: AppColor.backGround,
          elevation: 0.0,
          centerTitle: true,
          title: Text('8'.tr,
              style: const TextStyle(color: AppColor.grey, fontSize: 22)),
        ),
        // ignore: deprecated_member_use
        body: WillPopScope(
            onWillPop: alertExitApp,
            child: GetBuilder<LoginControllerImp>(
              builder: (controller) => controller.statusRequest ==
                      StatusRequest.loading
                  ? Center(
                      child: Lottie.asset(AppImageAsset.loading,
                          width: 250, height: 250),
                    )
                  : Container(
                      color: AppColor.backGround,
                      padding: const EdgeInsets.symmetric(
                          vertical: 15, horizontal: 30),
                      child: Form(
                        key: controller.formstate,
                        child: ListView(
                          // physics: const NeverScrollableScrollPhysics(),
                          children: [
                            const SizedBox(
                              height: 20,
                            ),
                            const LogoAuth(),
                            CustomTextTitleAuth(
                              text: "9".tr,
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            CustomTextBodyAuth(text: "10".tr),
                            const SizedBox(
                              height: 20,
                            ),
                            CustomTextFormAuth(
                              obscureText: false,
                              isNumber: false,
                              valid: (val) {
                                return validInput(val!, 10, 100, "email");
                              },
                              mycontroller: controller.email,
                              hinttext: "11".tr,
                              labeltext: "21".tr,
                              icondata: Icons.email_outlined,
                            ),
                            GetBuilder<LoginControllerImp>(
                              builder: (controller) => CustomTextFormAuth(
                                onTapIcon: () {
                                  controller.showPassword();
                                },
                                obscureText: controller.isshowpassword,
                                isNumber: false,
                                valid: (val) {
                                  return validInput(val!, 8, 30, "password");
                                },
                                mycontroller: controller.password,
                                hinttext: "12".tr,
                                labeltext: "23".tr,
                                icondata: Icons.lock_outline,
                              ),
                            ),
                            CustomButtonAuth(
                              text: "8".tr,
                              onPressed: () {
                                controller.login();
                              },
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                          ],
                        ),
                      ),
                    ),
            )));
  }
}
