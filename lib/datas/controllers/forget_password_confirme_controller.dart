import 'package:caffe_store_app/datas/controllers/base_controller.dart';

import 'package:caffe_store_app/datas/models/security_models/register_result_model.dart';
import 'package:caffe_store_app/datas/repositorys/security_repository.dart';
import 'package:caffe_store_app/routings/route_couns.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sms_otp_auto_verify/sms_otp_auto_verify.dart';

class ForgetPasswordConfirmeController extends BaseController {
  @override
  void onInit() {
    confirmeTextController = TextEditingController();
    super.onInit();
    _startListeningSms();
  }

  var repo = Get.find<SecurityRepository>();

  var confirmeModel = RegisterResultViewModel();

  var id = Get.arguments[0];
  var code = Get.arguments[1];

  String password = "";
  String repeadPassword = "";

  var isSending = false.obs;
  var confirmedCode = "".obs;

  late TextEditingController confirmeTextController;

  var formKey = GlobalKey<FormState>();

  final intRegex = RegExp(r'\d+', multiLine: true);

  _startListeningSms() {
    SmsVerification.startListeningSms().then((message) {
      confirmedCode.value = SmsVerification.getCode(message, intRegex);
      confirmeTextController.text = confirmedCode.value;
      print("forget Passwor token ${confirmedCode.value}");
    });
  }

  reSendCode() async {
    try {
      var model = prepareServiceModel<RegisterResultViewModel>(
          await repo.reSendSMSCode(id));
      if (model != null) {
        code = model.confirmeCode;
        _startListeningSms();
      }
    } catch (e) {
      errorMessage("Beklenmedik Bir Hata Oldu Data Sonra Tekrar Deneyin");
    }
  }

  confirmeCode() async {
    try {
      if (!formKey.currentState!.validate()) {
        errorMessage("Lütfen Bilgileri Kotrol");
        return;
      }

      isSending.value = true;
      var confirme = RegisterResultViewModel(
        id: id,
        confirmeCode: confirmedCode.value,
        password: password,
      );
      var model = prepareServiceModel<RegisterResultViewModel>(
          await repo.resetPasswordConfirme(confirme));
      isSending.value = false;
      if (model != null) {
        Get.offAllNamed(RouteConst.home);
      }
    } catch (e) {
      errorMessage("Beklenmedik Bir Hata Oldu Data Sonra Tekrar Deneyin");
    }
  }
}
