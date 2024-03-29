import 'dart:io';
import 'package:caffe_store_app/app_tools/tools.dart';
import 'package:caffe_store_app/datas/models/base_models/base_result.dart';
import 'package:caffe_store_app/datas/models/base_models/base_service_model.dart';
import 'package:caffe_store_app/enums/result_status.dart';
import 'package:dio/adapter.dart';
import 'package:dio/dio.dart';
import 'package:get/get_connect/http/src/status/http_status.dart';

class BaseService {
  static BaseService? _instance;
  static BaseService? get instance {

    _instance ??= BaseService._init();
    return _instance;
  }

  Dio? _dio;
  BaseService._init() {
    final baseOptions = BaseOptions(
      baseUrl: Tools.baseUrl + "/service/api/",
      //baseUrl: Tools.baseUrl + "/api/", //local service
    );
    _dio = Dio(baseOptions);
  }

  Future<BaseResult> dioPost<T extends BaseServiceModel>(
      String path, T model, dynamic data,
      {String? token}) async {
    (_dio?.httpClientAdapter as DefaultHttpClientAdapter).onHttpClientCreate =
        (HttpClient client) {
      client.badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
      return client;
    };
    try {
      final response = await _dio?.post(
        path,
        data: data,
        options: Options(
          headers: {
            "Authorization": "Bearer  ${token}",
          },
        ),
      );
      return _prePareResult<T>(response, model);
    } catch (e) {
      throw e;
    }
  }

  Future<BaseResult> dioGet<T extends BaseServiceModel>(String path, T model,
      {Map<String, dynamic>? params, String token = ""}) async {
    (_dio?.httpClientAdapter as DefaultHttpClientAdapter).onHttpClientCreate =
        (HttpClient client) {
      client.badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
      return client;
    };
    try {
      final response = await _dio?.get(
        path,
        queryParameters: params,
        options: Options(
          headers: {
            "Authorization": "Bearer  ${token}",
          },
        ),
      );

      return _prePareResult<T>(response, model);
    } catch (e) {
      throw e;
    }
  }

  ///bağlantı sırasında oluşabilcek hatalar için resultlar
  BaseResult _prePareResult<T extends BaseServiceModel>(
      Response? response, T model) {
    var result = BaseResult();
    try {
      if (response == null) {
        result.message = "Bağlantı Hatası";
        result.type = ResultStatus.danger;
        return result;
      } else {
        switch (response.statusCode) {
          case HttpStatus.unauthorized:
            result.message = "Oturum Açma Hatası";
            result.type = ResultStatus.unauthorized;
            return result;
          case HttpStatus.notFound:
            result.message = "Bağlantı Bulunamadı";
            result.type = ResultStatus.danger;
            return result;
          case HttpStatus.ok:
            return _prePareTypeData<T>(response, model);
          default:
            {
              result.message = "Hata Oluştu";
              result.type = ResultStatus.danger;
              return result;
            }
        }
      }
    } on DioError catch (ex) {
      if (ex.response?.statusCode == 401) {
        result.message = "Oturumunuzun Süresi Dolmuştur";
        result.type = ResultStatus.unauthorized;
        return result;
      } else {
        result.message = "Hata Oluştu";
        result.type = ResultStatus.danger;
        return result;
      }
    } catch (e) {
      throw e;
    }
  }

  ///api tarafında oluşabilecek hatalar için resultlar
  _prePareTypeData<T extends BaseServiceModel>(Response response, T model) {
    var result = BaseResult();
    var data = response.data;
    result.message = data["message"].toString();
    result.pageCount = data["pageCount"];
    result.pageSize = data["pageSize"];

    ///data time respunse zamanı alınacak
    result.type = _prepareReultType<T>(data);
    var body = data["data"];
    if (body != null && body != -1 && body != 1) {
      //boş data kısmı atlanacak
      result.data = _prePareData<T>(body, model);
    }
    return result;
  }

  ///apiden gelen cevapa ait durumlar işleniyor!
  _prepareReultType<T>(data) {
    int intType = data["type"];
    if (intType == 2) {
      return ResultStatus.succes;
    } else if (intType == 1) {
      return ResultStatus.warning;
    } else {
      return ResultStatus.danger;
    }
  }

  ///apinin data propertisi içerisinde ki data inceleniyor
  _prePareData<T extends BaseServiceModel>(body, T model) {
    if (body is List) {
      return body.map((e) => model.fromMap(e)).cast<T>().toList();
    } else {
      T fechData = model.fromMap(body);
      return fechData;
    }
  }
}
