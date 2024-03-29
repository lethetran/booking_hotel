import 'package:flutter/material.dart';

import 'app_text.dart';

class CustomButton extends StatelessWidget {
  final String text;

  const CustomButton({
    Key? key,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: (){}, 
      style: ButtonStyle(
        shape: MaterialStateProperty.all(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        backgroundColor: MaterialStateProperty.all(Color.fromARGB(255, 221, 167, 20)),
        elevation: MaterialStateProperty.all(0),
         minimumSize: MaterialStateProperty.all(const Size(200, 50)),
      ),
      child: AppText.medium(text),
    );
  }
}
