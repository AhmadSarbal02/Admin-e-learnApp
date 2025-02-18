import 'package:admin/core/class/statusrequest.dart';
import 'package:admin/core/constant/routes.dart';
import 'package:admin/core/function/handlingdata.dart';
import 'package:admin/data/datasource/remote/categories_data.dart';
import 'package:admin/data/model/categoriesmodel.dart';
import 'package:get/get.dart';

class CategoriesViewController extends GetxController {
  CategoriesData categoriesData = CategoriesData(Get.find());
  List<CategoriesModel> data = [];

  late StatusRequest statusRequest;

  getData() async {
    data.clear();
    statusRequest = StatusRequest.loading;
    update();
    var response = await categoriesData.get();
    // ignore: avoid_print
    print("=============================== Controller $response ");
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        List datalist = response['data'];
        data.addAll(datalist.map((e) => CategoriesModel.fromJson(e)));
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  deleteCategory(String id, String imagename) async {
    await categoriesData.delete({
      'id': id,
      "imagename": imagename,
    });

    data.removeWhere((element) => element.categoriesId.toString() == id);

    update();
  }

  goToPageEdit(CategoriesModel categoriesModel) {
    Get.toNamed(AppRoute.categoriesEdit, arguments: {
      "categoriesModel": categoriesModel,
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
