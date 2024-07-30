import "package:flutter/material.dart";
import "package:zoom/widgets/home_meeting_button.dart";

class HistoryMeetingScreen extends StatelessWidget {
  const HistoryMeetingScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(children: [
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
    ]);
  }
}
