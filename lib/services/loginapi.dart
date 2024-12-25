import 'package:dio/dio.dart';
import 'package:flutter/material.dart';


  final Dio dio = Dio();
 const String baseUrl = "http://192.168.1.38:5000"; // Replace with your API URL
 String? lid;
 String? userType;
  Future<Map<String, dynamic>> loginfun(String username, String password) async {
   print('start');

    try {
      final response = await dio.post(
        '$baseUrl/LoginPageapi',
        data: {
          "username": username,
          "password": password,
        },
      );
      print(response.data);
      // Check if the response is successful (status code 200)
      if (response.statusCode == 200) {
        // The response data is usually in the form of a JSON object
        return response.data;
      } else {
        throw Exception("Failed to log in");
      }
    } catch (e) {
      // Handle errors (e.g., no internet, invalid credentials, etc.)
      return {"error": e.toString()};
    }
  }

