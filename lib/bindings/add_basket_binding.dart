import 'package:caffe_store_app/datas/controllers/add_basket_controller.dart';
import 'package:get/get.dart';

class AddBasketBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => AddBasketController());
  }
}
