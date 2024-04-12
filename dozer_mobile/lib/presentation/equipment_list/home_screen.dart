import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:dozer_mobile/core/utils/colors.dart';
import 'package:dozer_mobile/presentation/equipment_list/all_equipments_screen.dart';
import 'package:dozer_mobile/presentation/equipment_list/screen_widgets/categories_widget.dart';
import 'package:dozer_mobile/presentation/equipment_list/screen_widgets/custom_appbar.dart';
import 'package:dozer_mobile/presentation/equipment_list/screen_widgets/recommended_house.dart';
import 'package:dozer_mobile/presentation/equipment_list/screen_widgets/search_input.dart';
import 'package:dozer_mobile/presentation/equipment_list/screen_widgets/welcome_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Theme.of(context).backgroundColor,
        appBar: CustomAppBar(),
        body: IndexedStack(
          index: _currentIndex,
          children: [
            SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  WelcomeText(),
                  Padding(
                    padding: const EdgeInsets.only(left: 30.0, right: 30),
                    child: SearchInput(),
                  ),
                  CategoriesWidget(),
                  RecommendedHouse(),
                ],
              ),
            ),
            EquipmentListPage(),
          ],
        ),
        floatingActionButton: SpeedDial(
          animatedIcon: AnimatedIcons.add_event,
          overlayColor: Colors.transparent,
          children: [
            SpeedDialChild(
              child: Icon(Icons.add_circle_outline),
              backgroundColor: primaryColor,
              label: 'Add Equipment',
              onTap: () {
                // Handle add equipment action
              },
            ),
            SpeedDialChild(
              child: Icon(Icons.create_outlined),
              backgroundColor: primaryColor,
              label: 'Create Bid',
              onTap: () {
                // Handle create bid action
              },
            ),
          ],
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        bottomNavigationBar: ConvexAppBar(
          style: TabStyle.react,
          backgroundColor: Colors.white,
          activeColor: primaryColor, // Customize the active color
          color: Colors.grey, // Customize the inactive color
          items: [
            TabItem(icon: Icons.home, title: 'Home'),
            TabItem(icon: Icons.gavel, title: 'All Equipment'),
            TabItem(icon: Icons.book, title: 'Bookings'),
            TabItem(icon: Icons.apps, title: 'Bid'),
          ],
          initialActiveIndex: _currentIndex,
          onTap: (index) {
            setState(() {
              _currentIndex = index;
            });
          },
        ),
      ),
    );
  }
}
