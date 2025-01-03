import 'package:flutter/material.dart';

import 'package:examinationseatingarrangement/services/Feedbackapi.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class CustomFeedback extends StatefulWidget {
  const CustomFeedback({super.key});

  @override
  State<CustomFeedback> createState() => _CustomFeedbackState();
}

class _CustomFeedbackState extends State<CustomFeedback> {
  double _rating = 0.0;  // Variable to hold the rating value

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.lightBlue,
        title: Text(
          'Rate Your Experience',
          style: TextStyle(),
        ),
      ),
      body: Container(
        color: Colors.lightBlue,
        width: double.infinity,
        child: Padding(
          padding: const EdgeInsets.all(26.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Rating bar for selecting stars
              RatingBar.builder(
                initialRating: _rating,
                minRating: 1,
                direction: Axis.horizontal,
                itemCount: 5,
                itemSize: 40,
                itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
                itemBuilder: (context, _) => Icon(
                  Icons.star,
                  color: Colors.amber,
                ),
                onRatingUpdate: (rating) {
                  setState(() {
                    _rating = rating;  // Update the rating value
                  });
                },
              ),
              SizedBox(height: 20),
              // Button to submit the rating
              ElevatedButton(
                onPressed: () async {
                  // Check if a rating has been given
                  if (_rating > 0) {
                    await submitFeedbackapi(feedback: _rating.toString());
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('Feedback submitted successfully!')),
                    );
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('Please select a rating first.')),
                    );
                  }
                },
                child: Text('SUBMIT'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
