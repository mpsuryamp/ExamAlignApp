import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class LocationsScreen extends StatelessWidget {
  // A list of places with their names and latitude/longitude
  final List<Map<String, dynamic>> places = [
    {'name': 'Canteen', 'lat':11.262184, 'lon': 75.791405}, // Example Lat/Lon for New Delhi
    {'name': 'Ground', 'lat': 28.7041, 'lon': 77.1025},  // Example Lat/Lon for a Ground
    {'name': 'Library', 'lat': 28.5355, 'lon': 77.3910}, // Example Lat/Lon for a Library
    {'name': 'Meeting Hall', 'lat': 28.5376, 'lon': 77.3045}, // Example Lat/Lon for a Meeting Hall
  ];

  // Function to launch Google Maps with the selected place's coordinates
  Future<void> _launchMaps(double lat, double lon) async {
    final String googleMapsUrl = "https://www.google.com/maps/search/?api=1&query=$lat,$lon";
    
      await launchUrl(Uri.parse(googleMapsUrl));
   
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Choose a Location'),
      ),
      body: ListView.builder(
        itemCount: places.length,
        itemBuilder: (context, index) {
          final place = places[index];
          return ListTile(
            title: Text(place['name']),
            onTap: () {
              // When tapped, launch Google Maps with the place's coordinates
              _launchMaps(place['lat'], place['lon']);
            },
          );
        },
      ),
    );
  }
}


