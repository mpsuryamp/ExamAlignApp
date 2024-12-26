import 'package:examinationseatingarrangement/CustComplaint.dart';
import 'package:examinationseatingarrangement/Examhalldetail.dart';
import 'package:examinationseatingarrangement/Feedback.dart';
import 'package:examinationseatingarrangement/presentation/student/viewExamHall.dart';
import 'package:examinationseatingarrangement/presentation/teacher/Studentdetails.dart';
import 'package:examinationseatingarrangement/presentation/teacher/studentmalpractice.dart';
import 'package:examinationseatingarrangement/viewMap.dart';
import 'package:flutter/material.dart';

class TeacherHomePage extends StatefulWidget {
  TeacherHomePage({super.key});

  @override
  State<TeacherHomePage> createState() => _TeacherHomePageState();
}

class _TeacherHomePageState extends State<TeacherHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Teacher Dashboard'),
        actions: [
          IconButton(onPressed: () {}, icon: Icon(Icons.notifications,color: Colors.amber,)),
        ],
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            // Drawer Header (optional)
            UserAccountsDrawerHeader(
              accountName: Text("Teacher Name"), // Replace with teacher's name
              accountEmail: Text("teacher@example.com"), // Replace with email
              currentAccountPicture: CircleAvatar(
                backgroundColor: Colors.white,
                child: Icon(Icons.person, color: Colors.blue),
              ),
            ),
            // List of functions in the Drawer
            ListTile(
              leading: Icon(Icons.settings),
              title: Text('Settings'),
              onTap: () {
                Navigator.push(
              context, MaterialPageRoute(builder: (ctxt) => CustomFeedback()));
                // Handle settings tap
                // Navigator.push(
                //   context,
                //   MaterialPageRoute(builder: (context) => SettingsPage()), // Replace with your SettingsPage
                // );
              },
            ),
            ListTile(
              leading: Icon(Icons.comment),
              title: Text('Complaints'),
              onTap: () {
                Navigator.push(
              context, MaterialPageRoute(builder: (ctxt) => Complaint()));
                // Handle profile tap
                // Navigator.push(
                //   context,
                //   MaterialPageRoute(builder: (context) => ProfilePage()), // Replace with your ProfilePage
                // );
              },
            ),
            ListTile(
              leading: Icon(Icons.logout),
              title: Text('Logout'),
              onTap: () {
                Navigator.push(
              context, MaterialPageRoute(builder: (ctxt) => CustomFeedback()));
                // Handle logout tap
                _logout();
              },
            ),
          ],
        ),
      ),
      body: Container(
        width: double.infinity,
        padding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.blueAccent, Colors.cyan],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // First Row with decorated Containers
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                // Exam Hall Container
                _buildDecoratedContainer(
                  color: Colors.blue,
                  icon: Icons.book,
                  label: 'ExamHall',
                  onTap: () {
                    Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => SeatingArrangementScreen()), // Replace with your SettingsPage
                );
                    
                  },
                ),
                // Student Details Container
                _buildDecoratedContainer(
                  color: Colors.cyan,
                  icon: Icons.people, // Updated icon for student details
                  label: 'Student Details',
                  onTap: () {
                    Navigator.push(
              context, MaterialPageRoute(builder: (ctxt) => Studentdetail()));
                    // Navigate to student details page
                    // Navigator.push(
                    //   context,
                    //   MaterialPageRoute(builder: (context) => StudentDetailsPage()), // Replace with your StudentDetailsPage
                    // );
                  },
                ),
              ],
            ),
            SizedBox(height: 40), // Add space between rows
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                // Classes Container
               
                // Profile Container
                _buildDecoratedContainer(
                  color: const Color.fromARGB(255, 147, 238, 10),
                  icon: Icons.account_circle, // Updated icon for profile
                  label: 'Duty Profile',
                  onTap: () {
                    Navigator.push(
              context, MaterialPageRoute(builder: (ctxt) => CustomFeedback()));
                    // Navigate to profile page
                    // Navigator.push(
                    //   context,
                    //   MaterialPageRoute(builder: (context) => ProfilePage()), // Navigate to Profile Page
                    // );
                  },
                ),
             
                _buildDecoratedContainer(
                  color: Colors.orange,
                  icon: Icons.account_circle, // Updated icon for profile
                  label: 'Reporting',
                  onTap: () {
                    Navigator.push(
              context, MaterialPageRoute(builder: (ctxt) => CustomFeedback()));
                 
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => MalpracticeReportPage()), // Navigate to Profile Page
                    );
                  },
                ),
              ],
            ),
SizedBox(height: 40), 
            Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [   _buildDecoratedContainer(
                  color: const Color.fromARGB(255, 93, 241, 122),
                  icon: Icons.map,
                  label: 'Navigation',
                  onTap: () {
                    Navigator.push(
              context, MaterialPageRoute(builder: (ctxt) => LocationsScreen()));
                    // Navigate to Profile page
                    print('object');
                  },
                ),

                _buildDecoratedContainer(
                  color: Color.fromARGB(255, 182, 206, 207),
                  icon: Icons.feedback,
                  label: 'Feedback',
                  onTap: () {
                     Navigator.push(
              context, MaterialPageRoute(builder: (ctxt) => CustomFeedback()));
                    // Navigate to Reporting page
                  },
                ),],)
          ],
        ),
      ),
    );
  }

  // Function to create a decorated container with an icon and label
  Widget _buildDecoratedContainer({required Color color, required IconData icon, required String label, required VoidCallback onTap}) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 120,
        width: 120,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: Colors.black45,
              blurRadius: 8,
              offset: Offset(2, 4),
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 40, color: Colors.white),
            SizedBox(height: 8),
            Text(
              label,
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white),
            ),
          ],
        ),
      ),
    );
  }

  void _logout() {
    // Handle the logout logic (e.g., clear session or navigate to login screen)
    print("Logging out...");
    // Optionally, navigate to login screen:
    // Navigator.pushReplacementNamed(context, '/login');
  }
}

// Example placeholder for StudentDetailsPage and ProfilePage
