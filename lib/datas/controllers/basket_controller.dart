import 'package:caffe_store_app/datas/controllers/base_controller.dart';
import 'package:caffe_store_app/datas/controllers/main_controller.dart';
import 'package:caffe_store_app/datas/models/basket_models/basket_list_model.dart';
import 'package:caffe_store_app/datas/repositorys/home_repository.dart';
import 'package:caffe_store_app/enums/screan_state.dart';
import 'package:get/get.dart';

class BasketController extends BaseController {
  var repo = Get.find<HomeRepository>();

  var isLogined = false.obs;
  var basketListLoading = false.obs;

  List<BasketListModel> baskets = [];

  @override
  void onInit() async {
    preparePage();
    super.onInit();
  }

  preparePage() async {
    var token = await Get.find<MainController>().getToken();
    if (token != null) {
      isLogined.value = true;
      getPage(token);
    } else {
      isLogined.value = true;
    }
  }

  void getPage(String token) async {
    try {
      basketListLoading.value = true;
      var model = prepareServiceModel<List<BasketListModel>>(
          await repo.getBaskets(token));
      if (model != null) {
        baskets = model;
      }
    } catch (e) {
      errorMessage(e.toString());
    }
    basketListLoading.value = false;
  }
}
