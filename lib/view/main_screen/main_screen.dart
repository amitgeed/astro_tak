import 'package:astro_tak/provider/main_screen_provider.dart';
import 'package:astro_tak/view/ask/ask_screen.dart';
import 'package:astro_tak/view/chat/chat_screen.dart';
import 'package:astro_tak/view/home/home_screen.dart';
import 'package:astro_tak/view/reports/reports_screen.dart';
import 'package:astro_tak/view/talk/talk_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MainScreen extends StatelessWidget {
  var _currentPage = [
    HomeScreen(),
    TalkScreen(),
    AskScreen(),
    ReportsScreen(),
    ChatScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    final mainScreenProvider = Provider.of<MainScreenNotifier>(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        title: Image.asset(
          'assets/logos/logo.png',
          height: MediaQuery.of(context).size.height * 0.04,
        ),
        leading: Padding(
          padding: EdgeInsets.all(5),
          child: IconButton(
            onPressed: () {},
            icon: Image.asset(
              'assets/logos/hamburger.png',
              height: MediaQuery.of(context).size.height * 0.025,
            ),
          ),
        ),
        actions: [
          Padding(
            padding: EdgeInsets.all(5),
            child: IconButton(
              onPressed: () {},
              icon: Image.asset(
                'assets/logos/profile.png',
                height: MediaQuery.of(context).size.height * 0.035,
              ),
            ),
          )
        ],
      ),
      drawer: Drawer(),
      body: _currentPage[mainScreenProvider.currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.deepOrange,
        selectedFontSize: 8,
        unselectedFontSize: 8,
        showUnselectedLabels: true,
        type: BottomNavigationBarType.fixed,
        currentIndex: mainScreenProvider.currentIndex,
        onTap: (index) {
          mainScreenProvider.setCurrentIndex = index;
        },
        items: [
          BottomNavigationBarItem(
            icon: Image.asset(
              'assets/logos/home.png',
              height: MediaQuery.of(context).size.height * 0.026,
            ),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Image.asset(
              'assets/logos/talk.png',
              height: MediaQuery.of(context).size.height * 0.026,
            ),
            label: 'Talk to Astrologer',
          ),
          BottomNavigationBarItem(
            icon: Image.asset(
              'assets/logos/ask.png',
              height: MediaQuery.of(context).size.height * 0.026,
            ),
            label: 'Ask Question',
          ),
          BottomNavigationBarItem(
            icon: Image.asset(
              'assets/logos/reports.png',
              height: MediaQuery.of(context).size.height * 0.026,
            ),
            label: 'Reports',
          ),
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.chat_bubble_2),
            label: 'Chat with Astrologer',
          )
        ],
      ),
    );
  }
}
