import 'package:dio/dio.dart';
import 'package:g_json/g_json.dart';

class APIError implements Exception {
  int? statusCode;
  String? detail;

  APIError({
    this.statusCode,
    this.detail,
  });

  factory APIError.fromDiorError(DioError error) {
    if (error.response == null && error.error is String) {
      return APIError(
          statusCode: error.response?.statusCode ?? -1, detail: error.error);
    }
    final json = JSON(error.response?.data);
    //final type = json["detail"].rawJSONType;

    final detail = json["detail"].stringValue.isNotEmpty
        ? json["detail"].stringValue
        : json["error"].stringValue;
/*    if (type == Type.list) {
      message = json["message"].listObject.map((e) => e.toString()).toList().toString();
    } else if ( == Type.string) {

    }*/
    return APIError(
        statusCode: error.response?.statusCode ?? -1, detail: detail);
  }

  Map<String, dynamic> toJson() {
    return {
      "statusCode": statusCode,
      "message": detail,
    };
  }
}
