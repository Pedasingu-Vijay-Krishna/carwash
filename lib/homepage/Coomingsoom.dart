import 'package:flutter/material.dart';

class ComingSoonPage extends StatelessWidget {

  bool enable = true;

  ComingSoonPage(this.enable);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
     appBar:   enable?  AppBar(
        title: Text('Coming Soon'),
      ):null,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/cmgsooon.png',
              width: 200,
              height: 200,
              // Adjust the width and height values according to your image size
            ),
            SizedBox(height: 20),
            Text(
              'We are working on something amazing!',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            // SizedBox(height: 20),
            // Text(
            //   'This service is currently underway and will be active soon.',
            //   style: TextStyle(
            //     fontSize: 15,
            //     fontWeight: FontWeight.bold,
            //   ),
            // ),
            SizedBox(height: 10),
            Text(
              'You will be notified when it’s available. Thank You',
              style: TextStyle(
                fontSize: 16,
                color: Colors.grey,
              ),
            ),
          ],
        ),
      ),
    );
  }
}






