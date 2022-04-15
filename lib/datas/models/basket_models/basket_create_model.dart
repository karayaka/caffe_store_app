import 'package:caffe_store_app/datas/models/base_models/base_service_model.dart';
import 'package:caffe_store_app/datas/models/basket_models/basket_detail_model.dart';

class BasketCreateModel extends BaseServiceModel {
  int? id;
  int? productID;
  int? quantity;
  List<BasketDetailModel>? basketDetails;

  BasketCreateModel({
    this.id,
    this.productID,
    this.quantity,
    this.basketDetails,
  });

  @override
  fromMap(Map<String, dynamic> map) {
    var model = BasketCreateModel(
      id: map["id"],
      productID: map["productID"],
      quantity: map["quantity"],
    );
    if (map["basketDetails"] != null) {
      List<BasketDetailModel> details = [];
      for (var item in map["basketDetails"]) {
        details.add(BasketDetailModel().fromMap(item));
      }
      model.basketDetails = details;
    }
    return model;
  }

  @override
  Map<String, dynamic> toMap() => {
        "id": id,
        "productID": productID,
        "quantity": quantity,
        "basketDetails": basketDetails?.map((e) => e.toMap()).toList(),
      };
}
