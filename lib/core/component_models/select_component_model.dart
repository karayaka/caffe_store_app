import 'package:caffe_store_app/datas/models/base_models/base_service_model.dart';

class SelectComponentModel extends BaseServiceModel {
  int? id;
  String? value;
  String? text;

  SelectComponentModel({this.id, this.text, this.value});

  @override
  fromMap(Map<String, dynamic> map) => SelectComponentModel(
        id: map["id"],
        text: map["text"],
        value: map["value"],
      );

  @override
  Map<String, dynamic> toMap() => {"id": id, "text": text, "value": value};

  @override
  String toString() => text ?? "";

  bool isEqual(SelectComponentModel model) {
    return id == model.id;
  }

  String userAsString() {
    return '#${id} ${text}';
  }

  fakeDate() {
    return [
      SelectComponentModel(id: 1, value: "1", text: "Deneme1"),
      SelectComponentModel(id: 2, value: "2", text: "Deneme2"),
      SelectComponentModel(id: 3, value: "3", text: "Deneme3"),
      SelectComponentModel(id: 4, value: "4", text: "Deneme4"),
    ];
  }
}
