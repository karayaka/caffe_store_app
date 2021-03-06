import 'package:caffe_store_app/datas/controllers/basket_controller.dart';
import 'package:caffe_store_app/datas/controllers/home_controller.dart';
import 'package:caffe_store_app/datas/controllers/order_controller.dart';
import 'package:caffe_store_app/datas/controllers/profile_controller.dart';
import 'package:caffe_store_app/datas/repositorys/home_repository.dart';
import 'package:get/get.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => HomeRepository());
    Get.lazyPut(() => HomeController());
    Get.lazyPut(() => BasketController());
    Get.lazyPut(() => OrderController());
    Get.lazyPut(() => ProfileController());
  }
}
