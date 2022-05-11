import 'package:caffe_store_app/datas/controllers/base_controller.dart';
import 'package:caffe_store_app/datas/controllers/basket_controller.dart';
import 'package:caffe_store_app/datas/controllers/order_controller.dart';
import 'package:caffe_store_app/datas/controllers/profile_controller.dart';
import 'package:caffe_store_app/datas/models/security_models/login_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MainController extends BaseController {
  late PageController pageController;
  var titles = ["Ürünler", "Sepetim", "Siparişlerim", "Profilim"];
  var _token = "";
  LoginModel? _loginModel;
  @override
  void onInit() {
    pageController = PageController(initialPage: currentIndex.value);
    super.onInit();
  }

  var currentIndex = 0.obs;

  onTapChange(int index) {
    currentIndex.value = index;
    if (index == 1) {
      Get.find<BasketController>().preparePage();
    } else if (index == 2) {
      Get.find<OrderController>().pagePrepage();
    } else if (index == 3) {
      Get.find<ProfileController>().pagePrepage();
    }
    pageController.animateToPage(index,
        duration: const Duration(microseconds: 300), curve: Curves.bounceIn);
  }

  setToken(String token) async {
    var preferences = await SharedPreferences.getInstance();
    preferences.remove("token");
    preferences.setString("token", token);
    _token = token;
  }

  Future<String?> getToken() async {
    if (_token != "") {
      return _token;
    } else {
      var preferences = await SharedPreferences.getInstance();
      return await preferences.getString("token");
    }
  }

  setLoginModel(LoginModel model) async {
    var preferences = await SharedPreferences.getInstance();
    preferences.remove("sesion");
    preferences.setString("sesion", model.toJson());
    _loginModel = model;
  }

  Future<LoginModel?> getLoginModel() async {
    if (_loginModel != null) {
      return _loginModel;
    } else {
      var preferences = await SharedPreferences.getInstance();
      String? str = preferences.getString("sesion");
      if (str == null) return null;
      return LoginModel().fromJson(str);
    }
  }

  Future<bool> logOut() async {
    var preferences = await SharedPreferences.getInstance();
    _token = "";
    _loginModel = null;
    return preferences.clear();
  }
}
