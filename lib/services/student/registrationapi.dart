import 'package:dio/dio.dart';


  final Dio dio = Dio();

  Future<Map<String, dynamic>> registerapi(String username, String email, String password) async {
    const String url = "https://yourapiurl.com/register"; // Replace with your API URL

    try {
      final response = await dio.post(
        url,
        data: {
          "username": username,
          "email": email,
          "password": password,
        },
      );
      
      // Check if the response is successful (status code 200)
      if (response.statusCode == 200) {
        // Assuming the response contains the registration success data
        return response.data; 
      } else {
        throw Exception("Failed to register");
      }
    } catch (e) {
      // Handle errors (e.g., no internet, validation error, etc.)
      return {"error": e.toString()};
    }
  }

