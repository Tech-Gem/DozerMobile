import 'package:dozer_mobile/core/utils/colors.dart';
import 'package:dozer_mobile/presentation/booking/booking_form.dart';
import 'package:dozer_mobile/presentation/booking/controllers/booking_controller.dart';
import 'package:dozer_mobile/dozer_exports.dart';
import 'package:flutter/material.dart';
import 'package:dozer_mobile/presentation/equipment_list/models/construction_machine.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

class DetailScreen extends StatelessWidget {
  final ConstructionMachineModel constructionMachine;

  DetailScreen({required this.constructionMachine});
  final controller = Get.put(BookingController());

  // Function to show reviews popup
  void _showReviewsPopup(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Reviews'),
          content: SingleChildScrollView(
            child: Column(
              children: [
                Text('Comment 1'),
                Text('Comment 2'),
                Text('Comment 3'),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Close'),
            ),
          ],
        );
      },
    );
  }

  // Function to make a call
  void _makePhoneCall(String phoneNumber) async {
    final Uri launchUri = Uri(
      scheme: 'tel',
      path: phoneNumber,
    );
    await launchUrl(launchUri);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.of(context).pop(),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              alignment: Alignment.topRight,
              children: [
                Container(
                  height: 250,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: NetworkImage(constructionMachine.image[0]),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Icon(Icons.bookmark_border, color: Colors.white),
                ),
              ],
            ),
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 5,
                    blurRadius: 7,
                    offset: Offset(0, 3),
                  ),
                ],
              ),
              child: Padding(
                padding: EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              constructionMachine.name,
                              style: TextStyle(
                                  fontSize: 24, fontWeight: FontWeight.bold),
                            ),
                            SizedBox(height: 8),
                            Row(
                              children: [
                                Icon(Icons.location_on, color: Colors.grey),
                                SizedBox(width: 4),
                                Text(
                                  constructionMachine.location,
                                  style: TextStyle(
                                      fontSize: 16, color: Colors.grey),
                                ),
                              ],
                            ),
                          ],
                        ),
                        Text(
                          '\$${constructionMachine.pricePerHour}/hr',
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.green),
                        ),
                      ],
                    ),
                    SizedBox(height: 16),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        _buildFeature(Icons.bed,
                            '${constructionMachine.quantity} Quantity'),
                        _buildFeature(Icons.bathroom,
                            '${constructionMachine.quantity} Rating'),
                        _buildFeature(Icons.kitchen,
                            '${constructionMachine.quantity} Comments'),
                      ],
                    ),
                    SizedBox(height: 16),
                    Text(
                      'Description',
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 8),
                    Text(
                      constructionMachine.description,
                      style: TextStyle(fontSize: 16),
                    ),
                    SizedBox(height: 16),
                    Card(
                      elevation: 2,
                      // shape: RoundedRectangleBorder(

                      // ),
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          children: [
                            Row(
                              children: [
                                CircleAvatar(
                                  backgroundImage: NetworkImage(
                                      'https://www.pngkey.com/png/full/114-1149878_setting-user-avatar-in-specific-size-without-breaking.png'),
                                ),
                                SizedBox(width: 8),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Sangvaleap',
                                      style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Text(
                                      'Property Owner',
                                      style: TextStyle(
                                          fontSize: 14, color: Colors.grey),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            SizedBox(height: 16),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                ElevatedButton(
                                  onPressed: () {
                                    Get.to(BookingForm(
                                      equipmentId: constructionMachine.id,
                                      availability:
                                          constructionMachine.quantity,
                                      equipmentName: constructionMachine.name,
                                      imageUrl: constructionMachine.image[0],
                                    ));
                                  },
                                  style: ElevatedButton.styleFrom(
                                    foregroundColor: primaryColor,
                                    backgroundColor: Colors.white,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10),
                                      side: BorderSide(color: primaryColor),
                                    ),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 24.0, vertical: 16.0),
                                    child: Text('Book Now',
                                        style: TextStyle(color: primaryColor)),
                                  ),
                                ),
                                ElevatedButton.icon(
                                  onPressed: () {
                                    _makePhoneCall('0925898533');
                                  },
                                  icon: Icon(Icons.call),
                                  label: Text('Call'),
                                  style: ElevatedButton.styleFrom(
                                    foregroundColor: Colors.white,
                                    backgroundColor: primaryColor,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildFeature(IconData icon, String text) {
    return Container(
      padding: EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        children: [
          Icon(icon, color: Colors.blue),
          SizedBox(height: 4),
          Text(
            text,
            style: TextStyle(fontSize: 14, color: Colors.blue),
          ),
        ],
      ),
    );
  }
}
