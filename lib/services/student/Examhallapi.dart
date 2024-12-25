import 'package:dio/dio.dart';

class ApiService {
  final Dio dio = Dio();

  // Example GET request to fetch data from the server
  Future<Map<String, dynamic>> getExamhallapi(String endpoint) async {
    const String baseUrl = "https://jsonplaceholder.typicode.com"; // Example base URL (replace with your API base URL)

    try {
      final response = await dio.get(
        '$baseUrl/$endpoint',
      );

      if (response.statusCode == 200) {
        // Assuming the response contains the data you want
        return response.data;  // Return the data from the server
      } else {
        throw Exception("Failed to load data");
      }
    } catch (e) {
      // Handle errors (e.g., no internet, invalid response)
      return {"error": e.toString()};
    }
  }
}
