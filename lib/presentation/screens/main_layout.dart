import 'package:flutter/material.dart';

import '../widgets/main_layout_widgets/bottom_nav_bar_widget.dart';
import 'home_screen.dart';

class MainLayoutScreen extends StatefulWidget {
  const MainLayoutScreen({Key? key}) : super(key: key);

  @override
  State<MainLayoutScreen> createState() => _MainLayoutScreenState();
}

class _MainLayoutScreenState extends State<MainLayoutScreen> {
  int currentScreenIndex = 0;
  List<Widget> screensList =[
    HomeScreen(),
    Scaffold(),
    Scaffold(),
    Scaffold(),
  ];
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: screensList[currentScreenIndex],
        bottomNavigationBar: BottomNavBarWidget(
          selectedIndex: currentScreenIndex,
          onChanged: (int index) {
            if(currentScreenIndex!=index){

              setState(() {
                currentScreenIndex = index;
              });
              print(currentScreenIndex);
            }
          },
        ),
      ),
    );
  }
}
