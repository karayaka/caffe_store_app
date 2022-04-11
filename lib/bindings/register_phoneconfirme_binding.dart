import 'package:caffe_store_app/datas/controllers/register_phoneconfirm_controller.dart';
import 'package:get/get.dart';

class RegisterPhoneConfirmeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => RegisterPhoneConfirmController());
  }
}
