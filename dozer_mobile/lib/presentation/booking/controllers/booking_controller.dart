import 'package:dozer_mobile/core/data/apis/api_response_status.dart';
import 'package:dozer_mobile/core/data/network/network_api_service.dart';
import 'package:dozer_mobile/core/utils/get_storage_helper.dart';
import 'package:dozer_mobile/presentation/booking/models/booking_form_model.dart';
import 'package:dozer_mobile/presentation/booking/repository/booking_repository.dart';
import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:signature/signature.dart';
import 'package:intl/intl.dart'; // Add this import

class BookingController extends GetxController {
  final NetworkApiService _apiService = NetworkApiService();
  final BookingRepository _bookingRepository = BookingRepository();
  final Rx<TextEditingController> startDateController = TextEditingController().obs;
  final Rx<TextEditingController> endDateController = TextEditingController().obs;
  final Rx<TextEditingController> locationController = TextEditingController().obs;
  final Rx<TextEditingController> quantityController = TextEditingController().obs;
  final Rx<SignatureController> signBoardSignatureController = Rx<SignatureController>(SignatureController());
   final BookingRepository _repository = BookingRepository();
  RxList<BookingModel> recommendedList = <BookingModel>[].obs;
  
  Rx<Status> status = Status.loading.obs; // Add status

  Future<void> getCurrentLocation() async {
    var status = await Permission.location.request();
    if (status.isGranted) {
      try {
        Position position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.high,
        );

        List<Placemark> placemarks = await placemarkFromCoordinates(
          position.latitude,
          position.longitude,
        );

        if (placemarks.isNotEmpty) {
          locationController.value.text = placemarks[0].name ?? 'Location not available';
        } else {
          locationController.value.text = 'Location not available';
        }
      } catch (e) {
        print('Error getting location: $e');
        locationController.value.text = 'Location not available';
      }
    } else if (status.isDenied) {
      print('Location permission denied by the user.');
    } else if (status.isPermanentlyDenied) {
      print('Location permission permanently denied by the user.');
      await openAppSettings();
    }
  }

  Future<void> showPredefinedLocationsDialog() async {
    List<String> predefinedLocations = [
      "Addis Ketema",
      "Akaky Kaliti",
      "Arada",
      "Bole",
      "Gullele",
      "Kirkos",
      "Kolfe Keranio",
      "Lideta",
      "Lemi Kura",
      "Nifas Silk-Lafto",
      "Yeka"
    ];

    String? selectedLocation = await Get.dialog(
      AlertDialog(
        title: Text('Select Location'),
        content: DropdownButton<String>(
          items: predefinedLocations.map((String location) {
            return DropdownMenuItem<String>(
              value: location,
              child: Text(location),
            );
          }).toList(),
          onChanged: (String? value) {
            Get.back(result: value);
          },
        ),
      ),
    );

    if (selectedLocation != null) {
      locationController.value.text = selectedLocation;
    }
  }
 
  Future<void> confirmBooking(String equipmentId) async {
    try {
      // Format the dates
      DateTime startDate = DateFormat('dd/MM/yyyy').parse(startDateController.value.text);
      DateTime endDate = DateFormat('dd/MM/yyyy').parse(endDateController.value.text);
      String formattedStartDate = DateFormat('yyyy-MM-dd').format(startDate);
      String formattedEndDate = DateFormat('yyyy-MM-dd').format(endDate);

      final BookingModel booking = BookingModel(
        equipmentId: equipmentId,
        email: "hayat1911@gmail.com",
        startDate: formattedStartDate,
        endDate: formattedEndDate,
        location: locationController.value.text,
        quantity: int.tryParse(quantityController.value.text) ?? 0,
        signature: "jfldjfd",
        termsAndConditions: true,
      );

      print(booking.startDate);
      print(booking.endDate);
      print(booking.location);
      print(booking.email);
      print(booking.signature);
      print(booking.location);
      print(booking.quantity);
      print(booking.termsAndConditions);
      print(booking.equipmentId);

      _bookingRepository.confirmBooking(booking);
    } catch (error) {
      print('Error confirming booking: $error');
    }
  }
    RxBool isOngoing = true.obs; // Observable to track ongoing or ended bookings

  RxList<BookingModel> _allBookings = <BookingModel>[].obs;
  RxList<BookingModel> filteredBookings = <BookingModel>[].obs;

  @override
  void onInit() {
    super.onInit();
    loadBookingHistory();
  }
Future<List<BookingModel>> loadBookingHistory() async {
  try {
    status(Status.loading); // Set loading status
    final machines = await _repository.getBookings();
    print(machines);

    if (machines.isNotEmpty) {
      _allBookings.assignAll(machines);
      filteredBookings.assignAll(_allBookings);
      status(Status.completed); // Set success status
      return _allBookings; // Return list of bookings
    } else {
      status(Status.error); // Set error status
      print('Error loading recommended machines: Empty response');
      return []; // Return an empty list if no bookings found
    }
  } catch (e) {
    status(Status.error); // Set error status
    print('Error loading recommended machines: $e');
    return []; // Return an empty list in case of error
  }
}

  void toggleOngoing(bool isOngoing) {
    // Toggle between ongoing and ended bookings
    if (isOngoing) {
      filteredBookings.assignAll(_allBookings.where((booking) => isBookingOngoing(booking)).toList());
    } else {
      filteredBookings.assignAll(_allBookings.where((booking) => !isBookingOngoing(booking)).toList());
    }
  }

  bool isBookingOngoing(BookingModel booking) {
    // Check if the booking is ongoing
    DateTime now = DateTime.now();
    DateTime endDate = DateTime.parse(booking.endDate);
    return endDate.isAfter(now);
  }

  void searchBookings(String searchText) {
    // Filter bookings based on search text
    if (searchText.isEmpty) {
      filteredBookings.assignAll(_allBookings);
    } else {
      filteredBookings.assignAll(_allBookings.where((booking) =>
          booking.equipmentName!.toLowerCase().contains(searchText.toLowerCase())));
    }
  }
}
