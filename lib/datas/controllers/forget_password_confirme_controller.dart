import 'package:caffe_store_app/datas/controllers/base_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sms_otp_auto_verify/sms_otp_auto_verify.dart';

class ForgetPasswordConfirmeController extends BaseController {
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
  }

  var id = Get.arguments[0];
  var code = Get.arguments[1];

  var isSending = false.obs;
  var confirmedCode = "".obs;

  late TextEditingController confirmeTextController;

  final intRegex = RegExp(r'\d+', multiLine: true);

  _startListeningSms() {
    SmsVerification.startListeningSms().then((message) {
      confirmedCode.value = SmsVerification.getCode(message, intRegex);
      confirmeTextController.text = confirmedCode.value;
    });
  }

  reSendCode() {}
  confirmeCode() {}
}
