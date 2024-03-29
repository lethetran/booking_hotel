import 'package:flutter/material.dart';
import 'package:booking_hotel/screens/forgot_password/foget_password_options/forget_password_btn_widget.dart';
import 'package:booking_hotel/screens/forgot_password/forget_password_mail/forget_password_mail.dart';
import 'package:booking_hotel/utilities/constants.dart';

class ForgetPasswordScreen{
    static Future<dynamic> buildShowModalBottomSheet(BuildContext context) {
    return showModalBottomSheet(
          context: context,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          builder: (context) => Container(
            padding: const EdgeInsets.all(tDefaultSize),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(tForgetPasswordTitle, style:  Theme.of(context).textTheme.headline2,),
                Text(tForgetPasswordSubTitle, style:  Theme.of(context).textTheme.bodyText2,),
                const SizedBox(height: 30),
                ForgetPasswordBtnWidget(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => ForgotPasswordMail()),
                    );
                  },
                  btnIcon: Icons.email,
                  title:tEmail,
                  subTitle: tRestViaEMail,
                ),
                // const SizedBox(height: 20),
                
                // ForgetPasswordBtnWidget(
                //   btnIcon: Icons.phone_rounded,
                //   title:tPhoneNo,
                //   subTitle: tRestViaPhone,
                //   onTap: (){
                //     Navigator.push(
                //       context,
                //       MaterialPageRoute(builder: (context) => ForgotPasswordPhone()),
                //     );
                //   },
                // ),
                ],
              ),
          ),
        );
  }
}