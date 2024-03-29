import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../forget_password_mail/Utils.dart';

class NewPassword extends StatefulWidget {
  @override
  _NewPasswordState createState() => _NewPasswordState();
}

class _NewPasswordState extends State<NewPassword> {
  final passwordController = TextEditingController();
  final _auth = FirebaseAuth.instance;

  void updatePassword() async {
    if (_auth.currentUser != null) {
      _auth.currentUser!.updatePassword(passwordController.text).then((_) {
        Utils.showSnackBar('Password updated successfully', context);
      }).catchError((error) {
        Utils.showSnackBar('Password could not be updated', context);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Update Password'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            TextField(
              controller: passwordController,
              decoration: InputDecoration(
                labelText: 'Enter your new password',
              ),
              obscureText: true,
            ),
            ElevatedButton(
              onPressed: updatePassword,
              child: Text('Update Password'),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    passwordController.dispose();
    super.dispose();
  }
}