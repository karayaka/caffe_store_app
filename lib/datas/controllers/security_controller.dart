import 'package:caffe_store_app/datas/controllers/base_controller.dart';
import 'package:caffe_store_app/datas/repositorys/security_repository.dart';
import 'package:get/get.dart';

class SecurityController extends BaseController {
  var repo = Get.find<SecurityRepository>();
  var title = "Kayıt Ol".obs;
  var titles = ["Kayıt Ol", "Giriş Yap"];

  registerUser() {}
}
