import 'package:caffe_store_app/enums/result_status.dart';
import 'package:caffe_store_app/enums/screan_state.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BaseController extends GetxController {
  var state = ScreanState.loaded.obs;

  int pageCount = 0;
  int pageSize = 0;
  ResultStatus resultStatus = ResultStatus.danger;

  bool isLoaded(Rx<ScreanState> state) {
    return state.value == ScreanState.loaded;
  }

  showSeviceAlert(ResultStatus type, String message) {
    print(message);
    switch (type) {
      case ResultStatus.succes:
        if (message.isNotEmpty) {
          succesMessage(message);
        }
        break;
      case ResultStatus.warning:
        warningMessage(message);
        break;
      case ResultStatus.danger:
        errorMessage(message);
        break;
      case ResultStatus.unauthorized: //buraya login route yapılabilir
        errorMessage("Servis Bağlatısı Yapılamadı");

        break;
    }
  }

  showConfirmeDialog(void Function()? onConfirme,
      {String title = "", String message = "", String confirmeText = "Tamam"}) {
    Get.defaultDialog(
        title: title,
        content: Text(message),
        onConfirm: onConfirme,
        textCancel: "İptal",
        textConfirm: confirmeText,
        confirmTextColor: Colors.white);
  }

  succesMessage(String message) {
    Get.snackbar(
      "Başarılı",
      message,
      colorText: Colors.white,
      backgroundColor: Colors.green,
    );
  }

  errorMessage(String message) {
    Get.snackbar(
      "Hata",
      message,
      colorText: Colors.white,
      backgroundColor: Colors.orange.shade600,
    );
  }

  warningMessage(String message) {
    Get.snackbar(
      "Uyarı",
      message,
      colorText: Colors.white,
      backgroundColor: Colors.red,
    );
  }

  I? prepareServiceModel<I>(dynamic model) {
    pageCount = model.pageCount;
    resultStatus = model.type;
    pageSize = model.pageSize; //model ve data test edilecek!!
    if (model.message != "null") {
      showSeviceAlert(model.type, model.message);
    }
    if (model.data != null) {
      return model.data;
    }
  }
}
