import 'package:caffe_store_app/datas/controllers/login_controller.dart';
import 'package:caffe_store_app/datas/repositorys/login_repository.dart';
import 'package:get/get.dart';

class LoginBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => LoginRepository());
    Get.lazyPut(() => LoginController());
  }
}
