import 'package:caffe_store_app/datas/models/base_models/base_result.dart';
import 'package:caffe_store_app/datas/models/security_models/register_model.dart';
import 'package:caffe_store_app/datas/models/security_models/verify_phone_number_model.dart';
import 'package:caffe_store_app/datas/services/base_service.dart';

class SecurityRepository {
  Future<BaseResult> register(RegisterModel registerModel) async {
    BaseResult model = await BaseService.instance!.dioPost<RegisterModel>(
        "Security/Register", RegisterModel(), registerModel);
    return model;
  }

  Future<Null> reSendRegisterCode(int ID) async {
    //Türü belirlecek
    /*BaseResult model = await BaseService.instance!.dioPost<RegisterModel>(
        "Security/Register", RegisterModel(), registerModel);*/
    return null;
  }

  Future<BaseResult> confirmeRegisterCode(
      VerifyPhoneNumberModelModel verifyModel) async {
    //Türü belirlecek
    BaseResult model = await BaseService.instance!
        .dioPost<VerifyPhoneNumberModelModel>(
            "Security/VerifyPhoneNumberRegister",
            VerifyPhoneNumberModelModel(),
            verifyModel);
    return model;
  }
}
