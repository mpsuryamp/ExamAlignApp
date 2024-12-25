import 'package:flutter/material.dart';

import 'package:flutter/material.dart';

class Examhall extends StatefulWidget {
  const Examhall({super.key});

  @override
  State<Examhall> createState() => _ExamhallState();
}

class _ExamhallState extends State<Examhall> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100], // Light background color for better contrast
      appBar: AppBar(
        title: Text('Examination Details'),
        centerTitle: true,
        backgroundColor: Colors.blueAccent,
        elevation: 4.0, // Subtle shadow for the app bar
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0), // Padding around the content
        child: ListView(
          children: [
            _buildExamDetailsCard(),
            SizedBox(height: 30), // Space between sections
            _buildActionButton(),
          ],
        ),
      ),
    );
  }

  Widget _buildExamDetailsCard() {
    return Card(
      elevation: 5.0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      color: Colors.white,
      shadowColor: Colors.black38,
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildRow(Icons.book, 'Exam Name', 'Third Semester Examination'),
            _buildRow(Icons.calendar_today, 'Exam Date', '02/01/2025'),
            _buildRow(Icons.access_time, 'Time', '01:30 PM'),
            _buildRow(Icons.timer, 'Duration', '2 hours'),
            _buildRow(Icons.person, 'Student No.', '36'),
          ],
        ),
      ),
    );
  }

  Widget _buildRow(IconData icon, String title, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Icon(
            icon,
            color: Colors.blueAccent,
            size: 30.0,
          ),
          SizedBox(width: 20.0),
          Text(
            title,
            style: TextStyle(
              fontSize: 18.0,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
          SizedBox(width: 20.0),
          Expanded(
            child: Text(
              value,
              style: TextStyle(
                fontSize: 16.0,
                color: Colors.black54,
              ),
              textAlign: TextAlign.right,
            ),
          ),
        ],
      ),
    );
  }

  // Add action button to navigate or interact
  Widget _buildActionButton() {
    return ElevatedButton(
      onPressed: () {
        // Handle button click, e.g., for navigating to another page
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.blueAccent,
        padding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 30.0),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30.0),
        ),
        elevation: 5.0,
      ),
      child: Text(
        'Back to  Home',
        style: TextStyle(
          fontSize: 18.0,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
 
  }
}