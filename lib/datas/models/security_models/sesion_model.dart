import 'package:caffe_store_app/datas/models/base_models/base_service_model.dart';

class SesionModel extends BaseServiceModel {
  int? id;
  String? phoneNumber;
  String? password;

  SesionModel({this.id, this.password, this.phoneNumber});

  @override
  fromMap(Map<String, dynamic> map) => SesionModel(
        id: map["id"],
        password: map["password"],
        phoneNumber: map["phoneNumber"],
      );

  @override
  Map<String, dynamic> toMap() =>
      {"id": id, "password": password, "phoneNumber": phoneNumber};
}
