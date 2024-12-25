import 'package:examinationseatingarrangement/text.dart';
import 'package:flutter/material.dart';

class co extends StatelessWidget {
  const co({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Center(
        child: Container(
          height: 250,
          width: 150,
          decoration: BoxDecoration(
            color: Colors.blue,
            borderRadius: BorderRadius.circular(10),
            
          ),
          child:Column(mainAxisAlignment: MainAxisAlignment.center,crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text('fghjkl;'),
              SizedBox(height: 10,),
              Text('dfghjkl;'),
              Text('DSDSF')

            ],
          )
        ),
      ),
    );
  }
}