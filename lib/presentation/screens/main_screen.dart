import 'package:crypto_app/presentation/screens/home_screen.dart';
import 'package:crypto_app/presentation/utils/constants/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  //remove from screen later
  int _selectedIndex = 0;
  static final List<Widget> _screenOptions = <Widget>[
    const HomeScreen(),
    const HomeScreen(),
    const HomeScreen(),
  ];
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screenOptions.elementAt(_selectedIndex),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.black,
        onTap: _onItemTapped,
        currentIndex: _selectedIndex,
        selectedItemColor: pColor,
        unselectedItemColor: wColor,
        items: const [
          BottomNavigationBarItem(
              icon: ImageIcon(AssetImage('assets/images/Glyph.png')),
              label: ''),
          BottomNavigationBarItem(
              icon: ImageIcon(
                  AssetImage('assets/images/exchange-funds-line.png')),
              label: ''),
          BottomNavigationBarItem(
              icon: ImageIcon(AssetImage('assets/images/user-3-line.png')),
              label: ''),
        ],
      ),
    );
  }
}
