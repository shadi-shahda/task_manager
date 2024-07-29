import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/constance/colors.dart';
import 'package:flutter_application_1/core/constance/constance.dart';
import 'package:flutter_application_1/core/functions/auth_functions.dart';
import 'package:flutter_application_1/core/functions/internet.dart';
import 'package:flutter_application_1/core/functions/navigation_functions.dart';
import 'package:flutter_application_1/core/functions/show_dialogs.dart';
import 'package:flutter_application_1/core/global_variable/global_variables.dart';
import 'package:flutter_application_1/presentation/screens/auth_screens/login_page.dart';
import 'package:flutter_application_1/presentation/screens/home/home_page.dart';
import 'package:flutter_application_1/presentation/widgets/images.dart';
import 'package:flutter_application_1/presentation/widgets/text.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    super.initState();
    loginCheck();
  }

  loginCheck() async {
    if (await checkInternetConnection(context)) {
      await getToken();
      if (token.isEmpty) {
        pushingReplacementScreen(context, const LoginPage());
      } else {
        pushingReplacementScreen(context, const HomePage());
      }
    }else{
      showInternetDialog(context, (){
        popScreen(context);
        pushingReplacementScreen(
          context,
          const SplashScreen(),
        );
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: height(context),
        width: width(context),
        color: primaryColor,
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              MyImages.assetImage(logoPath),
              MyText.text(splashScreenText,textColor: white,fontSize: 18),
            ],
          ),
        ),
      ),
    );
  }
}