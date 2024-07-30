import "package:flutter/material.dart";
import "package:zoom/screens/history_meeting_screen.dart";
import "package:zoom/screens/meeting_screen.dart";
import "package:zoom/utils/colors.dart";

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _page = 0;

  onPageChanged(int page) {
    setState(() {
      _page = page;
    });
  }

  List<Widget> pages = [
    MeetingScreen(),
    const HistoryMeetingScreen(),
    const Text("Contacts"),
    const Text("Meet & chat"),
    const Text("Settings"),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: const Text("Meet & chat"),
        centerTitle: true,
      ),
      body: pages[_page],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: footerColor,
        currentIndex: _page,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.grey,
        onTap: onPageChanged,
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.comment_bank), label: "Meet & Chat"),
          BottomNavigationBarItem(
              icon: Icon(Icons.lock_clock), label: "Meeting"),
          BottomNavigationBarItem(
              icon: Icon(Icons.person_outline), label: "Contacts"),
          BottomNavigationBarItem(
              icon: Icon(Icons.comment_bank), label: "Meet & Chat"),
          BottomNavigationBarItem(
              icon: Icon(Icons.settings_outlined), label: "Settings")
        ],
      ),
    );
  }
}
