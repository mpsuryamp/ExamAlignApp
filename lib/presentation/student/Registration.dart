import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class Registration extends StatefulWidget {
  const Registration({super.key});

  @override
  State<Registration> createState() => _RegistrationState();
}

class _RegistrationState extends State<Registration> {
  File? _profileImage;

  // Function to pick an image from gallery or camera
  Future<void> _pickImage() async {
    final ImagePicker picker = ImagePicker();
    final XFile? pickedFile = await picker.pickImage(source: ImageSource.gallery); // Use ImageSource.camera for camera

    if (pickedFile != null) {
      setState(() {
        _profileImage = File(pickedFile.path);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        color: Colors.blueAccent,
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'Registration',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 20),
              
              // Profile Image Picker
              GestureDetector(
                onTap: _pickImage,
                child: CircleAvatar(
                  radius: 50,
                  backgroundColor: Colors.white,
                  child: _profileImage != null
                      ? ClipOval(
                          child: Image.file(
                            _profileImage!,
                            width: 100,
                            height: 100,
                            fit: BoxFit.cover,
                          ),
                        )
                      : Icon(Icons.add_a_photo, size: 50, color: Colors.cyan),
                ),
              ),
              SizedBox(height: 50),
              
              // Username Field
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Username',
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 20),

              // Registerno Field
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Registerno',
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 10),

              // Branch Field
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Branch',
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 10),

              // Semester Field
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Semester',
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 10),

              // Register Button with custom style
              ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blueAccent, // Background color
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12), // Rounded corners
                  ),
                  padding: EdgeInsets.symmetric(vertical: 15, horizontal: 30),
                  textStyle: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                child: Text('Register'),
              ),
              SizedBox(height: 10),

              // Back to Login Button
              TextButton(
                onPressed: () {},
                child: Text('Back to Login'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
