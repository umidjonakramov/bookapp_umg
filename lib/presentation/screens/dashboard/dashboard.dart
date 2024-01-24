import 'package:bookapp_umg/presentation/screens/dashboard/page/home.dart';
import 'package:bookapp_umg/presentation/screens/dashboard/page/library.dart';
import 'package:bookapp_umg/presentation/screens/play/play.dart';
import 'package:bookapp_umg/presentation/screens/dashboard/page/profile.dart';
import 'package:bookapp_umg/presentation/screens/dashboard/page/search.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int currentTab = 0;

  final List<Widget> screens = [
    const HomeScreen(),
    const LibraryScreen(),
    const ProfileScreen(),
    const SearchScreen()
  ];

  final PageStorageBucket bucket = PageStorageBucket();

  Widget currentScreen = const HomeScreen();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageStorage(
        bucket: bucket,
        child: currentScreen,
      ),
      floatingActionButton: FloatingActionButton(
        shape: RoundedRectangleBorder(side: const BorderSide(width: 3,color: Colors.white),borderRadius: BorderRadius.circular(100)),
        backgroundColor: const Color(0xFFF26B6C),
        onPressed: () {
          // Navigator.pushNamed(context, 'play');
        },
        child:  const Icon(Icons.play_arrow, color: Colors.white),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        surfaceTintColor: const Color(0xff7d7d7d),
        shape: const CircularNotchedRectangle(),
        notchMargin: 10,
        elevation: 1,
        child: Container(
          height: 60,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  MaterialButton(
                    minWidth: 40,
                    onPressed: () {
                      setState(() {
                        currentScreen = const HomeScreen();
                        currentTab = 0;
                      });
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.home, color: currentTab == 0 ? const Color(0xFFF26B6C) : const Color(0xFF7D7D7D)),
                        Text(
                          'Home',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: currentTab == 0 ? const Color(0xFFF26B6C) : const Color(0xFF7D7D7D),
                            fontSize: 11,
                            fontWeight: FontWeight.w500,
                            height: 0,
                          ),
                        )
                      ],
                    ),
                  ),
                  MaterialButton(
                    minWidth: 40,
                    onPressed: () {
                      setState(() {
                        currentScreen = SearchScreen();
                        currentTab = 1;
                      });
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.search, color: currentTab == 1 ? const Color(0xFFF26B6C) : const Color(0xFF7D7D7D)),
                        Text(
                          'Search',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: currentTab == 1 ? const Color(0xFFF26B6C) : const Color(0xFF7D7D7D),
                            fontSize: 11,
                            fontWeight: FontWeight.w500,
                            height: 0,
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  MaterialButton(
                    minWidth: 40,
                    onPressed: () {
                      setState(() {
                        currentScreen = const LibraryScreen();
                        currentTab = 2;
                      });
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.menu_book, color: currentTab == 2 ? const Color(0xFFF26B6C) : const Color(0xFF7D7D7D)),
                        Text(
                          'Library',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: currentTab == 2 ? const Color(0xFFF26B6C) : const Color(0xFF7D7D7D),
                            fontSize: 11,
                            fontWeight: FontWeight.w500,
                            height: 0,
                          ),
                        )
                      ],
                    ),
                  ),
                  MaterialButton(
                    minWidth: 40,
                    onPressed: () {
                      setState(() {
                        currentScreen = ProfileScreen();
                        currentTab = 3;
                      });
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.person, color: currentTab == 3 ? const Color(0xFFF26B6C) : const Color(0xFF7D7D7D)),
                        Text(
                          'Profile',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: currentTab == 3 ? const Color(0xFFF26B6C) : const Color(0xFF7D7D7D),
                            fontSize: 11,
                            fontWeight: FontWeight.w500,
                            height: 0,
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
