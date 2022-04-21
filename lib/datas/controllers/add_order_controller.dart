import 'package:caffe_store_app/core/component_models/select_component_model.dart';
import 'package:caffe_store_app/datas/controllers/base_controller.dart';
import 'package:caffe_store_app/datas/controllers/main_controller.dart';
import 'package:caffe_store_app/datas/models/order_models/order_create_model.dart';
import 'package:caffe_store_app/datas/repositorys/home_repository.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class AddOrderController extends BaseController {
  var repo = Get.find<HomeRepository>();
  var orderCreateModel = OrderCreateModel();
  var showAdressForm = false.obs;
  List<SelectComponentModel> provinces = [];
  List<SelectComponentModel> periots = [];
  var lodingFormAdress = false.obs;
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    _formLoader();
  }

  var adressFormKey = GlobalKey<FormState>();
  var currentSteps = 0.obs;

  onStepContinue() {
    if (currentSteps.value < 2) {
      currentSteps.value++;
    }
  }

  onStepCancel() {
    if (currentSteps.value > 0) {
      currentSteps.value--;
    }
  }

  changeOrderTypeStatus(val) {
    orderCreateModel.orderTypeStatus = val;
    showAdressForm.value = val == 1;
  }

  _formLoader() async {
    lodingFormAdress.value = true;
    await getProvinces();
    await getPeriot();
    lodingFormAdress.value = false;
  }

  Future getProvinces() async {
    try {
      var token = await Get.find<MainController>().getToken();
      var model = prepareServiceModel<List<SelectComponentModel>>(
          await repo.getProvidence(token ?? ""));

      if (model != null) {
        provinces = model;
      }
    } catch (e) {
      errorMessage("Bir Sorun Oluştu");
    }
  }

// bualana balılacal
  Future getPeriot() async {
    try {
      var token = await Get.find<MainController>().getToken();
      var model = prepareServiceModel<List<SelectComponentModel>>(
          await repo.getPeriot(token ?? ""));

      if (model != null) {
        periots = model;
      }
    } catch (e) {
      errorMessage("Bir Sorun Oluştu");
    }
  }

  Future<List<SelectComponentModel>> getDistrict(int providenceId) async {
    try {
      List<SelectComponentModel> list = [];
      var token = await Get.find<MainController>().getToken();
      var model = prepareServiceModel<List<SelectComponentModel>>(
          await repo.getDistrict(token ?? "", providenceId));
      if (model != null) {
        list = model;
      }
      return list;
    } catch (e) {
      return [];
    }
  }

  Future<List<SelectComponentModel>> getNeighborhood(int districtId) async {
    try {
      List<SelectComponentModel> list = [];
      var token = await Get.find<MainController>().getToken();
      var model = prepareServiceModel<List<SelectComponentModel>>(
          await repo.getNeighborhood(token ?? "", districtId));
      if (model != null) {
        list = model;
      }
      return list;
    } catch (e) {
      return [];
    }
  }
}
