import 'package:examinationseatingarrangement/services/Complaintapi.dart';
import 'package:flutter/material.dart';

class Complaint extends StatefulWidget {
  const Complaint({super.key});

  @override
  State<Complaint> createState() => _ComplaintState();
}

class _ComplaintState extends State<Complaint> {
  TextEditingController complaintController = TextEditingController();
  
  // List to store the complaints (you can also store responses here for later use).
  List<Map<String, String>> complaints = [];

  // Function to simulate submitting complaints and adding responses.
  Future<void> submitComplaint(String complaint) async {
    // Simulate API call and response retrieval
    await submitComplaintapi(complaint);  // Call to the API function
    String response = "This is a placeholder reply for your complaint."; // Simulate a response

    // Add complaint and response to the list
    setState(() {
      complaints.add({
        'complaint': complaint,
        'response': response,
      });
    });
    
    // Clear the text field after submitting
    complaintController.clear();
  }

  // Function to view the reply (can be extended to navigate to a new screen if needed)
  void viewReply(String response) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Response"),
          content: Text(response),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Close'),
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
        backgroundColor: Colors.lightBlue,
        title: Text('Complaint', style: TextStyle()),
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
              TextFormField(
                controller: complaintController,
                decoration: InputDecoration(
                  fillColor: Colors.white,
                  filled: true,
                  labelText: 'Complaint',
                  border: OutlineInputBorder(),
                ),
                maxLines: 5,
              ),
              SizedBox(height: 10),
              ElevatedButton(
                onPressed: () async {
                  String complaintText = complaintController.text;
                  if (complaintText.isNotEmpty) {
                    await submitComplaint(complaintText);
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('Please enter a complaint!')),
                    );
                  }
                },
                child: Text('SUBMIT'),
              ),
              SizedBox(height: 20),
              // Displaying the list of complaints
              Expanded(
                child: ListView.builder(
                  itemCount: complaints.length,
                  itemBuilder: (context, index) {
                    String complaint = complaints[index]['complaint']!;
                    String response = complaints[index]['response']??'not replied';
                    return Card(
                      margin: EdgeInsets.symmetric(vertical: 8),
                      child: ListTile(
                        title: Text(complaint),
                        subtitle: Text(response),
                      
                        // ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
