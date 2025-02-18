import 'package:admin/controller/categories/viewcategorise_controller.dart';
import 'package:admin/core/class/handlingdataview.dart';
import 'package:admin/core/constant/color.dart';
import 'package:admin/core/constant/routes.dart';
import 'package:admin/linkapi.dart';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class CategoriesView extends StatelessWidget {
  const CategoriesView({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(CategoriesViewController());

    return Scaffold(
      appBar: AppBar(
        title: const Text("Categories"),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.toNamed(AppRoute.categoriesAdd);
        },
        backgroundColor: AppColor.primaryColor,
        child: const Icon(Icons.add),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      body: GetBuilder<CategoriesViewController>(
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
                                    child: SvgPicture.network(
                                      height: 80,
                                      "${AppLink.imagestCategories}/${controller.data[index].categoriesImage}",
                                    ),
                                  )),
                              Expanded(
                                  flex: 3,
                                  child: ListTile(
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
                                                  controller.deleteCategory(
                                                      controller.data[index]
                                                          .categoriesId
                                                          .toString(),
                                                      controller.data[index]
                                                          .categoriesImage!);
                                                  Get.back();
                                                },
                                              );
                                            },
                                            icon: const Icon(
                                                Icons.delete_outline)),
                                      ],
                                    ),
                                    title: Text(
                                        controller.data[index].categoriesName!),
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
