import 'dart:async';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:walletx/db_functions/transaction_dbfunction.dart';
import 'package:walletx/global_things/text.dart';
import 'package:walletx/main.dart';
import 'package:walletx/screens/homepage/navigationscreen.dart';
import 'package:walletx/screens/intropage/onboard.dart';

class ScreenSplash extends StatefulWidget {
  const ScreenSplash({Key? key}) : super(key: key);

  @override
  State<ScreenSplash> createState() => _ScreenSplashState();
}

class _ScreenSplashState extends State<ScreenSplash> {
  // @override
  // void initState() {
  //   gotoNext();
  //   super.initState();
  // }
  @override
  void initState() {
    Timer(const Duration(seconds: 3), () => checkScreen(context));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    TransactionDB.instance.refreshUi();
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.only(bottom: 100, left: 10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Stack(children: [
                SizedBox(
                  height: height / 2,
                  child: Lottie.asset('assets/lottie/lottie.json'),
                ),
                const Padding(
                  padding: EdgeInsets.only(top: 300, left: 10),
                  child: TextWidgets(
                      text: 'WalletX',
                      textsize: 70,
                      textFontWeight: FontWeight.bold,
                      textcolor: Colors.black),
                ),
              ]),
            ],
          ),
        ),
      ),
    );
  }

  // Future<void> gotoNext() async {
  //   await Future.delayed(const Duration(seconds: 4));
  //   // ignore: use_build_context_synchronously
  //   Navigator.of(context).pushReplacement(
  //       MaterialPageRoute(builder: (context) => const OnboardingScreen()));
  // }
  void checkScreen(context) async {
    final data = await SharedPreferences.getInstance();
    final value = data.getString(sharedName);
    if (value == null) {
      Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => const OnboardingScreen()));
    } else {
      Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => const ScreenNavigation()));
    }
  }
}
