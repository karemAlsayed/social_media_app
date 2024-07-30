import 'package:flutter/material.dart';

import 'package:motion_tab_bar/MotionTabBar.dart';
import 'package:social_media_app/colors/app_colors.dart';
import 'package:social_media_app/screens/add.dart';
import 'package:social_media_app/screens/home.dart';
import 'package:social_media_app/screens/profile.dart';
import 'package:social_media_app/screens/search.dart';

class LayoutPage extends StatefulWidget {
  const LayoutPage({super.key});

  @override
  State<LayoutPage> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<LayoutPage> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    List<Widget> myPages = [
      const HomePage(),
      const AddPage(),
      const SearchPage(),
      const ProfilePage(),
    ];

    return Scaffold(
      body: myPages[currentIndex],
      bottomNavigationBar: MotionTabBar(
        useSafeArea: true,
        initialSelectedTab: "Home",
        labels: const ["Home", "New Post", "Search", "Profile"],
        icons: const [
          Icons.home,
          Icons.add,
          Icons.search,
          Icons.person,
        ],
        tabSize: 50,
        tabBarHeight: 55,
        textStyle: const TextStyle(
          fontSize: 12,
          color: Colors.black,
          fontWeight: FontWeight.w500,
        ),
        tabIconColor: kSecondaryColor,
        tabIconSize: 28.0,
        tabIconSelectedSize: 26.0,
        tabSelectedColor: kPrimaryColor,
        tabIconSelectedColor: Colors.white,
        tabBarColor: Colors.white,
        onTabItemSelected: (int value) {
          setState(() {
            currentIndex = value;
          
          });
        },
        
      ),
//       bottomNavigationBar:FlashyTabBar(
//      selectedIndex: currentIndex,
//      showElevation: true,
//      iconSize: 25,

//      onItemSelected: (index) => setState(() {
//        currentIndex = index;
//      }),
//      items: [
//         FlashyTabBarItem(
//           icon:  const Icon(Icons.home,),
//           title: const Text('Home'),
//         ),
//         FlashyTabBarItem(
//           icon: const Icon(Icons.add),
//           title: const Text('Add'),
//         ),
//         FlashyTabBarItem(
//           icon: const Icon(Icons.search),
//           title: const Text('Search'),
//         ),
//         FlashyTabBarItem(
//           icon: const Icon(Icons.person),
//           title: const Text('Profile'),
//         ),

//       ],
// ),
      // bottomNavigationBar: NavigationBar(
      //     onDestinationSelected: (value) => setState(() {
      //       currentIndex = value;
      //     }),

      //     selectedIndex: currentIndex,
      //     destinations: const [
      //   NavigationDestination(icon: Icon(Icons.home), label: 'home'),
      //   NavigationDestination(icon: Icon(Icons.add), label: 'add'),
      //   NavigationDestination(icon: Icon(Icons.search), label: 'search'),
      //   NavigationDestination(icon: Icon(Icons.person), label: 'profile'),
      // ]),
    );
  }
}
