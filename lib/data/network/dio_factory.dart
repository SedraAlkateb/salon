// ignore_for_file: deprecated_member_use, prefer_interpolation_to_compose_strings, prefer_const_constructors, constant_identifier_names

import 'dart:io';

import 'package:dio/dio.dart';
import 'package:dio/io.dart';
import 'package:salon/app/app_preferences.dart';
import 'package:salon/app/constants.dart';
import 'package:salon/app/di.dart';
import 'package:salon/data/network/error_handler.dart';
import 'package:flutter/foundation.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';


const String APPLICATION_JSON="application/json";

const String MULTIPART="multipart/form-data";
const String CONTENT_TYPE="contentType";
const String ACCEPT="accept";
const String AUTHORIZATION="authorization";
const String DEFAULT_LANGUAGE="lang";

class DioFactory{
  final AppPreferences _appPreferences;
  DioFactory(this._appPreferences);

  Future<Dio> getDio() async {
    Dio dio= Dio();
    (dio.httpClientAdapter as DefaultHttpClientAdapter).onHttpClientCreate =
        (HttpClient client) {
      client.badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
      return client;
    };
    String  to=await _appPreferences.getToken()??"";
    String token ="Bearer " + to;
    String language ="en";

    Map<String,String> headers={
      CONTENT_TYPE:MULTIPART,
      ACCEPT:APPLICATION_JSON,
      "X-Requested-With":"XMLHttpRequest",
      AUTHORIZATION:token,
      DEFAULT_LANGUAGE:language,
      "Access-Control-Allow-Headers": "*",
      "Access-Control-Allow-Methods": "POST, GET, OPTIONS, PUT, DELETE, HEAD",

    };
    dio.options=BaseOptions(
        baseUrl: Constants.baseUrl,
        headers: headers,
        receiveTimeout: Duration(seconds: Constants.apiTimeOut),
        sendTimeout: Duration(seconds: Constants.apiTimeOut),
    );
    dio.interceptors.add( MyApiInterceptor());
    if(!kReleaseMode){
      //its debuge  mode so print app logs
      dio.interceptors.add(PrettyDioLogger(
        requestHeader : true,
        requestBody : true,
        responseHeader : true,
      ));

    }
    return dio;
  }
}

class MyApiInterceptor extends Interceptor {
  final AppPreferences _appPreferences =instance<AppPreferences>();
  @override
  Future<void> onRequest(
      RequestOptions options,
      RequestInterceptorHandler handler,
      ) async {
    // Add the token to the request headers

    String? authToken =await _appPreferences.getToken();
    String lang ="en";

    if (authToken != null) {
      options.headers['Authorization'] ="Bearer ${authToken}" ;
      options.headers['lang'] =lang;

      print(authToken);
    }
    return handler.next(options);
  }
  @override
  void onError(DioError err, ErrorInterceptorHandler handler) async {
    debugPrint(
        'ERROR[${err.response?.statusCode}] => PATH: ${err.requestOptions.path}');
    if (err.response?.statusCode ==ResponseCode.UNAUTORISED ) {
      // UserModel? authenticatedUser =
      //     await authLocalDataSource.getSavedLoginCredentials();
      // if (authenticatedUser != null) {
      // if (await _refreshToken(
      //   authenticatedUser,
      // )) {
      //   return handler.resolve(await _retry(err.requestOptions));
      // }
      // }
    }
    super.onError(err, handler);
  }
  //TODO
  final Dio client =Dio();

  Future<Response<dynamic>> _retry(RequestOptions requestOptions) async {
    final options = Options(
      method: requestOptions.method,
      headers: requestOptions.headers,
    );
    return
      client.request<dynamic>(requestOptions.path,
        data: requestOptions.data,
        queryParameters: requestOptions.queryParameters,
        options: options);
  }

// Future<bool> _refreshToken(UserModel authenticatedUser) async {
// final response = await client.post(EndPoints.refreshToken, data: {
//   AppStrings.token: authenticatedUser.token,
//   AppStrings.refreshToken: authenticatedUser.refreshToken,
// });
// final jsonResponse = Commons.decodeJson(response);
// BaseResponseModel baseResponse = BaseResponseModel.fromJson(jsonResponse);
// if (baseResponse.isSuccess!) {
//   authenticatedUser.token = baseResponse.data["token"];
//   authenticatedUser.refreshToken = baseResponse.data["refreshToken"];
//   authLocalDataSource.saveLoginCredentials(userModel: authenticatedUser);
//   return true;
// } else {
//   return false;
// }
// }
}