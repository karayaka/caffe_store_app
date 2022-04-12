import 'package:caffe_store_app/datas/models/base_models/base_service_model.dart';

class RegisterResultViewModel extends BaseServiceModel {
  int? id;
  String? confirmeCode;
  String? phoneNumber;
  String? password;
  RegisterResultViewModel(
      {this.id, this.confirmeCode, this.password, this.phoneNumber});

  @override
  fromMap(Map<String, dynamic> map) => RegisterResultViewModel(
        confirmeCode: map["confirmeCode"],
        id: map["id"],
        password: map["password"],
        phoneNumber: map["phoneNumber"],
      );

  @override
  Map<String, dynamic> toMap() => {
        "id": id,
        "confirmeCode": confirmeCode,
        "phoneNumber": phoneNumber,
        "password": password,
      };
}
