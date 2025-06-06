import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:task_manager/ui/screens/sign_in_screen.dart';
import 'package:task_manager/ui/utils/assets_path.dart';

import '../widgets/screen_background.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    super.initState();
    _moveToNextScreen();

  }
  Future<void> _moveToNextScreen() async{
    await Future.delayed(const Duration(seconds: 5));
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> SignInScreen()));
    
  }
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: screenBackground(child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(AssetsPath.logoSvg,width: 120,)
          ],
        ),
      ),),
    );
  }
}



