import 'package:caffe_store_app/core/component_models/select_component_model.dart';

class Tools {
  //static const String baseUrl = "https://apptest.cagnaz.com";
  //static const String baseUrl = "https://192.168.1.10:45457";
  static const String baseUrl = "https://panel.straborn.com";

  static List<SelectComponentModel> orderStatuses = [
    SelectComponentModel(id: -1, value: "-1", text: "Tümü"),
    SelectComponentModel(id: 0, value: "0", text: "Bekliyor"),
    SelectComponentModel(id: 1, value: "1", text: "Hazırlanıyor"),
    SelectComponentModel(id: 2, value: "2", text: "Hazır"),
    SelectComponentModel(id: 3, value: "3", text: "Teslim Edildi"),
  ];
}
