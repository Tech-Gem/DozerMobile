import 'package:dozer_mobile/core/utils/colors.dart';
import 'package:dozer_mobile/presentation/bidding/quick_bid/controllers/bid_controller.dart';
import 'package:dozer_mobile/presentation/bidding/quick_bid/models/bidding_response.dart';
import 'package:dozer_mobile/presentation/bidding/quick_bid/presentation/live_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class QuickBidPage extends StatefulWidget {
  const QuickBidPage({Key? key}) : super(key: key);

  @override
  State<QuickBidPage> createState() => _QuickBidPageState();
}

class _QuickBidPageState extends State<QuickBidPage> {
  final titleController = TextEditingController();
  final minBudgetController = TextEditingController();
  final maxBudgetController = TextEditingController();
  final descriptionController = TextEditingController();
  final BidController _bidController = Get.put(BidController());

  bool isHost = false;
  String category = 'Category 1';

  @override
  void dispose() {
    titleController.dispose();
    minBudgetController.dispose();
    maxBudgetController.dispose();
    descriptionController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: primaryColor,
        title: const Text(
          'Create Live Audio Bidding Room',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset(
                'assets/images/bid.svg', // Add your SVG image URL here
                width: double.infinity,
                height: 100,
              ),
              const SizedBox(
                height: 15,
              ),
              const Center(
                child: Text(
                  'Create bid',
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0), // Add rounded border to form
                  border: Border.all(color: Colors.grey), // Add border color
                ),
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    children: [
                      TextField(
                        controller: titleController,
                        decoration: const InputDecoration(
                          labelText: 'Title',
                          contentPadding: EdgeInsets.all(10.0),
                          border: InputBorder.none,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              Container(
                height: 200,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0), // Add rounded border to form
                  border: Border.all(color: Colors.grey), // Add border color
                ),
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: TextField(
                    controller: descriptionController,
                    maxLines: null,
                    decoration: const InputDecoration(
                      labelText: 'Description',
                      contentPadding: EdgeInsets.all(10.0),
                      border: InputBorder.none,
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0), // Add rounded border to form
                  border: Border.all(color: Colors.grey), // Add border color
                ),
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: TextField(
                    controller: minBudgetController,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(
                      labelText: 'Min Budget',
                      border: InputBorder.none,
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0), // Add rounded border to form
                  border: Border.all(color: Colors.grey), // Add border color
                ),
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: TextField(
                    controller: maxBudgetController,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(
                      labelText: 'Max Budget',
                      border: InputBorder.none,
                    ),
                    onChanged: (value) {
                      setState(() {
                        int minBudget = int.tryParse(minBudgetController.text) ?? 0;
                        int maxBudget = int.tryParse(value) ?? 0;
                        if (maxBudget < minBudget) {
                          maxBudgetController.text = minBudget.toString();
                        }
                      });
                    },
                  ),
                ),
              ),
              const SizedBox(
                height: 16,
              ),
ElevatedButton(
  onPressed: () async {
    try {
      print(titleController.text);
      print(descriptionController.text);
      print(int.parse(minBudgetController.text));
      
      _bidController.createBid(
        titleController.text,
        descriptionController.text,
        int.parse(minBudgetController.text),
        int.parse(maxBudgetController.text),
      ).then((BidResponse bidResponse) {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) {
            return LivePage(
              roomID: bidResponse.roomId,  
              isHost: true,
              userName: bidResponse.userName, // Adjust based on your implementation
            
              userId: bidResponse.userId,
              // title: bidResponse.title, description: bidResponse.description, // Adjust based on your implementation
            );
          }),
        );
      }).catchError((error) {
        // Handle error if any
        print('Error: $error');
      });
    } catch (e) {
      print('Error creating bid: $e');
    }
  },
  style: ElevatedButton.styleFrom(
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(10.0), // Add rounded border to button
    ),
    backgroundColor: primaryColor,
    foregroundColor: Colors.white,
    fixedSize: const Size(400, 50),
  ),
  child: Text(
    'Create Room', // Change text based on isHost value
    style: const TextStyle(
      fontWeight: FontWeight.bold,
      fontSize: 16,
    ),
  ),
),

            ],
          ),
        ),
      ),
    );
  }
}
