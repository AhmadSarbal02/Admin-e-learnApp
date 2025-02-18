import 'package:admin/core/class/statusrequest.dart';
import 'package:admin/core/constant/routes.dart';
import 'package:admin/core/function/handlingdata.dart';
import 'package:admin/data/datasource/remote/courses_data.dart';
import 'package:admin/data/model/Coursesmodel.dart';

import 'package:get/get.dart';

class CoursesViewController extends GetxController {
  CoursesData coursesData = CoursesData(Get.find());
  List<CoursesModel> data = [];

  late StatusRequest statusRequest;

  getData() async {
    data.clear();
    statusRequest = StatusRequest.loading;
    update();
    var response = await coursesData.get();
    // ignore: avoid_print
    print("=============================== Controller $response ");
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        List datalist = response['data'];
        data.addAll(datalist.map((e) => CoursesModel.fromJson(e)));
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  deleteCourses(String id, String imagename) async {
    await coursesData.delete({
      'id': id,
      "imagename": imagename,
    });

    data.removeWhere((element) => element.coursesId.toString() == id);

    update();
  }

  goToPageEdit(CoursesModel coursesModel) {
    Get.toNamed(AppRoute.coursesEdit, arguments: {
      "coursesModel": coursesModel,
    });
  }

  @override
  void onInit() {
    getData();
    super.onInit();
  }

  myback() {
    Get.offAndToNamed(AppRoute.home);
    return Future.value(false);
  }
}
