import 'package:caffe_store_app/datas/controllers/splash_controller.dart';
import 'package:caffe_store_app/datas/repositorys/security_repository.dart';
import 'package:get/get.dart';

class SplashBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => SecurityRepository());
    Get.lazyPut(() => SplashController());
  }
}
