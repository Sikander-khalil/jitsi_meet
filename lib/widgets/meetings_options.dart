import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:zoom_clone/utils/colors.dart';

class MeetingsOption extends StatelessWidget {
  final String text;
  final bool isMuted;
  final Function(bool) onChange;
  const MeetingsOption({super.key, required this.text, required this.isMuted, required this.onChange});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      color: secondaryBackgroundColor,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [

          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(text, style: TextStyle(fontSize: 16),),
          ),
          Switch(value: isMuted, onChanged: onChange)
        ],
      ),
    );
  }
}
