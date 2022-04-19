import 'package:caffe_store_app/datas/controllers/base_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class AddOrderController extends BaseController {
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
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
}
