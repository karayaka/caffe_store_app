import 'package:caffe_store_app/datas/controllers/base_controller.dart';
import 'package:caffe_store_app/datas/models/security_models/register_model.dart';
import 'package:caffe_store_app/datas/repositorys/security_repository.dart';
import 'package:caffe_store_app/routings/route_couns.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sms_otp_auto_verify/sms_otp_auto_verify.dart';

class SecurityController extends BaseController {
  @override
  void onInit() {
    pageController = PageController(initialPage: 0, keepPage: false);
    registerModel = RegisterModel();
    registerFormKey = GlobalKey<FormState>();
    loginFormKey = GlobalKey<FormState>();
    super.onInit();
  }

  //bU iMZA aLINACAK aPİ iLE sEND eDİLECEK VE MESAJA EKLENECEK
  Future<String?> getAppAppSignature() async {
    return await SmsVerification.getAppSignature();
  }

  var repo = Get.find<SecurityRepository>();
  var title = "Kayıt Ol".obs;
  var titles = ["Kayıt Ol", "Giriş Yap", "Şifremi Unuttum"];
  var currentIndex = 0.obs;
  late PageController pageController;
  //registerForm
  late RegisterModel registerModel;
  late GlobalKey<FormState> registerFormKey;
  var registerButtonLoading = false.obs;
  //loginForm
  late GlobalKey<FormState> loginFormKey;

  onTapChange(int index) {
    currentIndex.value = index;
    title.value = titles[index];
  }

  jumpToPage(int i) {
    pageController.jumpToPage(i);
  }

  sendConfirmeCode(String code, int id) async {}

  registerUser() async {
    registerButtonLoading.value = true;
    var model = await repo.register(registerModel);
    var register = prepareServiceModel<RegisterModel>(model);
    if (register != null) {
      var retVal =
          await Get.toNamed(RouteConst.registerConfirmPhone, arguments: [
        {"ID": register.id}
      ]);
      if (retVal != "-1") {
        await sendConfirmeCode(retVal, register.id ?? 0);
      } else {
        warningMessage("Doğrulama Başarısız Lütfen Daha Sonra Tekrar Deneyin");
      }
      registerButtonLoading.value = false;
    }
  }
}
