import 'dart:math';


import 'package:dozer_mobile/core/utils/colors.dart';
import 'package:dozer_mobile/core/utils/dynamic_colors.dart';
import 'package:dozer_mobile/core/utils/memji_colors.dart';
import 'package:dozer_mobile/presentation/bidding/quick_bid/presentation/ui/home/HomeRoomItem.dart';
import 'package:dozer_mobile/presentation/bidding/quick_bid/presentation/ui/home/HomeUpcoming.dart';
import 'package:dozer_mobile/presentation/bidding/quick_bid/screen_widgets.dart/squircle_icon_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final topics = [
      "🎨 Design",
      "🌍 Flutter",
      "🎯 Figma",
      "👀 Clone",
      "⛱ Saturday",
    ];
    final list = [

      Text(
        "Happening now",
        style: theme.textTheme.titleLarge,
      ),
      HomeRoomItem(),
      HomeRoomItem(),
      HomeRoomItem(),
    ];
    return Scaffold(
      extendBody: true,
     
      body: ListView.separated(
        padding: EdgeInsets.fromLTRB(20, 20, 20, 200),
        separatorBuilder: (_, __) => SizedBox(height: 10),
        itemCount: list.length,
        itemBuilder: (context, index) {
          return list[index];
        },
      ),
      
         
    );
  }
}
