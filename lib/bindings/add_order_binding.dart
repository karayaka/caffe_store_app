import 'package:caffe_store_app/datas/controllers/add_order_controller.dart';
import 'package:get/get.dart';

class AddOrderBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => AddOrderController());
  }
}
