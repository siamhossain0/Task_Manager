import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:task_manager/data/models/network_response.dart';
import 'package:task_manager/data/service/network_caller.dart';
import 'package:task_manager/data/utils/urls.dart';
import 'package:task_manager/ui/utils/app_colors.dart';
import 'package:task_manager/ui/widgets/centered_circular_progress_indicator.dart';
import 'package:task_manager/ui/widgets/screen_background.dart';
import 'package:task_manager/ui/widgets/snack_bar_message.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  /*
  Flutter অ্যাপে আমরা যখন Form ব্যবহার করি (যেমন: লগইন, সাইন-আপ, ফিডব্যাক ফর্ম), তখন চাই যে:

ইউজার সব তথ্য ঠিকঠাক দিচ্ছে কিনা — সেটা চেক করতে পারি (validate)

ফর্মের ডেটা রিসেট করতে পারি

ফর্মের ডেটা সাবমিটের আগে সবকিছু ঠিক আছে কিনা যাচাই করতে পারি

এই কাজগুলো করতে হলে আমাদের Form এর "State" এর উপর নিয়ন্ত্রণ দরকার হয়।

Flutter এ Widget গুলো স্টেট দিয়ে কাজ করে, আর সেই Form এর State অ্যাক্সেস করার জন্য আমাদের একটা "চাবি" (Key) দরকার হয়।

এই Key-টাই হলো GlobalKey<FormState>()।

🧠 তাহলে ব্যাপারটা এমন:
তুমি Form বানালে সেটা একটা Widget।
কিন্তু তুমি যখন বাইরে থেকে জানতে চাও:

Form valid কিনা?

সব Field ঠিকমতো fill করা হয়েছে কিনা?

তখন তুমি এই চাবি দিয়ে Form কে জিজ্ঞেস করো: “হে Form, সব ঠিক আছে?”

এই চাবি-র নাম আমরা রাখি _formKey।
📝 শেষ কথায়:
🔑 GlobalKey<FormState> হলো Form কে নিয়ন্ত্রণ করার চাবি।
তুমি এটা ছাড়া Form validate বা reset করতে পারবে না।

এই চাবি দিয়েই তুমি জানতে পারো:

ফর্মে ইউজার সঠিক তথ্য দিয়েছে কিনা

ফর্মে কোনো ইনপুট ফাঁকা আছে কিনা

সব কিছু ঠিক থাকলে ডেটা সাবমিট করবে কিনা

   */
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final TextEditingController _emailTEController = TextEditingController();
  final TextEditingController _firstNameTEController = TextEditingController();
  final TextEditingController _lastNameTEController = TextEditingController();
  final TextEditingController _mobileTEController = TextEditingController();
  final TextEditingController _passwordTEController = TextEditingController();
  bool _isProgress = false;

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme
        .of(context)
        .textTheme;
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
                Center(child: Column(children: [_buildHaveAccountSection()])),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildSignUpForm() {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          TextFormField(
            controller: _emailTEController,
            keyboardType: TextInputType.emailAddress,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            decoration: InputDecoration(hintText: "Email"),
            validator: (String? value) {
              if (value?.isEmpty ??
                  true) { //যদি value null হয় অথবা value.isEmpty হয় (অর্থাৎ ফাঁকা হয়), তাহলে true রিটার্ন করো।
                return 'Enter valid email';
              }
              return null;
            },
          ),
          const SizedBox(height: 8),
          TextFormField(
            controller: _firstNameTEController,
            decoration: InputDecoration(hintText: "First name"),
            autovalidateMode: AutovalidateMode.onUserInteraction,
            validator: (String? value) {
              if (value?.isEmpty ??
                  true) { //যদি value null হয় অথবা value.isEmpty হয় (অর্থাৎ ফাঁকা হয়), তাহলে true রিটার্ন করো।
                return 'Enter valid First Name';
              }
              return null;
            },
          ),
          const SizedBox(height: 8),
          TextFormField(
            controller: _lastNameTEController,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            decoration: InputDecoration(hintText: "Last name"),
            validator: (String? value) {
              if (value?.isEmpty ??
                  true) { //যদি value null হয় অথবা value.isEmpty হয় (অর্থাৎ ফাঁকা হয়), তাহলে true রিটার্ন করো।
                return 'Enter valid Last Name';
              }
              return null;
            },
          ),
          const SizedBox(height: 8),
          TextFormField(
            controller: _mobileTEController,
            keyboardType: TextInputType.phone,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            decoration: InputDecoration(hintText: "Mobile"),
            validator: (String? value) {
              if (value?.isEmpty ??
                  true) { //যদি value null হয় অথবা value.isEmpty হয় (অর্থাৎ ফাঁকা হয়), তাহলে true রিটার্ন করো।
                return 'Enter valid Mobile';
              }
              return null;
            },
          ),
          const SizedBox(height: 8),
          TextFormField(
            controller: _passwordTEController,
            autovalidateMode: AutovalidateMode.onUserInteraction,

            decoration: InputDecoration(hintText: "Password"),
            validator: (String? value) {
              if (value?.isEmpty ??
                  true) { //যদি value null হয় অথবা value.isEmpty হয় (অর্থাৎ ফাঁকা হয়), তাহলে true রিটার্ন করো।
                return 'Enter valid Password';
              }
              return null;
            },),
          const SizedBox(height: 24),
          Visibility(
            visible: !_isProgress,
            replacement:const CenteredCircularProgressIndicator(),
            child: ElevatedButton(
              onPressed: _onTapNextButton,
              child: const Icon(
                Icons.arrow_circle_right_outlined,
                color: Colors.white,
              ),
            ),
          ),
        ],
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
            recognizer: TapGestureRecognizer()
              ..onTap = _onTapSignIn,
          ),
        ],
      ),
    );
  }

  void _onTapNextButton() {
    if (_formKey.currentState!.validate()) {
      _signUp();
    }
  }

  Future<void> _signUp() async {
    _isProgress = true;
    setState(() {});

    Map<String ,dynamic> requestBody = {
      "email":_emailTEController.text.trim(),
      "firstName":_firstNameTEController.text.trim(),
      "lastName":_lastNameTEController.text.trim(),
      "mobile" : _mobileTEController.text.trim(),
      "password": _passwordTEController.text,
      "photo": ""
    };
    NetworkResponse response = await NetworkCaller.postRequest(
      url: Urls.registration,body:requestBody, );

    if (response.isSuccess){
      _clearTextField();
      showSnackBarMessage(context,"New user created");
    } else{
      showSnackBarMessage(context, response.errorMessage,true);
    }
  }
  void _clearTextField(){
    _emailTEController.clear();
    _firstNameTEController.clear();
    _lastNameTEController.clear();
    _mobileTEController.clear();
    _passwordTEController.clear();
  }

  void _onTapSignIn() {
    Navigator.pop(context);
  }
  
  @override
  void dispose() {
    _emailTEController.dispose();
    _firstNameTEController.dispose();
    _lastNameTEController.dispose();
    _mobileTEController.dispose();
    _passwordTEController.dispose();
    super.dispose();
  }
}
