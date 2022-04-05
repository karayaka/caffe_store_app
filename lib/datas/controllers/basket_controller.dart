import 'package:caffe_store_app/datas/controllers/base_controller.dart';
import 'package:caffe_store_app/datas/repositorys/home_repository.dart';
import 'package:get/get.dart';

class BasketController extends BaseController {
  var repo = Get.find<HomeRepository>();
  @override
  void onInit() {
    super.onInit();
  }
}
