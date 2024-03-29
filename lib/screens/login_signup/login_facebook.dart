import 'package:flutter/material.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../home_screens/home_screen.dart';

class LoginFacebook extends StatefulWidget {
  @override
  _LoginFacebookState createState() => _LoginFacebookState();
}

class _LoginFacebookState extends State<LoginFacebook> {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<UserCredential?> signInWithFacebook() async {
    final AccessToken result = (await FacebookAuth.instance.login()) as AccessToken;
    final facebookAuthCredential = FacebookAuthProvider.credential(result.token);
    return await _auth.signInWithCredential(facebookAuthCredential);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Facebook Login'),
      ),
      body: Center(
        child: ElevatedButton(
          child: Text('Sign in with Facebook'),
          onPressed: () async {
            final UserCredential? userCredential = await signInWithFacebook();
            if (userCredential != null) {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => HomeScreen()),
              );
            } else {
              print('Sign in failed');
            }
          },
        ),
      ),
    );
  }
}