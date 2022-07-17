import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:cinepolis_admin/app/utils/msg.utils.dart';
import 'package:cinepolis_admin/app/utils/storage.utils.dart';
import 'package:cinepolis_admin/core/routes/pages.dart';
import 'package:cinepolis_admin/core/values/globals.dart';
import 'package:cinepolis_admin/data/models/core/api_exception.model.dart';
import 'package:cinepolis_admin/data/models/enums/request_method.enum.dart';
import 'package:cinepolis_admin/data/providers/api_exceptions.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class ApiProvider {//al consumirse un endpoint, esta clase se encarga de revisar que tipo es, descifra los datos y los pasa a la entidad, en caso contrario si hay una excepcion, la muestra como error etc...
  // Singleton
  ApiProvider._privateConstructor();
  static final ApiProvider _instance = ApiProvider._privateConstructor();
  static ApiProvider get instance => _instance;
  var jsonError;
  // End Singleton

  Future<dynamic> request<T>(RequestMethod method, String endPoint,
      {bool useDefaultUrl = true,
      String body = '',
      bool returnFullResponse = false}) async {
    http.Response resp;

    final Uri url = Uri.parse(endPoint);

    final Map<String, String> headers = <String, String>{};
    headers.putIfAbsent(
        HttpHeaders.contentTypeHeader, () => 'application/json');

    // Get and apply token
    var token = await LocalStorageUtils.getStringByKey(Globals.tokenKey);
    if (token.isNotEmpty) {
      headers.putIfAbsent(
          HttpHeaders.authorizationHeader, () => 'Bearer ' + token);
    }

    try {
      if (method == RequestMethod.get) {
        resp = await http.get(url, headers: headers);
      } else if (method == RequestMethod.put) {
        resp = await http.put(
          url,
          headers: headers,
          body: body,
        );
      } else if (method == RequestMethod.patch) {
        resp = await http.patch(url, headers: headers, body: body);
      } else if (method == RequestMethod.post) {
        resp = await http.post(
          url,
          headers: headers,
          body: body,
        );
      } else if (method == RequestMethod.delete) {
        resp = await http.delete(
          url,
          headers: headers,
        );
      } else {
        throw Exception('Otro error');
      }

      jsonError = resp;
      return _returnResponse(resp, returnFullResponse);
    } on TimeoutException {
      throw Exception();
    } on SocketException {
      throw Exception();
    } on Error catch (_) {
      _returnResponse(jsonError, returnFullResponse);
      throw Exception();
    }
  }

  dynamic _returnResponse(http.Response response, bool returnFullResponse) {
    switch (response.statusCode) {
      case 200:
        if (returnFullResponse) return response;
        var responseJson = json.decode(response.body.toString());
        return responseJson;
      case 201:
        var responseJson = json.decode(response.body.toString());
        return responseJson;
      case 400:
        throw BadRequestException(response.body.toString());
      case 401:throw response.body.toString();
      case 403:
        LocalStorageUtils.setStringKey(Globals.currentUserKey, '');
        Get.toNamed(Routes.login);
        throw UnauthorisedException(response.body.toString());
      case 500:
        var exception =
            ApiException.fromJson(json.decode(response.body.toString()));

        if (exception.exceptionType!.contains('AppValidationException') ||
            exception.exceptionType!.contains('AppApiException') ||
            exception.exceptionType!.contains('FormatException') ||
            exception.exceptionType!.contains('AppBadConfigurationException')) {
          SnackUtils.error(exception.exceptionMessage!, 'Advertencia');
        } else {
          SnackUtils.error('Ocurrio un error, verificalo con el administrador',
              'Error no controlado');
        }
        throw BadRequestException(response.body.toString());
      default:
        throw FetchDataException(
            'Error occured while Communication with Server with StatusCode : ${response.statusCode}');
    }
  }
}
