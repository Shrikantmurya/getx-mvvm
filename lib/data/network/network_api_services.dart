import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../res/routes/routes_name.dart';
import '/data/network/base_api_services.dart';
import 'package:http/http.dart' as http;

import '../app_exceptions.dart';

class NetworkApiServices extends BaseApiServices {
  @override
  Future<dynamic> getApi(String url) async {
    if (kDebugMode) {
      print(url);
    }

    dynamic responseJson;
    try {
// {'company': prefs.getString('company'), 'usertype':  prefs.getString('usertype')}
      final SharedPreferences prefs = await SharedPreferences.getInstance();

      final response = await http.get(
        Uri.parse(url),
        headers: {
          'Accept': 'application/json',
          'token': prefs.getString('token') ?? '',
          'company': prefs.getString('company') ?? '',
          'usertype': prefs.getString('usertype') ?? '',
        },
      ).timeout(const Duration(seconds: 120));
      responseJson = returnResponse(response);
    } on SocketException {
      throw InternetException('');
    } on RequestTimeOut {
      throw RequestTimeOut('');
    }
    return responseJson;
  }

  @override
  Future<dynamic> postApiwithoutToken(var data, String url) async {
    if (kDebugMode) {
      print(url);
      print(data);
    }

    dynamic responseJson;
    try {
      final response = await http
          .post(Uri.parse(url),
              headers: {
                'Accept': 'application/json',
                'Content-Type': 'application/json'
              },
              body: data)
              
          .timeout(const Duration(seconds: 120));

      responseJson = returnResponse(response);
    } on SocketException {
      throw InternetException('');
    } on RequestTimeOut {
      throw RequestTimeOut('');
    }
    if (kDebugMode) {
      print(responseJson);
    }
    return responseJson;
  }

  @override
  Future<dynamic> postApi(var data, String url) async {
    if (kDebugMode) {
      print(url);
      print(data);
    }

    dynamic responseJson;
    try {
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      if (kDebugMode) {
        print(prefs.getString('token') ?? '');
      }

      final response = await http.post(Uri.parse(url),
          headers: {
            'Accept': 'application/json',
            'token': prefs.getString('token') ?? '',
            'company': prefs.getString('company') ?? '',
            'usertype': prefs.getString('usertype') ?? '',
          },
          body: data);
      responseJson = returnResponse(response);
    } on SocketException {
      throw InternetException('');
    } on RequestTimeOut {
      throw RequestTimeOut('');
    }
    if (kDebugMode) {
      print(responseJson);
    }
    return responseJson;
  }

  @override
  Future<dynamic> postAttachementApi(var data, String url) async {
    if (kDebugMode) {
      print(url);
      print(data);
    }

    dynamic responseJson;
    try {
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      if (kDebugMode) {
        print(prefs.getString('token') ?? '');
      }

      //final response = await http.post(Uri.parse(url),
      final request = await http.MultipartRequest('POST', Uri.parse(url));
      request.headers.addAll({
        'Accept': 'application/json',
        'token': prefs.getString('token') ?? '',
        'company': prefs.getString('company') ?? '',
        'usertype': prefs.getString('usertype') ?? '',
      });

      // save field in object
      data.entries.forEach((entry) async {
        if (entry.value is List) {
          if (entry.value[0] == "attach") {
            request.files.add(await http.MultipartFile.fromPath(
                entry.key, entry.value[2],
                filename: '${entry.value[1]}${entry.value[3]}',
                ));
          //  request.fields['${entry.key}_name'] = entry.value[1];
          } else {
            request.fields[entry.key] = entry.value[1].toString();
          }
        }
      });
       
       responseJson = returnResponseAttachement(await request.send());
    } on SocketException {
      throw InternetException('');
    } on RequestTimeOut {
      throw RequestTimeOut('');
    }
    if (kDebugMode) {
      print(responseJson);
    }
    return responseJson;
  }

  @override
  Future<dynamic> putApi(var data, String url) async {
    if (kDebugMode) {
      print(url);
      print(data);
    }

    dynamic responseJson;
    try {
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      if (kDebugMode) {
        print(prefs.getString('token') ?? '');
      }
      final response = await http
          .put(Uri.parse(url),
              headers: {
                'Accept': 'application/json',
                'token': prefs.getString('token') ?? '',
                'company': prefs.getString('company') ?? '',
                'usertype': prefs.getString('usertype') ?? '',
              },
              body: data)
          .timeout(const Duration(seconds: 120));
      responseJson = returnResponse(response);
    } on SocketException {
      throw InternetException('');
    } on RequestTimeOut {
      throw RequestTimeOut('');
    }
    if (kDebugMode) {
      print(responseJson);
    }
    return responseJson;
  }

  @override
  Future<dynamic> deletetApi(var data, String url) async {
    if (kDebugMode) {
      print(url);
      print(data);
    }

    dynamic responseJson;
    try {
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      if (kDebugMode) {
        print(prefs.getString('token') ?? '');
      }
      final response = await http
          .delete(Uri.parse(url),
              headers: {
                'Accept': 'application/json',
                'token': prefs.getString('token') ?? '',
                'company': prefs.getString('company') ?? '',
                'usertype': prefs.getString('usertype') ?? '',
              },
              body: data)
          .timeout(const Duration(seconds: 120));
      responseJson = returnResponse(response);
    } on SocketException {
      throw InternetException('');
    } on RequestTimeOut {
      throw RequestTimeOut('');
    }
    if (kDebugMode) {
      print(responseJson);
    }
    return responseJson;
  }

  dynamic returnResponse(http.Response response) {
    if (kDebugMode) {
      print(response.statusCode);
       print(response. body);
    }
    switch (response.statusCode) {
      case 200:
        dynamic responseJson = jsonDecode(response.body);
        return responseJson;
      case 400:
        dynamic responseJson = jsonDecode(response.body);
        return responseJson;
      case 401:
        Timer(const Duration(seconds: 3),
            () => Get.toNamed(RouteName.welcomeView));
      default:
        throw FetchDataException(
            'Error accoured while communicating with server ' +
                response.statusCode.toString());
    }
  }

  dynamic returnResponseAttachement(response) async {
    var responseBytes = await response.stream.bytesToString();
    if (kDebugMode) {
      print('file response ${responseBytes}');
    }
    // Convert the response bytes to a string
    switch (response.statusCode) {
      case 200:
        dynamic responseJson =jsonDecode(responseBytes);
        return responseJson;
      case 400:
        dynamic responseJson = jsonDecode(responseBytes);
        return responseJson;
      case 401:
        Timer(const Duration(seconds: 3),
            () => Get.toNamed(RouteName.welcomeView));
      case 500:
        dynamic responseJson = jsonDecode(responseBytes);
        return responseJson;
      default:
        throw FetchDataException(
            'Error accoured while communicating with server ' +
                response.statusCode.toString());
    }
  }
}
