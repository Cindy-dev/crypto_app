import 'package:crypto_app/presentation/screens/home_screen.dart';
import 'package:crypto_app/presentation/screens/main_screen.dart';
import 'package:crypto_app/presentation/utils/constants/app_keys.dart';
import 'package:crypto_app/presentation/utils/constants/colors.dart';
import 'package:crypto_app/presentation/utils/constants/device_size.dart';
import 'package:crypto_app/presentation/utils/constants/navigators.dart';
import 'package:flutter/material.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 30, left: 24),
            child: RichText(
                text: const TextSpan(
                    text: 'Crypt',
                    style: TextStyle(
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w700,
                        color: wColor,
                        fontSize: 64),
                    children: [
                  TextSpan(
                      text: 'X',
                      style: TextStyle(
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w700,
                          color: pColor,
                          fontSize: 64))
                ])),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 37),
            child: Image.asset('assets/images/Shape 1.png'),
          ),
          const Padding(
            padding: EdgeInsets.only(left: 24, bottom: 24),
            child: Text('Jump start your\ncrypto portfolio',
                style: TextStyle(
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w600,
                    color: wColor,
                    fontSize: 32)),
          ),
          const Padding(
            padding: EdgeInsets.only(left: 24, bottom: 44),
            child: Text('Take your investment portfolio\nto next level',
                style: TextStyle(
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w500,
                    color: wColor,
                    fontSize: 14)),
          ),
          const Spacer(),
          GestureDetector(
            onTap: () => navigatePush(context, const MainScreen()),
            key: getStartedButton,
            child: Container(
              height: context.screenHeight() / 15,
              alignment: Alignment.center,
              margin: const EdgeInsets.only(left: 24, right: 24),
              decoration: BoxDecoration(
                  color: pColor, borderRadius: BorderRadius.circular(16)),
              child: const Text('Get Started',
                  style: TextStyle(
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w500,
                      color: wColor,
                      fontSize: 16)),
            ),
          ),
          const Spacer(),
        ],
      ),
    );
  }
}
