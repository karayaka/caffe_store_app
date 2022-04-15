import 'package:caffe_store_app/datas/models/base_models/base_service_model.dart';

class BasketListModel extends BaseServiceModel {
  int? id;
  String? image;
  String? productName;
  int? quantity;
  double? totalPrice;
  String? desc;

  BasketListModel({
    this.id,
    this.image,
    this.productName,
    this.quantity,
    this.totalPrice,
    this.desc,
  });
  @override
  fromMap(Map<String, dynamic> map) => BasketListModel(
        id: map["id"],
        image: map["image"],
        productName: map["productName"],
        quantity: map["quantity"],
        totalPrice: map["totalPrice"],
        desc: map["desc"],
      );

  @override
  Map<String, dynamic> toMap() => {
        "id": id,
        "image": image,
        "productName": productName,
        "quantity": quantity,
        "totalPrice": totalPrice,
        "desc": desc,
      };
}
