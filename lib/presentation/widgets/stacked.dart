import 'package:crypto_app/presentation/utils/constants/device_size.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../utils/constants/colors.dart';

class Stacked extends StatelessWidget {
  const Stacked({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 50, left: 25, right: 25),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const CircleAvatar(
                backgroundColor: pColor,
              ),
              IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.settings,
                    color: wColor,
                  ))
            ],
          ),
          Container(
            alignment: Alignment.centerLeft,
            padding: const EdgeInsets.only(top: 16, bottom: 6),
            child: const Text('Hello Cindy',
                style: TextStyle(
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w500,
                    color: wColor,
                    fontSize: 24)),
          ),
          Container(
            alignment: Alignment.centerLeft,
            height: 100,
            width: context.screenHeight() / 2.66,
            padding: const EdgeInsets.only(left: 20),
            decoration: BoxDecoration(
              gradient: const LinearGradient(
                  end: Alignment.centerRight,
                  begin: Alignment.bottomCenter,
                  colors: [
                    gColor1,
                    gColor2,
                    gColor3,
                    gColor4,
                    gColor5,
                  ]),
              borderRadius: BorderRadius.circular(16),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                SizedBox(
                  height: 12,
                ),
                Text('Current Balance',
                    style: TextStyle(
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w400,
                        color: tColor,
                        fontSize: 16)),
                SizedBox(height: 16),
                Text('\$87,430.12',
                    style: TextStyle(
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w700,
                        color: tBColor,
                        fontSize: 24)),
                SizedBox(
                  height: 12,
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
