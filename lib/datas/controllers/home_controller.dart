import 'package:caffe_store_app/core/component_models/select_component_model.dart';
import 'package:caffe_store_app/datas/controllers/base_controller.dart';
import 'package:caffe_store_app/datas/controllers/main_controller.dart';
import 'package:caffe_store_app/datas/models/product_models/product_model.dart';
import 'package:caffe_store_app/datas/repositorys/home_repository.dart';
import 'package:caffe_store_app/enums/screan_state.dart';
import 'package:caffe_store_app/routings/route_couns.dart';
import 'package:get/get.dart';

class HomeController extends BaseController {
  var repo = Get.find<HomeRepository>();

  var categoryLoading = false.obs;
  var listLoading = false.obs;

  List<ProductModel> products = [];

  List<SelectComponentModel> categorys = [
    SelectComponentModel(id: 0, text: "Tümü", value: "0")
  ];

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    getProduct(0);
    getCategorys();
  }

  getProduct(int categoryID) async {
    listLoading.value = true;
    try {
      var model = prepareServiceModel<List<ProductModel>>(
          await repo.getProduct(categoryID));
      if (model != null) products = model;
    } catch (e) {
      errorMessage(e.toString());
    }
    listLoading.value = false;
  }

  routeCheck(int id, String name) async {
    var token = await Get.find<MainController>().getToken() ?? "";
    if (token != "") {
      Get.toNamed(RouteConst.add_basket, arguments: {"ID": id, "title": name});
    } else {
      Get.toNamed(RouteConst.security);
    }
  }

  getCategorys() async {
    try {
      categoryLoading.value = true;
      var models = prepareServiceModel<List<SelectComponentModel>>(
          await repo.getCategory());
      if (models != null) categorys.addAll(models);
    } catch (e) {
      errorMessage("Bir Sorun Oluştu");
    }
    categoryLoading.value = false;
  }
}
