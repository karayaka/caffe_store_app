import 'package:caffe_store_app/datas/controllers/base_controller.dart';
import 'package:caffe_store_app/datas/repositorys/security_repository.dart';
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

  int ID = Get.arguments["ID"];
  String code = Get.arguments["code"];

  var isSending = false.obs;
  String confirmedCode = "";

  late TextEditingController confirmeTextController;

  final intRegex = RegExp(r'\d+', multiLine: true);

  _startListeningSms() {
    SmsVerification.startListeningSms().then((message) {
      confirmedCode = SmsVerification.getCode(message, intRegex);
      confirmeTextController.text = confirmedCode;
      update(["textUpdate"]);
    });
  }

  reSendCode() async {} //resend ID ile

  confirmeCode() {
    if (confirmeCode == code) {
      confirmeRegisterCode();
    } else {
      errorMessage("Doğrulama Kodu Hatalıdır");
    }
  }

  confirmeRegisterCode() async {
    var resul = await repo.reSendRegisterCode(ID);
    //retun teypende toke a bakılacak
  } //Confirme Code İle ID ile
}
