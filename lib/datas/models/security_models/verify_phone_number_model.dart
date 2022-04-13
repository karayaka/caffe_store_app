import 'package:caffe_store_app/datas/models/base_models/base_service_model.dart';

class VerifyPhoneNumberModelModel extends BaseServiceModel {
  int? id;
  String? phoneNumber;
  String? verificationCode;

  VerifyPhoneNumberModelModel(
      {this.id, this.phoneNumber = "", this.verificationCode});

  @override
  fromMap(Map<String, dynamic> map) => VerifyPhoneNumberModelModel(
        id: map["id"],
        phoneNumber: map["phoneNumber"],
        verificationCode: map["verificationCode"],
      );

  @override
  Map<String, dynamic> toMap() => {
        "id": id,
        "phoneNumber": phoneNumber,
        "verificationCode": verificationCode,
      };
}
