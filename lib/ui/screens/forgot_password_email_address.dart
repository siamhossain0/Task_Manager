import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:task_manager/ui/screens/forgot_password_otp_screen.dart';
import 'package:task_manager/ui/utils/app_colors.dart';
import 'package:task_manager/ui/widgets/screen_background.dart';

class ForgotPasswordEmailAddress extends StatefulWidget {
  const ForgotPasswordEmailAddress({super.key});

  @override
  State<ForgotPasswordEmailAddress> createState() => _ForgotPasswordEmailAddressState();
}

class _ForgotPasswordEmailAddressState extends State<ForgotPasswordEmailAddress> {
  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: screenBackground(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 82),
                Text(
                  "Your Email Address",
                  style: textTheme.displaySmall?.copyWith(
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(height: 8,),
                Text(
                  "A 6 digit verification otp will be sent to your email address",
                  style: textTheme.titleSmall?.copyWith(
                    fontWeight: FontWeight.w500,
                    color: Colors.grey
                  ),
                ),
                const SizedBox(height: 24),
                _buildVerifyEmailForm(),
                const SizedBox(height: 48),
                Center(
                  child: Column(
                    children: [

                      _buildHaveAccountSection(),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildVerifyEmailForm() {
    return Column(
      children: [
        TextFormField(
            keyboardType: TextInputType.emailAddress
            ,decoration: InputDecoration(hintText: "Email")),
        const SizedBox(height: 24),
        ElevatedButton(
          onPressed: _onTapNextButton,
          child: const Icon(
            Icons.arrow_circle_right_outlined,
            color: Colors.white,
          ),
        ),
      ],
    );
  }

  Widget _buildHaveAccountSection() {
    return RichText(
      text: TextSpan(
        style: const TextStyle(
          color: Colors.black,
          fontWeight: FontWeight.w600,
          fontSize: 14,
          letterSpacing: 0.5,
        ),
        text: "Have  Account?",
        children: [
          TextSpan(
              text: 'Sign IN',
              style: TextStyle(color: AppColors.themeColor),
              recognizer: TapGestureRecognizer()..onTap =_onTapSignIn
          ),
        ],
      ),
    );
  }



  void _onTapNextButton(){
    Navigator.push(context, MaterialPageRoute(builder: (context)=>ForgotPasswordOtpState()));

  }
  void _onTapSignIn(){
    Navigator.pop(context);

  }
}
