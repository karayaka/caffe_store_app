import 'package:caffe_store_app/datas/models/base_models/base_service_model.dart';

class LoginModel extends BaseServiceModel {
  String? userName;
  String? password;

  LoginModel({
    this.userName,
    this.password,
  });

  @override
  fromMap(Map<String, dynamic> map) => LoginModel(
        password: map["password"],
        userName: map["userName"],
      );

  @override
  Map<String, dynamic> toMap() => {"password": password, "userName": userName};
}
