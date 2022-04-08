import 'package:caffe_store_app/datas/models/base_models/base_service_model.dart';

class ProductReplayModel extends BaseServiceModel {
  int? id;
  String? replyDesc;
  double? extraCost;
  bool? hasExtraCost;

  ProductReplayModel(
      {this.id, this.extraCost, this.hasExtraCost, this.replyDesc});

  @override
  fromMap(Map<String, dynamic> map) => ProductReplayModel(
      id: map["id"],
      extraCost: map["extraCost"],
      hasExtraCost: map["hasExtraCost"],
      replyDesc: map["replyDesc"]);

  @override
  Map<String, dynamic> toMap() => {
        "id": id,
        "replyDesc": replyDesc,
        "extraCost": extraCost,
        "hasExtraCost": hasExtraCost
      };
}
