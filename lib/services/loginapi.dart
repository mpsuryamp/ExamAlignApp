import 'package:dio/dio.dart';
import 'package:examinationseatingarrangement/presentation/student/stdhome.dart';
import 'package:examinationseatingarrangement/presentation/teacher/teahomepage.dart';
import 'package:flutter/material.dart';

final Dio dio = Dio();
const String baseUrl = "http://192.168.1.38:5000"; // Replace with your API URL
String? lid;
String? userType;
Future<void> loginfun(String username, String password, context) async {
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
      if (response.data['message'] == 'success') {
        lid = response.data['login_id'].toString();
        if (response.data['usertype'] == 'user') {
          Navigator.push(
              context, MaterialPageRoute(builder: (ctxt) => StudentHomePage()));
        } 
        else if(response.data['usertype'] == 'STAFF')
         {
          Navigator.push(
              context, MaterialPageRoute(builder: (ctxt) => TeacherHomePage()));
        }
      } else {
        print('liogin failed');
        snackbarwighjet(context, 'login failed');
      }
    } else {
      snackbarwighjet(context, 'login failed');
      throw Exception("Failed to log in");
    }
  } catch (e) {
    // Handle errors (e.g., no internet, invalid credentials, etc.)
    snackbarwighjet(context, 'login failed');
    print(e);
  }
}

void snackbarwighjet(context, data) {
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(data)));
}
