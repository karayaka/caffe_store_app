import 'package:caffe_store_app/core/component_models/select_component_model.dart';
import 'package:caffe_store_app/datas/controllers/base_controller.dart';
import 'package:caffe_store_app/datas/controllers/main_controller.dart';
import 'package:caffe_store_app/datas/models/order_models/order_create_model.dart';
import 'package:caffe_store_app/datas/repositorys/home_repository.dart';
import 'package:caffe_store_app/routings/route_couns.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class AddOrderController extends BaseController {
  var repo = Get.find<HomeRepository>();
  //order create model
  var orderCreateModel = OrderCreateModel();
  var showAdressForm = false.obs;
  List<SelectComponentModel> provinces = [];
  List<SelectComponentModel> periots = [];
  var lodingFormAdress = false.obs;
  var addOrdetLoding = false.obs;
  //card hızlı göstrrim
  var maskedCardNumber = "".obs;
  var masketExpare = "".obs;
  var cardcvv = "".obs;
  var cardName = "".obs;

  var cardNmbrFormatter = MaskTextInputFormatter(
    mask: '#### #### #### ####',
    filter: {"#": RegExp(r'[0-9]')},
    type: MaskAutoCompletionType.lazy,
  );
  var expareFormatter = MaskTextInputFormatter(
    mask: '##/##',
    filter: {"#": RegExp(r'[0-9]')},
    type: MaskAutoCompletionType.lazy,
  );

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    _formLoader();
  }

  var adressFormKey = GlobalKey<FormState>();
  var paymentFormKey = GlobalKey<FormState>();
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

  bool validateAdressForm() {
    if (orderCreateModel.orderTypeStatus == 1) {
      if (orderCreateModel.neighborhoodID == 0 ||
          orderCreateModel.adress == "") {
        errorMessage("Lütfen Adres Bilgilerini Kotrol Edin");
        return false;
      }
    }
    if (orderCreateModel.deliveryPeriotID == null ||
        orderCreateModel.deliveryPeriotID == 0) {
      errorMessage("Lütfen Teslimat Periotunu Seçin");
      return false;
    }
    return true;
  }

  addOrder() async {
    try {
      addOrdetLoding.value = true;
      var token = await Get.find<MainController>().getToken();
      prepareServiceModel(await repo.addOrder(orderCreateModel, token ?? ""));
      addOrdetLoding.value = false;
      Get.offAllNamed(RouteConst.home);
    } catch (e) {
      errorMessage("Bir Sorun Oluştu");
    }
  }
}
