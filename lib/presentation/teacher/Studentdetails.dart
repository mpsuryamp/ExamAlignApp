import 'package:flutter/material.dart';

class Studentdetail extends StatefulWidget {
  const Studentdetail({super.key});

  @override
  State<Studentdetail> createState() => _StudentdetailState();
}

class _StudentdetailState extends State<Studentdetail> {
  // Sample data for student details
  final List<Map<String, String>> studentDetails = [
    {'label': 'Examhall N.O', 'value': '123'},
    {'label': 'Name', 'value': 'Suhail'},
    {'label': 'Register N.O', 'value': 'Jdawscs013'},
    {'label': 'Branch', 'value': 'Computer Science'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Student Details'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Card(
          elevation: 5,
          margin: EdgeInsets.symmetric(vertical: 8),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: studentDetails.map((detail) {
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        detail['label']!,
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Text(
                        detail['value']!,
                        style: TextStyle(color: Colors.grey[700]),
                      ),
                    ],
                  ),
                );
              }).toList(),
            ),
          ),
        ),
      ),
    );
  }
}
