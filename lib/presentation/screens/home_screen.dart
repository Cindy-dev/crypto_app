import 'package:crypto_app/presentation/widgets/stacked.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../utils/constants/colors.dart';
import '../widgets/coin_data_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        children: [
          Stack(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 88, left: 10),
                child: Image.asset(
                  'assets/images/Group 48095464.png',
                  fit: BoxFit.cover,
                ),
              ),
              const Stacked(),
            ],
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 24),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Text('Holdings',
                    style: TextStyle(
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w700,
                        color: wColor,
                        fontSize: 20)),
                Text('See All',
                    style: TextStyle(
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w500,
                        color: wColor,
                        decoration: TextDecoration.underline,
                        fontSize: 14))
              ],
            ),
          ),
          const CoinDataWidget()
        ],
      ),
    );
  }
}
