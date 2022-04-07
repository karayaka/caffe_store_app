import 'package:caffe_store_app/datas/controllers/base_controller.dart';
import 'package:caffe_store_app/datas/models/product_models/product_model.dart';
import 'package:caffe_store_app/datas/repositorys/home_repository.dart';
import 'package:caffe_store_app/enums/screan_state.dart';
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
    state.value = ScreanState.loding;
    try {
      var model = prepareServiceModel<List<ProductModel>>(
          await repo.getProduct(pageID));
      if (model != null) products = model;
    } catch (e) {
      errorMessage(e.toString());
    }

    state.value = ScreanState.loaded;
  }
}
