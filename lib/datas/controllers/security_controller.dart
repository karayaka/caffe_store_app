import 'package:caffe_store_app/datas/controllers/base_controller.dart';
import 'package:caffe_store_app/datas/controllers/main_controller.dart';
import 'package:caffe_store_app/datas/models/security_models/login_model.dart';
import 'package:caffe_store_app/datas/models/security_models/login_result_model.dart';
import 'package:caffe_store_app/datas/models/security_models/register_model.dart';
import 'package:caffe_store_app/datas/models/security_models/register_result_model.dart';
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
    loginModel = LoginModel();
    super.onInit();
  }

  //bU iMZA aLINACAK aPİ iLE sEND eDİLECEK VE MESAJA EKLENECEK
  Future<String?> getAppAppSignature() async {
    return await SmsVerification.getAppSignature();
  }

  var repo = Get.find<SecurityRepository>();
  var main = Get.find<MainController>();
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
  late LoginModel loginModel;
  var loginLoading = false.obs;
  //forgat password
  var forgetPasswordLoading = false.obs;
  String phoneNumber = "";

  onTapChange(int index) {
    currentIndex.value = index;
    title.value = titles[index];
  }

  jumpToPage(int i) {
    pageController.jumpToPage(i);
  }

  registerUser() async {
    try {
      if (registerFormKey.currentState!.validate()) {
        registerButtonLoading.value = true;
        registerModel.appSinature = await getAppAppSignature();
        var model = await repo.register(registerModel);
        var register = prepareServiceModel<RegisterResultViewModel>(model);
        if (register != null) {
          Get.toNamed(RouteConst.registerConfirmPhone,
              arguments: [register.id, register.confirmeCode]);
        }
      }
      registerButtonLoading.value = false;
    } catch (e) {
      registerButtonLoading.value = false;
    }
  }

  login() async {
    try {
      if (loginFormKey.currentState!.validate()) {
        loginLoading.value = true;
        var model =
            prepareServiceModel<LoginResultModel>(await repo.login(loginModel));
        if (model != null) {
          var main = Get.find<MainController>();
          main.setLoginModel(loginModel);
          main.setToken(model.token ?? "");
          Get.offAllNamed(RouteConst.home);
        }
        loginLoading.value = false;
      }
    } catch (e) {
      loginLoading.value = false;
    }
  }

  loginRegister(String? token) {
    if (token != null) {
      var loginModel = LoginModel(
        userName: registerModel.phoneNumber,
        password: registerModel.password,
      );
      main.setLoginModel(loginModel);
      main.setToken(token);
      succesMessage("Giriş Başarılı");
    }
  }

  forgetPassword() async {
    try {
      if (phoneNumber == "") {
        errorMessage("Telefon NUmarası Girin");
        return;
      }
      var appsignuture = await getAppAppSignature();
      print(appsignuture);
      forgetPasswordLoading.value = true;
      var model = prepareServiceModel<RegisterResultViewModel>(
          await repo.resetPassword(phoneNumber, appsignuture ?? ""));
      forgetPasswordLoading.value = false;
      if (model != null) {
        Get.toNamed(RouteConst.resetPasswordConfirmPhone,
            arguments: [model.id, model.confirmeCode]);
      }
    } catch (e) {
      print(e.toString());
    }
  }
}
