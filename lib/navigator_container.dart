import 'package:flutter/material.dart';
import 'package:tiktok_clone/Pages/add_video_page.dart';
import 'package:tiktok_clone/Pages/discover_page.dart';
import 'package:tiktok_clone/Pages/home_page.dart';
import 'package:tiktok_clone/Pages/index_page.dart';
import 'package:tiktok_clone/Pages/profile_page.dart';
import 'package:tiktok_clone/Widgets/cusstom_button_navigation_bar.dart';

class NavigatorContainer extends StatefulWidget {
  const NavigatorContainer({Key? key}) : super(key: key);

  @override
  State<NavigatorContainer> createState() => _NavigatorContainerState();
}

class _NavigatorContainerState extends State<NavigatorContainer> {
  int _selectedPageIndex = 0;

  static const List<Widget> _pages = [
    HomePage(),
    DiscoverPage(),
    AddVideoButtonPage(),
    IndexPage(),
    ProfilePage()
  ];

  void _onIconTapped(int index) {
    setState(() {
      _selectedPageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
          child: _pages[_selectedPageIndex],
        ),
        bottomNavigationBar: CustomButtonNavigationBar(
          selectedPageIndex: _selectedPageIndex,
          onIconTap: _onIconTapped,
        ));
  }
}
