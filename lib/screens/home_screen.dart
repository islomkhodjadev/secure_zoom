import "package:flutter/material.dart";
import "package:zoom/utils/colors.dart";
import "package:zoom/widgets/home_meeting_button.dart";

class HomeScreen extends StatefulWidget {
  HomeScreen({super.key});

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: const Text("Meet & chat"),
        centerTitle: true,
      ),
      body: Column(children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            HomeMeetingButton(
                onpressed: () {}, icon: Icons.videocam, text: "New Meeting"),
            HomeMeetingButton(
                onpressed: () {},
                icon: Icons.add_box_rounded,
                text: "Join Meeting"),
            HomeMeetingButton(
                onpressed: () {},
                icon: Icons.calendar_today,
                text: "Schedule meeting"),
            HomeMeetingButton(
                onpressed: () {},
                icon: Icons.arrow_upward_rounded,
                text: "Share screen")
          ],
        ),
        const Expanded(
            child: Center(
          child: Text(
            "Create/Join Meetings with just a click!",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 19),
          ),
        ))
      ]),
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
