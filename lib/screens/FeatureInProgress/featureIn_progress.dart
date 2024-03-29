import 'package:flutter/material.dart';

class FeatureInProgressWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('Feature in Progress'),
      content: SingleChildScrollView(
        child: ListBody(
          children: <Widget>[
            Text('This feature is currently under development.'),
            Text('Please check back later for updates.'),
          ],
        ),
      ),
      actions: <Widget>[
        TextButton(
          child: Text('OK'),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ],
    );
  }
}