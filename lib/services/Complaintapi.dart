import 'package:dio/dio.dart';
import 'package:examinationseatingarrangement/services/loginapi.dart';


  final Dio dio = Dio();

  // Submit complaint API
  Future<Map<String, dynamic>> submitComplaintapi(String complaint) async {
    // const String baseUrl = "https://your-api-url.com";  // Replace with your API base URL

    try {
      final response = await dio.post(
        '$baseUrl/Complaintapi',  // Example endpoint for complaint submission
        data: {
          'complaint': complaint,
          'user_lid': lid,
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

