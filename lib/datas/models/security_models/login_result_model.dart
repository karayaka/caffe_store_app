import 'package:caffe_store_app/datas/models/base_models/base_service_model.dart';

class LoginResultModel extends BaseServiceModel {
  int? id;
  String? name;
  String? surname;
  String? token;
  String? email;

  LoginResultModel({this.email, this.id, this.name, this.surname, this.token});

  @override
  fromMap(Map<String, dynamic> map) => LoginResultModel(
        email: map["email"],
        id: map["id"],
        name: map["name"],
        surname: map["surname"],
        token: map["token"],
      );

  @override
  Map<String, dynamic> toMap() => {
        "email": email,
        "id": id,
        "name": name,
        "surname": surname,
        "token": token,
      };
}
