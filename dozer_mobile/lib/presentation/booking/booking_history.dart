import 'package:dozer_mobile/core/data/apis/api_response_status.dart';
import 'package:dozer_mobile/core/theme/colors.dart';
import 'package:dozer_mobile/presentation/booking/models/booking_form_model.dart';
import 'package:dozer_mobile/presentation/home/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:dozer_mobile/presentation/booking/controllers/booking_controller.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BookingHistoryPage extends StatelessWidget {
  final BookingController _bookingController = Get.put(BookingController());
  final TextEditingController _searchController = TextEditingController();

  BookingHistoryPage() {
    _bookingController.loadBookingHistory();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        Get.offAll(() => HomeScreen());
        return false;
      },
      child: DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            title: const Text('Booking History'),
            backgroundColor: AppColors.primaryColor,
            bottom: TabBar(
              indicatorColor: Colors.white,
              labelColor: Colors.white,
              unselectedLabelColor: Colors.black,
              tabs: [
                Tab(text: 'Ongoing'),
                Tab(text: 'Ended'),
              ],
            ),
          ),
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Padding(
                  padding: EdgeInsets.all(8.0.w),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12.r),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.1),
                          spreadRadius: 2,
                          blurRadius: 5,
                          offset: Offset(0, 3),
                        ),
                      ],
                    ),
                    child: TextField(
                      controller: _searchController,
                      decoration: InputDecoration(
                        hintText: 'Search...',
                        hintStyle: TextStyle(color: Colors.grey[500]),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12.r),
                          borderSide: BorderSide.none,
                        ),
                        filled: true,
                        fillColor: Colors.white,
                        contentPadding: EdgeInsets.symmetric(
                            vertical: 14.h, horizontal: 20.w),
                        suffixIcon: IconButton(
                          icon: Icon(Icons.clear, color: Colors.grey[600]),
                          onPressed: () {
                            _searchController.clear();
                            _bookingController.searchBookings('');
                          },
                        ),
                      ),
                      onChanged: (value) {
                        _bookingController.searchBookings(value);
                      },
                    ),
                  )),
              Expanded(
                child: Obx(
                  () {
                    switch (_bookingController.status.value) {
                      case Status.loading:
                        return Center(child: CircularProgressIndicator());
                      case Status.completed:
                        return TabBarView(
                          children: [
                            _buildBookingList(_bookingController
                                .filteredBookings
                                .where((booking) => _bookingController
                                    .isBookingOngoing(booking))
                                .toList()),
                            _buildBookingList(_bookingController
                                .filteredBookings
                                .where((booking) => !_bookingController
                                    .isBookingOngoing(booking))
                                .toList()),
                          ],
                        );
                      case Status.error:
                        return const Center(
                          child: Text('Failed to load booking history'),
                        );
                      default:
                        return SizedBox();
                    }
                  },
                ),
              ),
            ],
          ),
          // floatingActionButton: FloatingActionButton(
          //   onPressed: () {
          //     _bookingController.loadBookingHistory();
          //   },
          //   child: Icon(Icons.refresh),
          //   backgroundColor: AppColors.primaryColor,
          // ),
        ),
      ),
    );
  }

  Widget _buildBookingList(List<BookingModel> bookings) {
    return ListView.builder(
      itemCount: bookings.length,
      itemBuilder: (context, index) {
        var booking = bookings[index];
        return BookingCard(booking: booking);
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
      color: const Color.fromARGB(245, 255, 255, 255),
      margin: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.r),
      ),
      child: Padding(
        padding: EdgeInsets.all(16.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              booking.equipmentName!,
              style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8.h),
            Text(
              'Location: ${booking.location}',
              style: TextStyle(fontSize: 16.sp),
            ),
            SizedBox(height: 8.h),
            Text(
              'Start Date: ${booking.startDate}',
              style: TextStyle(fontSize: 14.sp, color: Colors.grey),
            ),
            Text(
              'End Date: ${booking.endDate}',
              style: TextStyle(fontSize: 14.sp, color: Colors.grey),
            ),
          ],
        ),
      ),
    );
  }
}
