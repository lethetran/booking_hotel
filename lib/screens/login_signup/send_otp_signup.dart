// import 'package:flutter/material.dart';
// import 'package:firebase_auth/firebase_auth.dart';

// class SendOtpSignUp extends StatefulWidget {
//   final String verificationId;

//   SendOtpSignUp({required this.verificationId});

//   @override
//   _SendOtpState createState() => _SendOtpState();
// }

// class _SendOtpState extends State<SendOtpSignUp> {
//   final otpController = TextEditingController();
//   final _auth = FirebaseAuth.instance;

//   void verifyOtp() async {
//     try {
//       final PhoneAuthCredential credential = PhoneAuthProvider.credential(
//         verificationId: widget.verificationId,
//         smsCode: otpController.text,
//       );

//       final UserCredential userCredential =
//           await _auth.signInWithCredential(credential);

//       // TODO: Navigate to the next screen after successful login
//     } catch (e) {
//       print('Failed to verify OTP: $e');
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Verify OTP'),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           children: [
//             TextField(
//               controller: otpController,
//               decoration: InputDecoration(
//                 labelText: 'Enter OTP',
//               ),
//               keyboardType: TextInputType.number,
//             ),
//             ElevatedButton(
//               onPressed: verifyOtp,
//               child: Text('Confirm'),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }