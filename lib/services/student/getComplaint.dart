import 'package:dio/dio.dart';

// Create a function to fetch complaints using Dio
Future<List<Map<String, dynamic>>> getComplaints() async {
  Dio dio = Dio();

  try {
    // Replace with your API endpoint
    final response = await dio.get('https://api.yourserver.com/complaints');

    if (response.statusCode == 200) {
      // Assuming the response is a JSON list of complaints
      List<dynamic> complaintsData = response.data;
      return List<Map<String, dynamic>>.from(complaintsData);
    } else {
      throw Exception('Failed to load complaints');
    }
  } catch (e) {
    print('Error: $e');
    return [];
  }
}
