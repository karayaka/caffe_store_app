import 'package:caffe_store_app/datas/models/base_models/base_service_model.dart';

class RegisterModel extends BaseServiceModel {
  int? id;
  String? email;
  String? name;
  String? phoneNumber;
  int? userStatus;
  String? surname;
  String? userName;
  String? password;

  RegisterModel({
    this.id,
    this.email,
    this.name,
    this.password,
    this.phoneNumber,
    this.surname,
    this.userName,
    this.userStatus,
  });

  @override
  fromMap(Map<String, dynamic> map) => RegisterModel(
        email: map["email"],
        id: map["id"],
        name: map["name"],
        password: map["password"],
        phoneNumber: map["phoneNumber"],
        surname: map["surname"],
        userName: map["userName"],
        userStatus: map["userStatus"],
      );

  @override
  Map<String, dynamic> toMap() => {
        "id": id,
        "email": email,
        "name": name,
        "password": password,
        "phoneNumber": phoneNumber,
        "surname": surname,
        "userName": userName,
        "userStatus": userStatus,
      };
}
