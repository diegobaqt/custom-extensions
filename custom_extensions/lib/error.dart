library custom_extensions;

import 'package:custom_extensions/models/api_error.dart';
import 'package:dio/dio.dart';

extension NetworkError on DioError {
  APIError parseError() => APIError.fromDiorError(this);
}
