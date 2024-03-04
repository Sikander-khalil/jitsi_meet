import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:zoom_clone/screens/join_meet.dart';

import '../resources/jtisi_meetings_methods.dart';
import '../widgets/home_meetings_button.dart';

class MeetingsScreen extends StatelessWidget {
  MeetingsScreen({
    super.key,
  });

  final JitsiMeetMethods _jitsiMeetMethods = JitsiMeetMethods();

  createMeetings() async {
    var rendom = Random();
    String roomName = (rendom.nextInt(10000000) + 10000000).toString();

    _jitsiMeetMethods.createNewMeetings(
        roomName: roomName, isAudioMuted: true, isVideoMuted: true);
  }

  joinMeetings(BuildContext context) async {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => JoinScreen()));
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            HomeMeetingsButton(
              onPressed: createMeetings,
              icon: Icons.video_camera_back,
              text: 'New Meetings',
            ),
            HomeMeetingsButton(
              onPressed: () => joinMeetings(context),
              // Removed parentheses here
              icon: Icons.add_box_rounded,
              text: 'Join Meetings',
            ),
            HomeMeetingsButton(
              onPressed: () {},
              icon: Icons.calendar_today,
              text: 'Schedule',
            ),
            HomeMeetingsButton(
              onPressed: () {},
              icon: Icons.arrow_upward,
              text: 'Share Scren',
            ),
          ],
        ),
        Expanded(
            child: Center(
          child: Text(
            "Create/ Join Meeting With just a Click!",
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
        ))
      ],
    );
  }
}
