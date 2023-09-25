import 'dart:convert';
import 'dart:developer';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

abstract class ApiServices {
  static const _baseUrl = 'http://taskflutter.futurecode-projects.com/api';

  static Future<dynamic> get({
    required String endPoint,
    @required String? token,
  }) async {
    Map<String, String> headers = {};
    if (token != null) {
      headers.addAll({'Authorization': 'Bearer $token'});
    }
    http.Response response =
        await http.get(Uri.parse('$_baseUrl$endPoint'), headers: headers);

    if (response.statusCode == 200) {
      Map<String, dynamic> data = jsonDecode(response.body);
      log('HTTP GET Data: $data');
      return data;
    } else {
      throw Exception(
        'there is an error with status code ${response.statusCode} and with body : ${response.body}',
      );
    }
  }

  static Future<dynamic> post({
    required String endPoint,
    required Map<String, dynamic> body,
    String? token,
  }) async {
    Map<String, String> headers = {};
    if (token != null) {
      headers.addAll({'Authorization': 'Bearer $token'});
    }
    http.Response response = await http.post(Uri.parse('$_baseUrl$endPoint'),
        body: body, headers: headers);

    if (response.statusCode == 200) {
      Map<String, dynamic> data = jsonDecode(response.body);
      log('HTTP POST Data: $data');
      return data;
    } else {
      // throw Exception(
      //   'there is an error with status code ${response.statusCode} and with body : ${response.body}',
      // );
      throw Exception(
        response.body,
      );
    }
  }

  static Future<dynamic> put({
    required String endPoint,
    @required dynamic body,
    @required String? token,
  }) async {
    Map<String, String> headers = {};
    headers.addAll({'Content-Type': 'application/x-www-form-urlencoded'});
    if (token != null) {
      headers.addAll({'Authorization': 'Bearer $token'});
    }
    http.Response response = await http.put(Uri.parse('$_baseUrl$endPoint'),
        body: body, headers: headers);

    if (response.statusCode == 200) {
      Map<String, dynamic> data = jsonDecode(response.body);
      log('HTTP PUT Data: $data');
      return data;
    } else {
      throw Exception(
        'there is an error with status code ${response.statusCode} and with body : ${response.body}',
      );
    }
  }

  static Future<dynamic> delete({
    required String endPoint,
    @required dynamic body,
    @required String? token,
  }) async {
    Map<String, String> headers = {};
    headers.addAll({'Content-Type': 'application/x-www-form-urlencoded'});
    if (token != null) {
      headers.addAll({'Authorization': 'Bearer $token'});
    }
    http.Response response = await http.delete(Uri.parse('$_baseUrl$endPoint'),
        body: body, headers: headers);

    if (response.statusCode == 200) {
      Map<String, dynamic> data = jsonDecode(response.body);
      log('HTTP DELETE Data: $data');
      return data;
    } else {
      throw Exception(
        'there is an error with status code ${response.statusCode} and with body : ${response.body}',
      );
    }
  }

  static Future<dynamic> postWithImage({
    required String endPoint,
    required Map<String, String> body,
    @required String? imagePath,
    String? token,
  }) async {
    var request = http.MultipartRequest(
      'POST',
      Uri.parse('$_baseUrl$endPoint'),
    );
    request.fields.addAll(body);
    if (imagePath != null) {
      request.files.add(await http.MultipartFile.fromPath('image', imagePath));
    }
    request.headers.addAll(
      {
        'Accept': 'application/json',
        if (token != null) 'Authorization': 'Bearer $token',
      },
    );
    http.StreamedResponse response = await request.send();

    http.Response r = await http.Response.fromStream(response);

    if (r.statusCode == 200) {
      Map<String, dynamic> data = jsonDecode(r.body);
      log('HTTP POSTIMAGE Data: $data');
      return data;
    } else {
      throw Exception(
        r.body,
      );
    }
  }

  static Future<dynamic> postWithImages({
    required String endPoint,
    required Map<String, String> body,
    required Map<String, String> imagesPath,
    String? token,
  }) async {
    var request = http.MultipartRequest(
      'POST',
      Uri.parse('$_baseUrl$endPoint'),
    );
    request.fields.addAll(body);
    imagesPath.forEach((key, value) async {
      request.files.add(await http.MultipartFile.fromPath(key, value));
    });
    request.headers.addAll(
      {
        'Accept': 'application/json',
        if (token != null) 'Authorization': 'Bearer $token',
      },
    );
    http.StreamedResponse response = await request.send();

    http.Response r = await http.Response.fromStream(response);

    if (r.statusCode == 200) {
      Map<String, dynamic> data = jsonDecode(r.body);
      log('HTTP POSTIMAGE Data: $data');
      return data;
    } else {
      throw Exception(
        r.body,
      );
    }
  }
}
