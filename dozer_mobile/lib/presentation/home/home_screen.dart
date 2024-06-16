// import 'package:convex_bottom_bar/convex_bottom_bar.dart';
// import 'package:dozer_mobile/core/routes/routes_name.dart';
// import 'package:dozer_mobile/core/utils/colors.dart';
// import 'package:dozer_mobile/dozer_exports.dart';
// import 'package:dozer_mobile/presentation/bidding/quick_bid/presentation/live_page.dart';
// import 'package:dozer_mobile/presentation/bidding/quick_bid/presentation/create_bid.dart';
// import 'package:dozer_mobile/presentation/bidding/quick_bid/presentation/recent_bids.dart';
// import 'package:dozer_mobile/presentation/bidding/quick_bid/presentation/ui/home/Home.dart';
// import 'package:dozer_mobile/presentation/bidding/quick_bid/presentation/ui/home/HomeUpcoming.dart';
// import 'package:dozer_mobile/presentation/bidding/quick_bid/presentation/ui/liveroom/LiveRoom.dart';
// import 'package:dozer_mobile/presentation/booking/booking_history.dart';
// import 'package:dozer_mobile/presentation/equipment_list/all_equipments_screen.dart';
// import 'package:dozer_mobile/presentation/equipment_list/screen_widgets/categories_widget.dart';
// import 'package:dozer_mobile/presentation/equipment_list/screen_widgets/custom_appbar.dart';
// import 'package:dozer_mobile/presentation/equipment_list/screen_widgets/recent_bids.dart';
// import 'package:dozer_mobile/presentation/equipment_list/screen_widgets/recommended_house.dart';
// import 'package:dozer_mobile/presentation/equipment_list/screen_widgets/search_input.dart';
// import 'package:dozer_mobile/presentation/equipment_list/screen_widgets/welcome_text.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_speed_dial/flutter_speed_dial.dart';
// import 'package:get/get.dart';

// class HomeScreen extends StatefulWidget {
//   @override
//   _HomeScreenState createState() => _HomeScreenState();
// }

// class _HomeScreenState extends State<HomeScreen> {
//   int _currentIndex = 0;
//   bool _isFabOpen = false;  // To track the FAB state

//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//       child: Scaffold(
//         backgroundColor: Theme.of(context).colorScheme.background,
//         appBar: CustomAppBar(),
//         body: Stack(
//           children: [
//             IndexedStack(
//               index: _currentIndex,
//               children: [
//                 SingleChildScrollView(
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       WelcomeText(),
//                       Padding(
//                         padding: EdgeInsets.only(left: 5.0, right: 5.0),
//                         child: Container(
//                           height: 50,
//                           width: double.infinity,
//                           child: SearchInput(),
//                         ),
//                       ),
//                       CategoriesWidget(),
//                       Container(
//                         height: 300,
//                         child: RecommendedHouse(),
//                       ),
//                       RecentBidsColumn(),
//                     ],
//                   ),
//                 ),
//                 QuickBidPage(), // Assuming this is your bid page
//                 BookingHistoryPage(), // Add your booking history page here
//                 Home()
//               ],
//             ),
//             if (_isFabOpen)
//               GestureDetector(
//                 onTap: () {
//                   setState(() {
//                     _isFabOpen = false;
//                   });
//                 },
//                 child: Container(
//                   color: Colors.black.withOpacity(0.5),
//                   width: double.infinity,
//                   height: double.infinity,
//                 ),
//               ),
//           ],
//         ),
//         floatingActionButton: SpeedDial(
//           animatedIcon: AnimatedIcons.add_event,
//           backgroundColor: primaryColor,
//           overlayColor: Colors.transparent,
//           onOpen: () {
//             setState(() {
//               _isFabOpen = true;
//             });
//           },
//           onClose: () {
//             setState(() {
//               _isFabOpen = false;
//             });
//           },
//           children: [
//             SpeedDialChild(
//               child: Icon(Icons.garage_outlined,color: Colors.white,),
//               backgroundColor: primaryColor,
//               label: 'Add Equipment',
//               onTap: () {
//                 Get.offNamed(RoutesName.createEquipment);
//                 setState(() {
//                   _isFabOpen = false;
//                 });
//               },
//             ),
//             SpeedDialChild(
//               child: Icon(Icons.gavel_rounded,color: Colors.white,),
//               backgroundColor: primaryColor,
//               label: 'Create Bid',
//               onTap: () {
//                 Navigator.push(
//                   context,
//                   MaterialPageRoute(builder: (context) => QuickBidPage()),
//                 );
//                 setState(() {
//                   _isFabOpen = false;
//                 });
//               },
//             ),
//           ],
//         ),
//         floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
//         bottomNavigationBar: ConvexAppBar(
//           style: TabStyle.react,
//           backgroundColor: Colors.white,
//           activeColor: primaryColor, // Customize the active color
//           color: Colors.grey, // Customize the inactive color
//           items: [
//             TabItem(icon: Icons.home, title: 'Home',),
//             TabItem(icon: Icons.garage_outlined, title: 'All Equipment'),
//             TabItem(icon: Icons.book, title: 'Bookings'),
//             TabItem(icon: Icons.gavel, title: 'Bid'),
//           ],
//           initialActiveIndex: _currentIndex,
//           onTap: (index) {
//             setState(() {
//               _currentIndex = index;
//             });
//           },
//         ),
//       ),
//     );
//   }
// }
import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:dozer_mobile/core/routes/routes_name.dart';
import 'package:dozer_mobile/core/utils/colors.dart';
import 'package:dozer_mobile/presentation/bidding/quick_bid/presentation/create_bid.dart';
// import 'package:dozer_mobile/presentation/bidding/quick_bid/presentation/quick_bid_page.dart';
import 'package:dozer_mobile/presentation/bidding/quick_bid/presentation/recent_bids.dart';
import 'package:dozer_mobile/presentation/bidding/quick_bid/presentation/ui/home/Home.dart';
import 'package:dozer_mobile/presentation/booking/booking_history.dart';
import 'package:dozer_mobile/presentation/equipment_list/all_equipments_screen.dart';
import 'package:dozer_mobile/presentation/equipment_list/screen_widgets/FinanacialReportScreen.dart';
import 'package:dozer_mobile/presentation/equipment_list/screen_widgets/categories_widget.dart';
import 'package:dozer_mobile/presentation/equipment_list/screen_widgets/custom_appbar.dart';
import 'package:dozer_mobile/presentation/equipment_list/screen_widgets/recommended_house.dart';
import 'package:dozer_mobile/presentation/equipment_list/screen_widgets/recent_bids.dart';
import 'package:dozer_mobile/presentation/equipment_list/screen_widgets/search_input.dart';
import 'package:dozer_mobile/presentation/equipment_list/screen_widgets/welcome_text.dart';
import 'package:dozer_mobile/presentation/profile_screen/profile_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:get/get.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0;
  bool _isFabOpen = false; // To track the FAB state
  bool isSubscribed = GetStorageHelper.getValue('isSubscribed');
  // print('')

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Theme.of(context).colorScheme.background,
        appBar: CustomAppBar(),
        drawer: Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: <Widget>[
              DrawerHeader(
                child: Image.asset('assets/images/logo.png'),
                decoration: BoxDecoration(
                  color:Colors.white, // Replace with your app's primary color
                ),
              ),
              ListTile(
                leading: Icon(Icons.person),
                title: Text('User Profile'),
                onTap: () {
                  Navigator.pop(context); // Close the drawer
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
                  Navigator.pop(context); // Close the drawer
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => FinancialReportScreen()),
                  );
                },
              ),
            ],
          ),
        ),
        body: Stack(
          children: [
            IndexedStack(
              index: _currentIndex,
              children: [
                SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      WelcomeText(),
                      Padding(
                        padding: EdgeInsets.only(left: 5.0, right: 5.0),
                        child: Container(
                          height: 50,
                          width: double.infinity,
                          child: SearchInput(),
                        ),
                      ),
                      CategoriesWidget(),
                      Container(
                        height: 300,
                        child: RecommendedHouse(),
                      ),
                      RecentBidsColumn(),
                    ],
                  ),
                ),
                EquipmentListPage(), // Assuming this is your bid page
                BookingHistoryPage(), // Add your booking history page here
                Home() // Add your booking history page here
              ],
            ),
            if (_isFabOpen)
              GestureDetector(
                onTap: () {
                  setState(() {
                    _isFabOpen = false;
                  });
                },
                child: Container(
                  color: Colors.black.withOpacity(0.5),
                  width: double.infinity,
                  height: double.infinity,
                ),
              ),
          ],
        ),
        floatingActionButton: SpeedDial(
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
                if (isSubscribed) {
                  Get.offNamed(RoutesName.createEquipment);
                } else {
                  Get.toNamed(
                      RoutesName.subscription); // Redirect to subscription page
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
                if (isSubscribed) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => QuickBidPage()),
                  );
                } else {
                  Get.toNamed(
                      RoutesName.subscription); // Redirect to subscription page
                }
                setState(() {
                  _isFabOpen = false;
                });
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
            TabItem(icon: Icons.garage_outlined, title: 'All Equipment'),
            TabItem(icon: Icons.book, title: 'Bookings'),
            TabItem(icon: Icons.gavel, title: 'Bid'),
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
