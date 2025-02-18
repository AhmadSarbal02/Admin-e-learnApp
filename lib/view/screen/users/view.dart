import 'package:admin/controller/users/viewusers_controller.dart';
import 'package:admin/core/class/handlingdataview.dart';
import 'package:admin/core/constant/color.dart';

import 'package:flutter/material.dart';

import 'package:get/get.dart';

class UsersView extends StatelessWidget {
  const UsersView({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(UsersViewController());

    return Scaffold(
      appBar: AppBar(
        title: const Text("Users"),
      ),
      body: GetBuilder<UsersViewController>(
          builder: ((controller) => HandlingDataView(
                statusRequest: controller.statusRequest,
                // ignore: deprecated_member_use
                widget: WillPopScope(
                  onWillPop: () {
                    return controller.myback();
                  },
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 10, vertical: 10),
                    child: ListView.builder(
                      itemCount: controller.data.length,
                      itemBuilder: (context, index) {
                        return InkWell(
                          onTap: () {
                            // controller.goToPageEdit(controller.data[index]);
                          },
                          child: Card(
                              child: Column(
                            children: [
                              Row(
                                children: [
                                  Expanded(
                                      flex: 3,
                                      child: ListTile(
                                        leading: Container(
                                            padding: const EdgeInsets.all(4),
                                            child: const Icon(
                                              Icons.person,
                                              color: AppColor.primaryColor,
                                              size: 30,
                                            )
                                            // Image.asset(AppImageAsset.avatar),
                                            ),
                                        trailing: Row(
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            IconButton(
                                                onPressed: () {
                                                  Get.defaultDialog(
                                                    backgroundColor:
                                                        AppColor.primaryColor,
                                                    buttonColor:
                                                        const Color.fromARGB(
                                                            255, 128, 208, 184),
                                                    cancelTextColor:
                                                        Colors.white,
                                                    confirmTextColor:
                                                        Colors.white,
                                                    title: "Warning",
                                                    titleStyle: const TextStyle(
                                                        color: Colors.white,
                                                        fontWeight:
                                                            FontWeight.bold),
                                                    middleText:
                                                        " Are You Sure To Delete This User ?",
                                                    middleTextStyle:
                                                        const TextStyle(
                                                            color: Colors.white,
                                                            fontWeight:
                                                                FontWeight
                                                                    .bold),
                                                    onCancel: () {},
                                                    onConfirm: () {
                                                      controller.deleteCategory(
                                                          controller.data[index]
                                                              .usersId
                                                              .toString());
                                                      Get.back();
                                                    },
                                                  );
                                                },
                                                icon: const Icon(
                                                    Icons.delete_outline)),
                                          ],
                                        ),
                                        title: Container(
                                          height: 200,
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            children: [
                                              Text(
                                                  "ID : ${controller.data[index].usersId.toString()}"),
                                              const SizedBox(
                                                height: 20,
                                              ),
                                              Text(
                                                  "Name : ${controller.data[index].usersName!}"),
                                              const SizedBox(
                                                height: 20,
                                              ),
                                              Text(
                                                  "Phone : ${controller.data[index].usersPhone!}"),
                                              const SizedBox(
                                                height: 20,
                                              ),
                                              Text(
                                                  "Email : ${controller.data[index].usersEmail!}"),
                                            ],
                                          ),
                                        ),
                                      )),
                                ],
                              ),
                            ],
                          )),
                        );
                      },
                    ),
                  ),
                ),
              ))),
    );
  }
}
