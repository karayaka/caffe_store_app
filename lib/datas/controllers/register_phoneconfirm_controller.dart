// ignore_for_file: unrelated_type_equality_checks

import 'package:caffe_store_app/datas/controllers/base_controller.dart';
import 'package:caffe_store_app/datas/controllers/security_controller.dart';
import 'package:caffe_store_app/datas/models/security_models/login_result_model.dart';
import 'package:caffe_store_app/datas/models/security_models/register_result_model.dart';
import 'package:caffe_store_app/datas/models/security_models/verify_phone_number_model.dart';
import 'package:caffe_store_app/datas/repositorys/security_repository.dart';
import 'package:caffe_store_app/routings/route_couns.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:sms_otp_auto_verify/sms_otp_auto_verify.dart';

class RegisterPhoneConfirmController extends BaseController {
  @override
  void onInit() {
    confirmeTextController = TextEditingController();
    super.onInit();
    _startListeningSms();
  }

  var repo = Get.find<SecurityRepository>();

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

  reSendCode() async {
    try {
      var model = prepareServiceModel<RegisterResultViewModel>(
          await repo.reSendSMSCode(id));
      if (model != null) {
        code = model.confirmeCode;
      }
    } catch (e) {
      errorMessage("Beklenmedik Bir Hata Oldu Data Sonra Tekrar Deneyin");
    }
  } //resend ID ile

  confirmeCode() {
    if (confirmedCode == code) {
      confirmeRegisterCode();
    } else {
      errorMessage("Doğrulama Kodu Hatalıdır");
    }
  }

  confirmeRegisterCode() async {
    try {
      isSending.value = true;
      var model = VerifyPhoneNumberModelModel(
        verificationCode: code,
        id: id,
      );
      var retVal = await prepareServiceModel<LoginResultModel>(
          await repo.confirmeRegisterCode(model));

      if (retVal != null) {
        Get.find<SecurityController>().loginRegister(retVal.token);
        Get.offAllNamed(RouteConst.home);
      }
      isSending.value = false;
    } catch (e) {
      errorMessage("Beklenmedik Bir Hata Oldu Data Sonra Tekrar Deneyin");
      isSending.value = false;
    }

    //retun teypende toke a bakılacak
  } //Confirme Code İle ID ile
}
