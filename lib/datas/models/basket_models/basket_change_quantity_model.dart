import 'package:caffe_store_app/core/components/timer_button_component.dart';
import 'package:caffe_store_app/datas/models/base_models/base_service_model.dart';

class BasketChangeQuantityModel extends BaseServiceModel {
  int? id;
  int? quantity;
  double? basketTotal;

  BasketChangeQuantityModel({this.quantity, this.basketTotal, this.id});

  @override
  fromMap(Map<String, dynamic> map) => BasketChangeQuantityModel(
        quantity: map["quantity"],
        basketTotal: map["basketTotal"],
        id: map["id"],
      );

  @override
  Map<String, dynamic> toMap() => {
        "basketTotal": basketTotal,
        "quantity": quantity,
        "id": id,
      };
}
