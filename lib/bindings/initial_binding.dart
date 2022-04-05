import 'package:caffe_store_app/datas/controllers/basket_controller.dart';
import 'package:caffe_store_app/datas/controllers/home_controller.dart';
import 'package:caffe_store_app/datas/controllers/main_controller.dart';
import 'package:get/get.dart';

class InitialBinding extends Bindings {
  @override
  void dependencies() {
    Get.create(() => MainController());
  }
}
