import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:social_media_app/colors/app_colors.dart';
import 'package:social_media_app/screens/add.dart';
import 'package:social_media_app/screens/home.dart';
import 'package:social_media_app/screens/profile.dart';
import 'package:social_media_app/screens/search.dart';
import 'package:social_media_app/user_provider.dart';

class LayoutPage extends StatefulWidget {
  const LayoutPage({super.key});

  @override
  State<LayoutPage> createState() => _LayoutPageState();
}

class _LayoutPageState extends State<LayoutPage> {
  int currentIndex = 0;
  PageController pageCon = PageController();
  @override
  void initState() {
    Provider.of<UserProvider>(context, listen: false).getDetails();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Provider.of<UserProvider>(context).isLoad
        ? const Scaffold(
            body: Center(
              child: CircularProgressIndicator(),
            ),
          )
        : Scaffold(
            resizeToAvoidBottomInset: false,
            extendBody: true,
            body: PageView(
              controller: pageCon,
              children:const [
                HomePage(),
                AddPage(),
                SearchPage(),
                ProfilePage(),
              ],
              onPageChanged: (value) => setState(() {
                currentIndex = value;
              }),
            ),
            bottomNavigationBar: NavigationBar(
              onDestinationSelected: (value) => setState(() {
                currentIndex = value;
                pageCon.jumpToPage(value);
              }),
              elevation: 0,
              backgroundColor: kWhiteColor.withOpacity(0.8),
              selectedIndex: currentIndex,
              indicatorColor: kPrimaryColor.withOpacity(0.2),
              destinations: [
                NavigationDestination(
                  icon: const Icon(Icons.home),
                  label: "Home",
                  selectedIcon: Icon(
                    Icons.home,
                    color: kPrimaryColor,
                  ),
                ),
                NavigationDestination(
                  icon: const Icon(Icons.add),
                  label: "add",
                  selectedIcon: Icon(
                    Icons.add,
                    color: kPrimaryColor,
                  ),
                ),
                NavigationDestination(
                  icon: const Icon(Icons.search),
                  label: "Search",
                  selectedIcon: Icon(
                    Icons.search,
                    color: kPrimaryColor,
                  ),
                ),
                NavigationDestination(
                  icon: const Icon(Icons.person),
                  label: "Profile",
                  selectedIcon: Icon(
                    Icons.person,
                    color: kPrimaryColor,
                  ),
                ),
              ],
            ));
  }
}
