import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:task_manager/ui/utils/app_colors.dart';
import 'package:task_manager/ui/widgets/screen_background.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
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
                  "Join With Us",
                  style: textTheme.displaySmall?.copyWith(
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(height: 24),
                _buildSignUpForm(),
                const SizedBox(height: 24),
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

  Widget _buildSignUpForm() {
    return Column(
      children: [
        TextFormField(decoration: InputDecoration(hintText: "Email")),
        const SizedBox(height: 8),
        TextFormField(decoration: InputDecoration(hintText: "First name")),
        const SizedBox(height: 8),
        TextFormField(decoration: InputDecoration(hintText: "Last name")),
        const SizedBox(height: 8),
        TextFormField(decoration: InputDecoration(hintText: "Mobile")),
        const SizedBox(height: 8),
        TextFormField(decoration: InputDecoration(hintText: "Password")),
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

  void _onTapNextButton(){
    /// TODO: implement on tap next button.

  }
  void _onTapSignIn(){
    Navigator.pop(context);

  }
}
