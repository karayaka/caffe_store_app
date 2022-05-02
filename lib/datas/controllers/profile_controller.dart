import 'package:caffe_store_app/datas/controllers/base_controller.dart';
import 'package:caffe_store_app/datas/controllers/main_controller.dart';
import 'package:caffe_store_app/datas/models/security_models/register_model.dart';
import 'package:caffe_store_app/datas/repositorys/home_repository.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class ProfileController extends BaseController {
  var repo = Get.find<HomeRepository>();

  var profile = RegisterModel();
  var pageLoading = false.obs;
  var showLoginButton = true.obs;
  var saveLoading = false.obs;
  var logOutLoding = false.obs;
  var profileFormKey = GlobalKey<FormState>();
  String token = "";
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
  }

  pagePrepage() async {
    token = await Get.find<MainController>().getToken() ?? "";
    if (token == "") {
      showLoginButton.value = true;
    } else {
      showLoginButton.value = false;
      getProfile();
    }
  }

  getProfile() async {
    try {
      pageLoading.value = true;
      var model =
          prepareServiceModel<RegisterModel>(await repo.getProfile(token));
      if (model != null) {
        profile = model;
      }
    } catch (e) {
      errorMessage("Bir Sorun Oluştu");
    }
    pageLoading.value = false;
  }

  updateProfile() async {
    try {
      saveLoading.value = true;
      var val = prepareServiceModel(await repo.updateProfile(profile, token));
      saveLoading.value = false;
    } catch (e) {
      print(e.toString());
      errorMessage("Bir Sorun Oluştu");
    }
  }

  logOut() async {
    logOutLoding.value = true;
    await Get.find<MainController>().logOut();
    logOutLoding.value = false;
    pagePrepage();
  }
}
