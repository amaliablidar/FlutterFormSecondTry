import 'package:flutter/material.dart';

class SubmitScreen extends StatelessWidget {
  const SubmitScreen({Key? key}) : super(key: key);

  static const route = '/submit';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Form Submitted')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Padding(
              padding: EdgeInsets.only(bottom: 10),
              child: Icon(
                Icons.check_circle,
                color: Colors.green,
                size: 100,
              ),
            ),
            Text(
              'Your form was submitted successfully',
              style: TextStyle(fontSize: 30),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
