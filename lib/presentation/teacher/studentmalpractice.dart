import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class MalpracticeReportPage extends StatefulWidget {
  @override
  _MalpracticeReportPageState createState() => _MalpracticeReportPageState();
}

class _MalpracticeReportPageState extends State<MalpracticeReportPage> {
  XFile? _image; // Variable to hold the picked image
  final TextEditingController regNoController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();

  // Image picker method
  Future<void> _pickImage() async {
    final ImagePicker picker = ImagePicker();
    final XFile? pickedImage = await picker.pickImage(source: ImageSource.camera);
    setState(() {
      _image = pickedImage; // Store the picked image
    });
  }

  // Submit form
  void _submitForm() {
    String regNo = regNoController.text;
    String description = descriptionController.text;

    // Example: Send the regNo, description, and image to the admin
    print("RegNo: $regNo");
    print("Description: $description");
    if (_image != null) {
      print("Image: ${_image!.path}");
    } else {
      print("No image selected");
    }

    // Show confirmation dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Report Submitted'),
          content: Text('The report has been sent to the admin.'),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text('OK'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Malpractice Reporting"),
        backgroundColor: Colors.deepPurple,
        elevation: 5.0,
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.blue.shade50, Colors.blue.shade100],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: ListView(
            // crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              // Title Text
              Text(
                "Report Malpractice Details:",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.deepPurple,
                ),
              ),
              SizedBox(height: 20),

              // Registration Number Field
              TextFormField(
                controller: regNoController,
                decoration: InputDecoration(
                  labelText: 'Registration Number',
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 20),

              // Description Field
              TextFormField(
                controller: descriptionController,
                maxLines: 4,
                decoration: InputDecoration(
                  labelText: 'Description of Malpractice',
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 20),

              // Image picker button
              Center(
                child: ElevatedButton.icon(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.deepPurple, // Button color
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                  ),
                  onPressed: _pickImage,
                  icon: Icon(Icons.camera_alt, color: Colors.white),
                  label: Text('Take Photo', style: TextStyle(color: Colors.white)),
                ),
              ),
              if (_image != null)
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.file(
                      File(_image!.path),
                      height: 100,
                      width: 100,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),

              // Submit button
              Spacer(),
              Center(
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green, // Button color
                    padding: EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                  ),
                  onPressed: _submitForm,
                  child: Text("Submit Report", style: TextStyle(fontSize: 18, color: Colors.white)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
