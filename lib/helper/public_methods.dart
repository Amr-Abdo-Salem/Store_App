import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

class GetMethods {
  Future<dynamic> getResponse({
    required String uRl,
    @required String? token,
  }) async {
    Map<String, String> header = {};
    if (token != null) {
      header.addAll({'Authorization': 'Bearer $token'});
    }
    http.Response response = await http.get(Uri.parse(uRl), headers: header);
    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception(
          'there is a problem with status code${response.statusCode}');
    }
  }

  Future<dynamic> postResponse({
    required String uRl,
    @required dynamic body,
    @required String? token,
  }) async {
    Map<String, String> header = {};
    if (token != null) {
      header.addAll({'Authorization': 'Bearer $token'});
    }
    http.Response response = await http.post(
      Uri.parse(uRl),
      body: body,
      headers: header,
    );

    if (response.statusCode == 200) {
      Map<String, dynamic> dataResponse = jsonDecode(response.body);
      return dataResponse;
    } else {
      throw Exception(
          'there is a problem with status code${response.statusCode} with body ${jsonDecode(response.body)}');
    }
  }

  Future<dynamic> putResponse({
    required String uRl,
    @required dynamic body,
    @required String? token,
  }) async {
    Map<String, String> header = {};
    header.addAll({
      'Content-Type': 'application/x-www-form-urlencoded',
    });
    if (token != null) {
      header.addAll({'Authorization': 'Bearer $token'});
    }
    http.Response response = await http.put(
      Uri.parse(uRl),
      body: body,
      headers: header,
    );
    if (response.statusCode == 200) {
      Map<String, String> updateData = jsonDecode(response.body);
      return updateData;
    } else {
      throw Exception(
          'there is a problem with status code${response.statusCode} with body ${jsonDecode(response.body)}');
    }
  }
}
