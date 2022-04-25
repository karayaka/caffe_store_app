import 'package:caffe_store_app/datas/controllers/base_controller.dart';
import 'package:caffe_store_app/datas/controllers/main_controller.dart';
import 'package:caffe_store_app/datas/models/basket_models/basket_change_quantity_model.dart';
import 'package:caffe_store_app/datas/models/basket_models/basket_list_model.dart';
import 'package:caffe_store_app/datas/repositorys/home_repository.dart';
import 'package:get/get.dart';

class BasketController extends BaseController {
  var repo = Get.find<HomeRepository>();

  var isLogined = false.obs;
  var basketListLoading = false.obs;
  int deletedLodingID = 0;
  int pieceLodingID = 0;
  var orderButtonLoading = false.obs;

  var basketTotal = 0.0.obs;

  List<BasketListModel> baskets = [];

  @override
  void onInit() async {
    preparePage();
    super.onInit();
  }

  preparePage() async {
    var token = await Get.find<MainController>().getToken() ?? "";
    if (token != "") {
      isLogined.value = true;
      getPage(token);
    } else {
      isLogined.value = false;
    }
  }

  getBasketTotal() {
    double total = 0.0;
    if (baskets.isEmpty) {
      basketTotal.value = 0.0;
    } else {
      for (var item in baskets) {
        total += item.totalPrice ?? 0;
      }
      basketTotal.value = total;
    }
  }

  void getPage(String token) async {
    try {
      basketListLoading.value = true;
      var model = prepareServiceModel<List<BasketListModel>>(
          await repo.getBaskets(token));
      if (model != null) {
        baskets = model;
        getBasketTotal();
      }
    } catch (e) {
      errorMessage(e.toString());
    }
    basketListLoading.value = false;
  }

  deleteBasket(int id) async {
    try {
      deletedLodingID = id;
      update(["delete_$id"]);
      var token = await Get.find<MainController>().getToken();
      var val = prepareServiceModel(await repo.deleteBasket(id, token ?? ""));
      deletedLodingID = 0;
      update(["delete_$id"]);
      preparePage();
    } catch (e) {
      throw e;
    }
  }

  Future<void> changeBasketQuantity(int id, int quantity) async {
    try {
      var change = BasketChangeQuantityModel(
        id: id,
        quantity: quantity,
        basketTotal: 0.0,
      );
      var basket = baskets.firstWhere((element) => element.id == id);
      pieceLodingID = id;
      update(["cardTota_$id"]);
      var token = await Get.find<MainController>().getToken();
      var total = prepareServiceModel<BasketChangeQuantityModel>(
        await repo.changeBasketQuantity(change, token ?? ""),
      );
      if (total != null) {
        basket.quantity = quantity;
        basket.totalPrice = total.basketTotal ?? 0;
        getBasketTotal();
      }
      pieceLodingID = 0;
      update(["cardTota_$id"]);
    } catch (e) {
      warningMessage("Bir Sorun Oluştu");
    }
  }
}
