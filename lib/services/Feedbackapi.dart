import 'package:dio/dio.dart';
import 'package:examinationseatingarrangement/services/loginapi.dart';


  final Dio dio = Dio();

  // Define the POST request for submitting feedback
  Future<Map<String, dynamic>> submitFeedbackapi({
    
    required String feedback,
  }) async {
     // Replace with your base URL

    try {
      final response = await dio.post(
        '$baseUrl/submitFeedback',  // Example endpoint for feedback submission
        data: {
        'lid':lid,
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

