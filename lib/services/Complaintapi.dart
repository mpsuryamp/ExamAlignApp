import 'package:dio/dio.dart';


  final Dio dio = Dio();

  // Submit complaint API
  Future<Map<String, dynamic>> submitComplaintapi(String complaintType, String description, String userId) async {
    const String baseUrl = "https://your-api-url.com";  // Replace with your API base URL

    try {
      final response = await dio.post(
        '$baseUrl/submit_complaint',  // Example endpoint for complaint submission
        data: {
          'complaint_type': complaintType,
          'description': description,
          'user_id': userId,
        },
      );

      if (response.statusCode == 200) {
        // Successfully submitted complaint
        return response.data;
      } else {
        throw Exception("Failed to submit complaint");
      }
    } catch (e) {
      // Handle errors
      return {"error": e.toString()};
    }
  }

