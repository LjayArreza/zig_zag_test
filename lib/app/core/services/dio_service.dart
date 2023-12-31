// ignore_for_file: non_constant_identifier_names, depend_on_referenced_packages, deprecated_member_use

import 'package:dio/dio.dart';
import 'package:logger/logger.dart';
import 'package:zig_zag_test/app/core/environment/environment.dart';
import 'package:zig_zag_test/app/core/services/api/api_method.dart';

class DioHttpService {
  Dio? _dio;
  final logger = Logger();

  var defaultHeader = {"Content-Type": "application/json"};
  var defaultOptions = {
    "followRedirects": false,
    "validateStatus": (status) {
      return status < 500;
    }
  };

  static final BASE_URL = Environment.apiUrl;

  Future<DioHttpService> init() async {
    _dio = Dio(BaseOptions(
        baseUrl: BASE_URL,
        connectTimeout: const Duration(milliseconds: 15000),
        receiveTimeout: const Duration(milliseconds: 15000),
        responseType: ResponseType.json));
    initInterceptors();
    return this;
  }

  void initInterceptors() {
    _dio!.interceptors.add(
      InterceptorsWrapper(
        onRequest: (requestOptions, handler) {
          logger.i("""
  REQUEST: ${requestOptions.method}
  URL: "${requestOptions.baseUrl + requestOptions.path}"
  HEADERS: ${requestOptions.headers}
  POST DATA: ${requestOptions.data}
  REQUEST PARAMS: ${requestOptions.queryParameters}              
  """);
          return handler.next(requestOptions);
        },
        onResponse: (response, handler) {
          logger.i("""
RESPONSE[${response.statusCode}]
DATA: ${response.data}
""");
          return handler.next(response);
        },
        onError: (err, handler) {
          logger.e("""
ERROR[${err.response?.statusCode}] 
DATA : ${err.response}
""");
          return handler.next(err);
        },
      ),
    );
  }

  Future<Response> request(
      {required String url,
      required ApiMethod method,
      Map<String, dynamic>? params,
      Map<String, dynamic>? requestHeaders}) async {
    Response response;

    try {
      if (method == ApiMethod.POST) {
        response = await _dio!.post(url,
            data: params,
            options: Options(
                followRedirects: false,
                validateStatus: (status) {
                  return status! < 500;
                },
                headers: {...defaultHeader, ...?requestHeaders}));
      } else if (method == ApiMethod.DELETE) {
        response = await _dio!.delete(url,
            options: Options(
                followRedirects: false,
                validateStatus: (status) {
                  return status! < 500;
                },
                headers: {...defaultHeader, ...?requestHeaders}));
      } else if (method == ApiMethod.PATCH) {
        response = await _dio!.patch(url,
            options: Options(
                followRedirects: false,
                validateStatus: (status) {
                  return status! < 500;
                },
                headers: {...defaultHeader, ...?requestHeaders}));
      } else if (method == ApiMethod.PUT) {
        response = await _dio!.put(url,
            data: params,
            options: Options(
                followRedirects: false,
                validateStatus: (status) {
                  return status! < 500;
                },
                headers: {...defaultHeader, ...?requestHeaders}));
      } else {
        response = await _dio!.get(url,
            queryParameters: params,
            options: Options(
                followRedirects: false,
                validateStatus: (status) {
                  return status! < 500;
                },
                headers: {...defaultHeader, ...?requestHeaders}));
      }

      return response;
    } on DioError catch (e) {
      throw BadRequestException(e.requestOptions);
    } catch (e) {
      logger.e(e);
      throw Exception('Something went wrong');
    }
  }
}

class BadRequestException extends DioError {
  BadRequestException(RequestOptions r) : super(requestOptions: r);

  @override
  String toString() {
    return 'Invalid request';
  }
}
