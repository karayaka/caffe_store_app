import 'package:caffe_store_app/datas/controllers/base_controller.dart';
import 'package:caffe_store_app/datas/controllers/main_controller.dart';
import 'package:caffe_store_app/datas/models/security_models/login_result_model.dart';
import 'package:caffe_store_app/datas/repositorys/security_repository.dart';
import 'package:caffe_store_app/routings/route_couns.dart';
import 'package:get/get.dart';

class SplashController extends BaseController {
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    autoLogin();
  }

  var repo = Get.find<SecurityRepository>();
  var showLoading = true.obs;
//unoutorize yapısı yeniden kurgulanacak ve düzeltilecek apiden un outorize dönme ihtimali kotrol edilecek
//connectivity yazılıp interbnet bağlantısı kotrol edilecek
  autoLogin() async {
    var mainController = Get.find<MainController>();
    try {
      var userModel = await mainController.getLoginModel();
      if (userModel != null) {
        var model =
            prepareServiceModel<LoginResultModel>(await repo.login(userModel));
        if (model != null) {
          mainController.setToken(model.token ?? "");
        }
      }
      Get.offAndToNamed(RouteConst.home);
    } catch (e) {
      mainController.logOut();
      Get.offAndToNamed(RouteConst.home);
    }
  }
}
