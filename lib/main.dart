import 'package:examinationseatingarrangement/Feedback.dart';
import 'package:examinationseatingarrangement/presentation/student/Registration.dart';
import 'package:examinationseatingarrangement/presentation/student/stdhome.dart';
import 'package:examinationseatingarrangement/presentation/student/viewExamHall.dart';
import 'package:examinationseatingarrangement/presentation/teacher/Studentdetails.dart';
import 'package:examinationseatingarrangement/containers.dart';
import 'package:examinationseatingarrangement/loginpage.dart';
import 'package:examinationseatingarrangement/presentation/teacher/studentmalpractice.dart';
import 'package:examinationseatingarrangement/text.dart';
import 'package:examinationseatingarrangement/viewMap.dart';
import 'package:flutter/material.dart';

import 'CustComplaint.dart';
import 'Examhalldetail.dart';
import 'presentation/teacher/teahomepage.dart';


void main() {
  runApp(const MyApp());
}



// class CustomFeedback extends StatelessWidget {
//   const CustomFeedback({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Container(
//         width: double.infinity,
//         decoration: BoxDecoration(
//           gradient: LinearGradient(
//             colors: [Colors.blueAccent, Colors.cyan],
//             begin: Alignment.topLeft,
//             end: Alignment.bottomRight,
//           ),
//         ),
//         child: Padding(
//           padding: const EdgeInsets.all(20.0),
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             crossAxisAlignment: CrossAxisAlignment.center,
//             children: [
              
//               // Title Text
//               Text(
//                 'We Value Your Feedback!',
//                 style: TextStyle(
//                   fontSize: 28,
//                   fontWeight: FontWeight.bold,
//                   color: Colors.white,
//                 ),
//               ),
//               SizedBox(height: 20),

//               // Feedback TextField
//               TextFormField(
//                 decoration: InputDecoration(
//                   labelText: 'Your Feedback',
//                   labelStyle: TextStyle(color: Colors.white),
//                   hintText: 'Write your feedback here...',
//                   hintStyle: TextStyle(color: Colors.white70),
//                   border: OutlineInputBorder(
//                     borderRadius: BorderRadius.circular(10),
//                   ),
//                   filled: true,
//                   fillColor: Colors.white.withOpacity(0.2),
//                   contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
//                 ),
//                 maxLines: 5, // Allow multiline input
//               ),
//               SizedBox(height: 20),

//               // Rating Section
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   Icon(Icons.star, color: Colors.yellow, size: 30),
//                   Icon(Icons.star, color: Colors.yellow, size: 30),
//                   Icon(Icons.star, color: Colors.yellow, size: 30),
//                   Icon(Icons.star_border, color: Colors.yellow, size: 30),
//                   Icon(Icons.star_border, color: Colors.yellow, size: 30),
//                 ],
//               ),
//               SizedBox(height: 20),

//               // Submit Button
//               ElevatedButton(
//                 onPressed: () {},
//                 style: ElevatedButton.styleFrom(
//                   backgroundColor: Colors.blueAccent,
//                   padding: EdgeInsets.symmetric(horizontal: 40, vertical: 15),
//                   shape: RoundedRectangleBorder(
//                     borderRadius: BorderRadius.circular(30),
//                   ),
//                   elevation: 5,
//                 ),
//                 child: Text(
//                   'Submit Feedback',
//                   style: TextStyle(fontSize: 18),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }




class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LoginPage(),
    );
  }
}

