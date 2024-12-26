import 'package:examinationseatingarrangement/CustComplaint.dart';
import 'package:examinationseatingarrangement/Examhalldetail.dart';
import 'package:examinationseatingarrangement/Feedback.dart';
import 'package:examinationseatingarrangement/presentation/student/viewExamHall.dart';
import 'package:examinationseatingarrangement/viewMap.dart';
import 'package:flutter/material.dart';

class StudentHomePage extends StatefulWidget {
  StudentHomePage({super.key});

  @override
  State<StudentHomePage> createState() => _StudentHomePageState();
}

class _StudentHomePageState extends State<StudentHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Student Dashboard', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
        backgroundColor: Colors.blueAccent,
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.notifications, color: Colors.amber),
          ),
        ],
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            UserAccountsDrawerHeader(
              accountName: Text("Student Name"),
              accountEmail: Text("Student@example.com"),
              currentAccountPicture: CircleAvatar(
                backgroundColor: Colors.white,
                child: Icon(Icons.person, color: Colors.blue, size: 50),
              ),
            ),
            ListTile(
              leading: Icon(Icons.settings),
              title: Text('Settings'),
              onTap: () {
                // Handle settings tap
              },
            ),
            ListTile(
              leading: Icon(Icons.map),
              title: Text('Complaint'),
              onTap: () {
                Navigator.push(
              context, MaterialPageRoute(builder: (ctxt) => Complaint()));
                // Handle profile tap
              },
            ),
            ListTile(
              leading: Icon(Icons.logout),
              title: Text('Logout'),
              onTap: _logout,
            ),
          ],
        ),
      ),
      body: Container(
        padding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.blueAccent, Colors.cyan],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _buildDecoratedContainer(
                  color: const Color.fromARGB(221, 173, 65, 148),
                  icon: Icons.comment,
                  label: 'complaint',
                  onTap: () { 
                    Navigator.push(
              context, MaterialPageRoute(builder: (ctxt) => Complaint()));

                    // Navigate to Exam Hall page
                  },
                ),
                _buildDecoratedContainer(
                  color: Colors.cyan,
                  icon: Icons.schedule,
                  label: 'Exam Schedule',
                  onTap: () {
                    Navigator.push(
              context, MaterialPageRoute(builder: (ctxt) => Examhall()));

                    // Navigate to Exam Schedule page
                  },
                ),
              ],
            ),
            SizedBox(height: 40),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _buildDecoratedContainer(
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
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  // Function to create a decorated container with an icon and label
  Widget _buildDecoratedContainer({
    required Color color,
    required IconData icon,
    required String label,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: onTap,
          splashColor: Colors.white.withOpacity(0.2),
          borderRadius: BorderRadius.circular(15),
          child: Container(
            height: 130,
            width: 130,
            decoration: BoxDecoration(
              color: color,
              borderRadius: BorderRadius.circular(15),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.2),
                  blurRadius: 12,
                  offset: Offset(2, 6),
                ),
              ],
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(icon, size: 55, color: Colors.white),
                SizedBox(height: 10),
                Text(
                  label,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // Logout function
  void _logout() {
    print("Logging out...");
    // Handle logout logic, clear session, etc.
    // Optionally, navigate to login screen:
    // Navigator.pushReplacementNamed(context, '/login');
  }
}
