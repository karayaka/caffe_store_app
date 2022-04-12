import 'package:caffe_store_app/datas/models/base_models/base_result.dart';
import 'package:caffe_store_app/datas/models/security_models/login_model.dart';
import 'package:caffe_store_app/datas/models/security_models/login_result_model.dart';
import 'package:caffe_store_app/datas/models/security_models/register_model.dart';
import 'package:caffe_store_app/datas/models/security_models/verify_phone_number_model.dart';
import 'package:caffe_store_app/datas/services/base_service.dart';
import 'package:caffe_store_app/datas/models/security_models/register_result_model.dart';
import 'package:dio/dio.dart';

class SecurityRepository {
  Future<BaseResult> register(RegisterModel registerModel) async {
    try {
      var formData = FormData.fromMap(registerModel.toMap());
      BaseResult model = await BaseService.instance!
          .dioPost<RegisterResultViewModel>(
              "Security/Register", RegisterResultViewModel(), formData);
      return model; //dönen register model olmalı

    } catch (e) {
      throw e;
    }
  }

  Future<Null> reSendRegisterCode(int ID) async {
    //Türü belirlecek
    /*BaseResult model = await BaseService.instance!.dioPost<RegisterModel>(
        "Security/Register", RegisterModel(), registerModel);*/ //resend api ID ile Confirm test edilecek birde
    return null;
  }

  Future<BaseResult> confirmeRegisterCode(
      VerifyPhoneNumberModelModel verifyModel) async {
    try {
      var formData = FormData.fromMap(verifyModel.toMap());
      BaseResult model = await BaseService.instance!.dioPost<LoginResultModel>(
          "Security/VerifyPhoneNumberRegister", LoginResultModel(), formData);
      return model;
    } catch (e) {
      throw e;
    }
  }

  Future<BaseResult> login(LoginModel loginModel) async {
    try {
      var formData = FormData.fromMap(loginModel.toMap());
      BaseResult model = await BaseService.instance!.dioPost<LoginResultModel>(
          "Security/Login", LoginResultModel(), formData);
      return model;
    } catch (e) {
      throw e;
    }
  }
}
