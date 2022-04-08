import 'package:caffe_store_app/datas/controllers/base_controller.dart';
import 'package:caffe_store_app/datas/models/product_models/product_detail_model.dart';
import 'package:caffe_store_app/datas/repositorys/home_repository.dart';
import 'package:caffe_store_app/enums/screan_state.dart';
import 'package:get/get.dart';

class AddBasketController extends BaseController {
  int id = Get.arguments["ID"];
  String title = Get.arguments["title"];

  @override
  void onInit() {
    getProductDetail();
    super.onInit();
  }

  var product = ProductDetailModel();

  var repo = Get.find<HomeRepository>();

  getProductDetail() async {
    try {
      state.value = ScreanState.loding;
      try {
        var model = prepareServiceModel<ProductDetailModel>(
            await repo.getProductDetail(id));
        if (model != null) product = model;
      } catch (e) {
        errorMessage(e.toString());
      }

      state.value = ScreanState.loaded;
    } catch (e) {
      errorMessage(e.toString());
      state.value = ScreanState.loaded;
    }
  }
}
