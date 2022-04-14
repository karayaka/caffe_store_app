import 'package:caffe_store_app/datas/controllers/base_controller.dart';
import 'package:caffe_store_app/datas/controllers/main_controller.dart';
import 'package:caffe_store_app/datas/models/product_models/product_model.dart';
import 'package:caffe_store_app/datas/repositorys/home_repository.dart';
import 'package:caffe_store_app/enums/screan_state.dart';
import 'package:caffe_store_app/routings/route_couns.dart';
import 'package:get/get.dart';

class HomeController extends BaseController {
  var repo = Get.find<HomeRepository>();

  bool nextPageLoding = false;

  List<ProductModel> products = [];

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    getProduct();
  }

  int pageID = 1;

  getProduct() async {
    state.value = ScreanState.loading;
    try {
      var model = prepareServiceModel<List<ProductModel>>(
          await repo.getProduct(pageID));
      if (model != null) products = model;
    } catch (e) {
      errorMessage(e.toString());
    }
    state.value = ScreanState.loaded;
  }

  routeCheck(int id, String name) async {
    var token = await Get.find<MainController>().getToken();
    if (token != null) {
      Get.toNamed(RouteConst.add_basket, arguments: {"ID": id, "title": name});
    } else {
      Get.toNamed(RouteConst.security);
    }
  }
}
