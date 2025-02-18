import 'package:admin/controller/courses/viewcourses_controller.dart';
import 'package:admin/core/class/handlingdataview.dart';
import 'package:admin/core/constant/color.dart';
import 'package:admin/core/constant/routes.dart';
import 'package:admin/linkapi.dart';
import 'package:cached_network_image/cached_network_image.dart';

import 'package:flutter/material.dart';

import 'package:get/get.dart';

class CoursesView extends StatelessWidget {
  const CoursesView({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(CoursesViewController());

    return Scaffold(
      appBar: AppBar(
        title: const Text("Courses"),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.toNamed(AppRoute.coursesAdd);
        },
        backgroundColor: AppColor.primaryColor,
        child: const Icon(Icons.add),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      body: GetBuilder<CoursesViewController>(
          builder: ((controller) => HandlingDataView(
                statusRequest: controller.statusRequest,
                // ignore: deprecated_member_use
                widget: WillPopScope(
                  onWillPop: () {
                    return controller.myback();
                  },
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: ListView.builder(
                      itemCount: controller.data.length,
                      itemBuilder: (context, index) {
                        return InkWell(
                          onTap: () {
                            controller.goToPageEdit(controller.data[index]);
                          },
                          child: Card(
                              child: Row(
                            children: [
                              Expanded(
                                  flex: 2,
                                  child: Container(
                                    padding: const EdgeInsets.all(4),
                                    child: CachedNetworkImage(
                                      height: 80,
                                      imageUrl:
                                          "${AppLink.imagestCourses}/${controller.data[index].coursesImage}",
                                    ),
                                  )),
                              Expanded(
                                  flex: 3,
                                  child: ListTile(
                                    trailing: Row(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        // IconButton(
                                        //   onPressed: () {
                                        //     controller.goToPageEdit(
                                        //         controller.data[index]);
                                        //   },
                                        //   icon: const Icon(Icons.edit),
                                        // ),
                                        IconButton(
                                            onPressed: () {
                                              Get.defaultDialog(
                                                backgroundColor:
                                                    AppColor.primaryColor,
                                                buttonColor:
                                                    const Color.fromARGB(
                                                        255, 128, 208, 184),
                                                cancelTextColor: Colors.white,
                                                confirmTextColor: Colors.white,
                                                title: "Warning",
                                                titleStyle: const TextStyle(
                                                    color: Colors.white,
                                                    fontWeight:
                                                        FontWeight.bold),
                                                middleText:
                                                    " Are You Sure To Delete This Category ?",
                                                middleTextStyle:
                                                    const TextStyle(
                                                        color: Colors.white,
                                                        fontWeight:
                                                            FontWeight.bold),
                                                onCancel: () {},
                                                onConfirm: () {
                                                  controller.deleteCourses(
                                                      controller
                                                          .data[index].coursesId
                                                          .toString(),
                                                      controller.data[index]
                                                          .coursesImage!);
                                                  Get.back();
                                                },
                                              );
                                            },
                                            icon: const Icon(
                                                Icons.delete_outline)),
                                      ],
                                    ),
                                    title: Text(
                                        controller.data[index].coursesName!),
                                    subtitle: Text(
                                        " Category : ${controller.data[index].categoriesName!}"),
                                  )),
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
