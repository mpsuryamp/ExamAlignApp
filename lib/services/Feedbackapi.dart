import 'package:dio/dio.dart';


  final Dio dio = Dio();

  // Define the POST request for submitting feedback
  Future<Map<String, dynamic>> submitFeedbackapi({
    required String name,
    required String email,
    required String feedback,
  }) async {
    const String baseUrl = "https://your-api-url.com";  // Replace with your base URL

    try {
      final response = await dio.post(
        '$baseUrl/submitFeedback',  // Example endpoint for feedback submission
        data: {
          'name': name,
          'email': email,
          'feedback': feedback,
        },
      );

      if (response.statusCode == 200) {
        // If the response is successful, return the response data
        return response.data;
      } else {
        // Handle error if response is not successful
        throw Exception("Failed to submit feedback");
      }
    } catch (e) {
      // Handle errors (network issues, invalid response, etc.)
      return {"error": e.toString()};
    }
  }

