import 'package:flutter/material.dart';

class CustomFeedback extends StatefulWidget {
  const CustomFeedback({super.key});

  @override
  State<CustomFeedback> createState() => _CustomFeedbackState();
}

class _CustomFeedbackState extends State<CustomFeedback> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.lightBlue,
        title:Text('Feedback',style: TextStyle(),)
      ),
      body: Container(
        color: Colors.lightBlue,
        width: double.infinity,
        child: Padding(
          padding: const EdgeInsets.all(26.0),
          child: Column(mainAxisAlignment: MainAxisAlignment.center,crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              TextFormField(
                decoration: InputDecoration(
                  fillColor: Colors.white,
                  filled: true,
                  labelText: 'Feedback',
                  border: OutlineInputBorder(),
                ),
                maxLines: 5,
              ),
              SizedBox(height: 10),
              ElevatedButton(
                onPressed: () {},
                child: Text('SUBMIT'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}