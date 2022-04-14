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

  Future<BaseResult> reSendSMSCode(int id) async {
    try {
      BaseResult model = await BaseService.instance!
          .dioGet<RegisterResultViewModel>(
              "Security/ResendSMSCode/${id}", RegisterResultViewModel());
      return model;
    } catch (e) {
      throw e;
    }
  }

  Future<BaseResult> resetPassword(String phoneNumber) async {
    try {
      BaseResult model = await BaseService.instance!
          .dioGet<RegisterResultViewModel>(
              "Security/ResetPassword/${phoneNumber}",
              RegisterResultViewModel());
      return model;
    } catch (e) {
      throw e;
    }
  }

  Future<BaseResult> resetPasswordConfirme(
      RegisterResultViewModel model) async {
    try {
      var formData = FormData.fromMap(model.toMap());
      BaseResult retVal =
          await BaseService.instance!.dioPost<RegisterResultViewModel>(
        "Security/ResetPasswordConfirme",
        RegisterResultViewModel(),
        formData,
      );
      return retVal;
    } catch (e) {
      throw e;
    }
  }
}
