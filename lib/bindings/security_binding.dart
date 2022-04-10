import 'package:caffe_store_app/datas/controllers/security_controller.dart';
import 'package:caffe_store_app/datas/repositorys/security_repository.dart';
import 'package:get/get.dart';

class SecurityBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => SecurityRepository());
    Get.lazyPut(() => SecurityController());
  }
}
