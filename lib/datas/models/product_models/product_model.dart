import 'package:caffe_store_app/datas/models/base_models/base_service_model.dart';

class ProductModel extends BaseServiceModel {
  int? id;
  String? name;
  String? desc;
  double? price;

  ProductModel({this.id, this.name, this.desc, this.price});

  @override
  fromMap(Map<String, dynamic> map) => ProductModel(
        id: map["id"],
        name: map["name"],
        desc: map["desc"],
        price: map["price"],
      );

  @override
  Map<String, dynamic> toMap() => {
        "id": id,
        "name": name,
        "desc": desc,
        "price": price,
      };
}
