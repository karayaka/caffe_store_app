import 'dart:convert';

import 'package:caffe_store_app/datas/models/base_models/base_service_model.dart';
import 'package:caffe_store_app/datas/models/product_models/product_question_model.dart';

class ProductDetailModel extends BaseServiceModel {
  int? id;
  String? image;
  String? name;
  String? desc;
  double? price;
  List<ProductQuestionModel>? questions;

  ProductDetailModel(
      {this.id, this.desc, this.image, this.name, this.price, this.questions});

  @override
  fromMap(Map<String, dynamic> map) {
    List<ProductQuestionModel> qstons = [];
    var prduct = ProductDetailModel(
      desc: map["desc"],
      id: map["id"],
      image: map["image"],
      name: map["name"],
      price: map["price"],
    );
    if (map["questions"] != null) {
      for (var item in map["questions"]) {
        qstons.add(ProductQuestionModel().fromMap(item));
      }
      prduct.questions = qstons;
    }
    return prduct;
  }

  @override
  Map<String, dynamic> toMap() => {
        "id": id,
        "desc": desc,
        "image": image,
        "price": price,
        //"questions": questions?.map((e) => e.toMap()),
      };
}
