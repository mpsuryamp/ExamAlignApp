import 'package:flutter/material.dart';

class SeatingArrangementScreen extends StatelessWidget {
  // Example of current user's seat position (index from 0 to 19)
  final int currentUserSeat = 5;  // For example, the current user is sitting at seat 6 (index 5)

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 160, 226, 234),
      appBar: AppBar(
        title: Text("Classroom "),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
             SizedBox(height: 30,),
            Text('RoomNo: 23'),
            SizedBox(height: 20,),
            Expanded(
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 4, // 4 seats per row
                  crossAxisSpacing: 10, // Horizontal gap between containers
                  mainAxisSpacing: 10,  // Vertical gap between containers
                ),
                itemCount: 20, // Total of 20 seats
                itemBuilder: (context, index) {
                  // Check if the current seat is the user's seat
                  bool isCurrentUserSeat = index == currentUserSeat;
              
                  // Calculate if this is the second container in the row (indices 1, 5, 9, 13, 17)
                  bool isSecondSeatInRow = index % 4 == 1;  // Condition to identify 2nd container in each row
              
                  return Container(
                    margin: isSecondSeatInRow ? EdgeInsets.only(right: 10) : EdgeInsets.all(0), // Gap after 2nd seat
                    decoration: BoxDecoration(
                      color: isCurrentUserSeat ? Colors.green : Colors.grey,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Center(
                      child: Text(
                        'Seat ${index + 1}',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: isCurrentUserSeat ? Colors.white : Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
