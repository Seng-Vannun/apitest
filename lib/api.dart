import 'dart:convert';
import 'package:apitest/data_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ApiService {
  Future<UserData> fetchData(String? parseUrl) async {
    
    final response = await http.get(Uri.parse(parseUrl!));
    if (response.statusCode == 200) {
      UserData userData = UserData.fromJson(json.decode(response.body));
      return userData;
    } else {
      throw Exception('Failed to load data');
    }
  }
}
