import 'package:caffe_store_app/datas/controllers/base_controller.dart';
import 'package:caffe_store_app/datas/models/security_models/register_model.dart';
import 'package:caffe_store_app/datas/repositorys/security_repository.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SecurityController extends BaseController {
  @override
  void onInit() {
    pageController = PageController(initialPage: 0, keepPage: false);
    registerModel = RegisterModel();
    registerFormKey = GlobalKey<FormState>();
    loginFormKey = GlobalKey<FormState>();
    super.onInit();
  }

  var repo = Get.find<SecurityRepository>();
  var title = "Kayıt Ol".obs;
  var titles = ["Kayıt Ol", "Giriş Yap", "Şifremi Unuttum"];
  var currentIndex = 0.obs;
  late PageController pageController;
  //registerForm
  late RegisterModel registerModel;
  late GlobalKey<FormState> registerFormKey;
  //loginForm
  late GlobalKey<FormState> loginFormKey;

  onTapChange(int index) {
    currentIndex.value = index;
    title.value = titles[index];
  }

  jumpToPage(int i) {
    pageController.jumpToPage(i);
  }

  registerUser() {}
}
