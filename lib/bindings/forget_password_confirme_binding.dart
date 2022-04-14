import 'package:caffe_store_app/datas/controllers/forget_password_confirme_controller.dart';
import 'package:get/get.dart';

class ForgetPasswordConfirmeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ForgetPasswordConfirmeController());
  }
}
