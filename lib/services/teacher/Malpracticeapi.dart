import 'package:dio/dio.dart';

class ApiService {
  final Dio dio = Dio(); // Create a Dio instance

  Future<Map<String, dynamic>?> postMalpracticeReportapi(String url, Map<String, dynamic> data) async {
    try {
      // Send the POST request with the data as the body
      final response = await dio.post(
        url,
        data: data,
      );

      // Check if the response status is successful
      if (response.statusCode == 200) {
        // If successful, return the response data
        return response.data; 
      } else {
        // If not successful, print the status and return null
        print('Request failed with status: ${response.statusCode}');
        return null;
      }
    } catch (e) {
      // Catch any errors and print them
      print('Error occurred: $e');
      return null;
    }
  }
}
