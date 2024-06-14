import 'package:dozer_mobile/core/data/apis/api_response_status.dart';
import 'package:dozer_mobile/presentation/booking/models/booking_form_model.dart';
import 'package:dozer_mobile/presentation/equipment_list/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:dozer_mobile/presentation/booking/controllers/booking_controller.dart';


class BookingHistoryPage extends StatelessWidget {
  final BookingController _bookingController = Get.put(BookingController());
  final TextEditingController _searchController = TextEditingController();

  BookingHistoryPage() {
    // Call loadBookingHistory() when the page starts
    _bookingController.loadBookingHistory();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        // Navigate back to the home screen when back button is pressed
        Get.offAll(() => HomeScreen());
        return false; // Prevent default back navigation
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text('Booking History'),
          actions: [
            IconButton(
              onPressed: () {
                // Perform search based on the entered text
                _bookingController.searchBookings(_searchController.text);
              },
              icon: Icon(Icons.search),
            ),
          ],
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: _searchController,
                decoration: InputDecoration(
                  labelText: 'Search...',
                  suffixIcon: IconButton(
                    icon: Icon(Icons.clear),
                    onPressed: () {
                      // Clear the search text
                      _searchController.clear();
                      // Reset search
                      _bookingController.searchBookings('');
                    },
                  ),
                ),
                onChanged: (value) {
                  // Perform search on text change
                  _bookingController.searchBookings(value);
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _buildToggle('Ongoing', true),
                  _buildToggle('Ended', false),
                ],
              ),
            ),
            Expanded(
              child: Obx(
                () {
                  // Check status and show appropriate UI
                  switch (_bookingController.status.value) {
                    case Status.loading:
                      return Center(child: CircularProgressIndicator());
                    case Status.completed:
                      return _buildBookingList();
                    case Status.error:
                      return Center(
                        child: Text('Failed to load booking history'),
                      );
                    default:
                      return SizedBox(); // Return an empty widget by default
                  }
                },
              ),
            ),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            // Refresh booking history
            _bookingController.loadBookingHistory();
          },
          child: Icon(Icons.refresh),
        ),
      ),
    );
  }

  Widget _buildToggle(String text, bool isOngoing) {
    return ElevatedButton(
      onPressed: () {
        _bookingController.toggleOngoing(isOngoing);
      },
      style: ElevatedButton.styleFrom(
        foregroundColor: _bookingController.isOngoing.value == isOngoing ? Colors.blue : null,
      ),
      child: Text(text),
    );
  }

  Widget _buildBookingList() {
    List<BookingModel> bookings = _bookingController.filteredBookings.reversed.toList();
    return ListView.builder(
      itemCount: bookings.length,
      itemBuilder: (context, index) {
        var booking = bookings[index];
        return BookingCard(
          booking: booking,
        );
      },
    );
  }
}

class BookingCard extends StatelessWidget {
  final BookingModel booking;

  const BookingCard({Key? key, required this.booking}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      elevation: 2,
      child: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              booking.equipmentName!,
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Text(
              'Location: ${booking.location}',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 8),
            Text(
              'Start Date: ${booking.startDate}',
              style: TextStyle(fontSize: 14, color: Colors.grey),
            ),
            Text(
              'End Date: ${booking.endDate}',
              style: TextStyle(fontSize: 14, color: Colors.grey),
            ),
            // Add other booking details here...
          ],
        ),
      ),
    );
  }
}
