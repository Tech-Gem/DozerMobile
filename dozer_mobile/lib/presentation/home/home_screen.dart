import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:dozer_mobile/core/routes/routes_name.dart';
import 'package:dozer_mobile/core/utils/colors.dart';
import 'package:dozer_mobile/core/utils/get_storage_helper.dart';
import 'package:dozer_mobile/presentation/bidding/quick_bid/presentation/create_bid.dart';
import 'package:dozer_mobile/presentation/bidding/quick_bid/presentation/ui/home/Home.dart';
import 'package:dozer_mobile/presentation/booking/booking_history.dart';
import 'package:dozer_mobile/presentation/chatbot/presentation/screens/chat_page.dart';
import 'package:dozer_mobile/presentation/equipment_list/all_equipments_screen.dart';
import 'package:dozer_mobile/presentation/equipment_list/screen_widgets/FinanacialReportScreen.dart';
import 'package:dozer_mobile/presentation/equipment_list/screen_widgets/category_filter_widget.dart';
import 'package:dozer_mobile/presentation/equipment_list/screen_widgets/list_widget.dart';
import 'package:dozer_mobile/presentation/equipment_list/screen_widgets/recommended_house.dart';
import 'package:dozer_mobile/presentation/home/widgets/custom_appbar.dart';
import 'package:dozer_mobile/presentation/profile_screen/profile_screen.dart';
import 'package:dozer_mobile/presentation/subscription/controllers/subscription_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:get/get.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0;
  bool _isFabOpen = false;
  bool isSubscribed = GetStorageHelper.getValue('isSubscribed');
  final controller = Get.put(SubscriptionController());

  @override
  Widget build(BuildContext context) {
    final userName = GetStorageHelper.getValue('userName');
    final image = GetStorageHelper.getValue('profileImage');

    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xFFFAFAFA), // Set background to white
        appBar: CustomAppBar(
          userName: GetStorageHelper.getValue('userName'),
          profileImageUrl: GetStorageHelper.getValue('profileImage'),
        ),
        drawer: Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: <Widget>[
              DrawerHeader(
                child: Image.asset('assets/images/logo.png'),
                decoration: BoxDecoration(
                  color: Colors.white,
                ),
              ),
              ListTile(
                leading: Icon(Icons.person),
                title: Text('User Profile'),
                onTap: () {
                  Navigator.pop(context);
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => ProfileScreen()),
                  );
                },
              ),
              ListTile(
                leading: Icon(Icons.bar_chart),
                title: Text('Financial Report'),
                onTap: () {
                  Navigator.pop(context);
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => FinancialReportScreen()),
                  );
                },
              ),
            ],
          ),
        ),
        body: IndexedStack(
          index: _currentIndex,
          children: [
            SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.all(10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CategoryFilterWidget(),
                    SizedBox(height: 5),
                    RecommendedHouse(),
                    SizedBox(height: 20),
                    ListEquipment(),
                  ],
                ),
              ),
            ),
            EquipmentListPage(),
            BookingHistoryPage(),
            Home(),
            ChatPage(), // Add your ChatPage here
          ],
        ),
        floatingActionButton: (_currentIndex != 4)
            ? SpeedDial(
                animatedIcon: AnimatedIcons.add_event,
                backgroundColor: primaryColor,
                overlayColor: Colors.transparent,
                onOpen: () {
                  setState(() {
                    _isFabOpen = true;
                  });
                },
                onClose: () {
                  setState(() {
                    _isFabOpen = false;
                  });
                },
                children: [
                  SpeedDialChild(
                    child: Icon(Icons.garage_outlined, color: Colors.white),
                    backgroundColor: primaryColor,
                    label: 'Add Equipment',
                    onTap: () {
                      if (controller.isSubscribed.value) {
                        Get.offNamed(RoutesName.createEquipment);
                      } else {
                        Get.toNamed(RoutesName.subscription);
                      }
                      setState(() {
                        _isFabOpen = false;
                      });
                    },
                  ),
                  SpeedDialChild(
                    child: Icon(Icons.gavel_rounded, color: Colors.white),
                    backgroundColor: primaryColor,
                    label: 'Create Bid',
                    onTap: () {
                      if (controller.isSubscribed.value) {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => QuickBidPage()),
                        );
                      } else {
                        Get.toNamed(RoutesName.subscription);
                      }
                      setState(() {
                        _isFabOpen = false;
                      });
                    },
                  ),
                ],
              )
            : null,
        floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
        bottomNavigationBar: ConvexAppBar(
          style: TabStyle.react,
          backgroundColor: Colors.white,
          activeColor: primaryColor,
          color: Colors.grey,
          items: [
            TabItem(icon: Icons.home, title: 'Home'),
            TabItem(icon: Icons.garage_outlined, title: 'All Equipment'),
            TabItem(icon: Icons.book, title: 'Bookings'),
            TabItem(icon: Icons.gavel, title: 'Bid'),
            TabItem(
                icon: Icons.chat_bubble,
                title: 'ChatBot'), // New tab for ChatBot
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
