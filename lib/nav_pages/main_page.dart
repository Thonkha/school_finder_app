import 'package:school_finder_app/nav_pages/bar_item_page.dart';
import 'package:school_finder_app/nav_pages/home_page.dart';
import 'package:school_finder_app/nav_pages/my_page.dart';
import 'package:school_finder_app/nav_pages/search_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class MainPage extends StatefulWidget {
  MainPage({Key? key}) : super(key: key);

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  List pages = [HomePage(), BarItemPage(), SearchPage(),MyPage()];

  int currentIndex = 0;
  void onTap(int index) {
    setState(() {
      currentIndex = index;
    });
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
          unselectedFontSize: 0,
          selectedFontSize: 0,
          type: BottomNavigationBarType.fixed,
          backgroundColor: Colors.white,
          onTap: onTap,
          currentIndex: currentIndex,
          selectedItemColor: Colors.black54,
          unselectedItemColor: Colors.grey.withOpacity(0.5),
          showUnselectedLabels: false,
          showSelectedLabels: false,
          elevation: 0,
          items: const [
            BottomNavigationBarItem(label: "Home", icon: Icon(Icons.apps)),
            BottomNavigationBarItem(
                label: "About", icon: Icon(Icons.bar_chart_sharp)),
            BottomNavigationBarItem(label: "Search", icon: Icon(Icons.search)),
            BottomNavigationBarItem(label: "Me", icon: Icon(Icons.person))
          ]),
    );
  }
}
