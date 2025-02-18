import 'package:admin/controller/homecontroller.dart';
import 'package:admin/core/constant/color.dart';
import 'package:admin/core/constant/imageasset.dart';
import 'package:admin/core/constant/routes.dart';
import 'package:admin/core/services/services.dart';
import 'package:admin/view/widget/home/cardadmin.dart';

import 'package:admin/view/widget/home/customviewhome.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    MyServices myServices = Get.find();
    HomeControllerImp controller = Get.put(HomeControllerImp());
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home"),
        actions: [
          IconButton(
            onPressed: () {
              Get.defaultDialog(
                backgroundColor: AppColor.primaryColor,
                buttonColor: const Color.fromARGB(255, 128, 208, 184),
                cancelTextColor: Colors.white,
                confirmTextColor: Colors.white,
                title: "Warning",
                titleStyle: const TextStyle(
                    color: Colors.white, fontWeight: FontWeight.bold),
                middleText: " Are You Sure To LogOut ?",
                middleTextStyle: const TextStyle(
                    color: Colors.white, fontWeight: FontWeight.bold),
                onCancel: () {},
                onConfirm: () {
                  myServices.sharedPreferences.clear();
                  Get.offAllNamed(AppRoute.login);
                },
              );
            },
            icon: const Icon(Icons.logout),
          ),
        ],
      ),
      body: Container(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: ListView(
            children: [
              CustomViewHome(name: controller.username!),
              GridView(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  mainAxisExtent: 150,
                ),
                children: [
                  CustomCardAdmin(
                    onTap: () {
                      Get.toNamed(AppRoute.usersView);
                    },
                    name: "Users",
                    url: AppImageAsset.users,
                  ),
                  CustomCardAdmin(
                    onTap: () {
                      Get.offAllNamed(AppRoute.categoriesView);
                    },
                    name: "Categories",
                    url: AppImageAsset.categories,
                  ),
                  CustomCardAdmin(
                    onTap: () {
                      Get.offAllNamed(AppRoute.coursesView);
                    },
                    name: "Courses",
                    url: AppImageAsset.courses,
                  ),
                  // CustomCardAdmin(
                  //   onTap: () {},
                  //   name: "Videos",
                  //   url: AppImageAsset.videos,
                  // ),
                ],
              )
            ],
          )),
    );
  }
}
