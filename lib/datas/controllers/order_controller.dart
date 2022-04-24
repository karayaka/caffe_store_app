import 'package:caffe_store_app/datas/controllers/base_controller.dart';
import 'package:caffe_store_app/datas/controllers/main_controller.dart';
import 'package:caffe_store_app/datas/models/order_models/order_list_model.dart';
import 'package:caffe_store_app/datas/repositorys/home_repository.dart';
import 'package:get/get.dart';

class OrderController extends BaseController {
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    //pagePrepage();
  }

  var repo = Get.find<HomeRepository>();

  String token = "";
  var showLoginPage = false.obs;
  var pageLoding = false.obs;
  List<OrderListModel> orders = [];

  pagePrepage() async {
    token = await Get.find<MainController>().getToken() ?? "";
    if (token == "") {
      showLoginPage.value = true;
    } else {
      showLoginPage.value = false;
      getPage();
    }
  }

  getPage({int id = -1}) async {
    try {
      pageLoding.value = true;
      var model = prepareServiceModel<List<OrderListModel>>(
          await repo.getOrders(token, id));
      if (model != null) {
        orders = model;
      }
      pageLoding.value = false;
    } catch (e) {
      print(e.toString());
    }
  }
}
