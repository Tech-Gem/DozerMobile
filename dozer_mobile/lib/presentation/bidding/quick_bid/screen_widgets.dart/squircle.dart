import 'dart:math';


import 'package:dozer_mobile/core/utils/memji_colors.dart';
import 'package:flutter/material.dart';

class Squircle extends StatelessWidget {
  const Squircle({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final random = Random.secure();
    return Container(
      height: 40,
      width: 40,
      decoration: BoxDecoration(
        color: MemojiColors.values[random.nextInt(MemojiColors.values.length)],
        borderRadius: BorderRadius.circular(16),
        image: DecorationImage(
          image: NetworkImage(
           "https://images.squarespace-cdn.com/content/v1/5921a34815d5dbdde23659de/1570301652232-9VSFS0PK5D27F6FPIW1X/47256809_2272782842945619_683046380633390517.jpg?format=2500w",
          ),
        ),
      ),
    );
  }
}