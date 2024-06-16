import 'package:dozer_mobile/core/language/language_controller.dart';
import 'package:dozer_mobile/core/utils/app_strings.dart';
import 'package:dozer_mobile/presentation/booking/booking_history.dart';
import 'package:dozer_mobile/presentation/booking/controllers/booking_controller.dart';
import 'package:dozer_mobile/presentation/booking/screen_widgets/notify_owner_button.dart';
import 'package:dozer_mobile/presentation/home/widgets/custom_appbar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BookingForm extends StatefulWidget {
  final String? equipmentId;
  final int? availability;
  final String? imageUrl;
  final String? equipmentName;

  const BookingForm({
    Key? key,
    this.equipmentId,
    this.availability,
    this.imageUrl,
    this.equipmentName,
  }) : super(key: key);

  @override
  _BookingFormState createState() => _BookingFormState();
}

class _BookingFormState extends State<BookingForm> {
  late String _selectedSubCity;
  late DateTime _startDate;
  late DateTime _endDate;
  List<String> _subCities = [
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
  final LanguageController _languageController = Get.put(LanguageController());
  BookingController controller = Get.find();

  @override
  void initState() {
    super.initState();
    _selectedSubCity = _subCities.first;
    _startDate = DateTime.now();
    _endDate = DateTime.now();
  }

  @override
  Widget build(BuildContext context) {
    return Obx(() => SafeArea(
          child: Scaffold(
            appBar: CustomAppBar(),
            body: Container(
              padding: EdgeInsets.symmetric(horizontal: 15, vertical: 40),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10.0),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 2,
                    blurRadius: 5,
                    offset: Offset(0, 3),
                  ),
                ],
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Column(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(10.0),
                        child: Image.network(
                          widget.imageUrl!,
                          width: double.infinity,
                          height: 200,
                          fit: BoxFit.cover,
                        ),
                      ),
                      SizedBox(height: 10),
                      Text(
                        widget.equipmentName!,
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 20),
                  SizedBox(height: 10.0),
                  GestureDetector(
                    onTap: () => _selectStartDate(context),
                    child: AbsorbPointer(
                      child: TextFormField(
                        controller: controller.startDateController.value,
                        readOnly: true,
                        decoration: InputDecoration(
                          labelText: _getCurrentLanguageString(AppStringsEnglish.startDateLabel, AppStringsAmharic.startDateLabel),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 10.0),
                  GestureDetector(
                    onTap: () => _selectEndDate(context),
                    child: AbsorbPointer(
                      child: TextFormField(
                        controller: controller.endDateController.value,
                        readOnly: true,
                        decoration: InputDecoration(
                          labelText: _getCurrentLanguageString(AppStringsEnglish.endDateLabel, AppStringsAmharic.endDateLabel),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 10.0),
                  DropdownButtonFormField<String>(
                    value: _selectedSubCity,
                    onChanged: (newValue) {
                      setState(() {
                        controller.locationController.value.text = newValue!;
                      });
                    },
                    items: _subCities.map((subCity) {
                      return DropdownMenuItem<String>(
                        value: subCity,
                        child: Text(subCity),
                      );
                    }).toList(),
                    decoration: InputDecoration(
                      labelText: _getCurrentLanguageString(AppStringsEnglish.subCityLabel, AppStringsAmharic.subCityLabel),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                    ),
                  ),
                  SizedBox(height: 10.0),
                  Row(
                    children: [
                      Expanded(
                        child: TextFormField(
                          controller: controller.quantityController.value,
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                            labelText: _getCurrentLanguageString(AppStringsEnglish.amountLabel, AppStringsAmharic.amountLabel),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                          ),
                          readOnly: true,
                        ),
                      ),
                      IconButton(
                        icon: Icon(Icons.arrow_drop_up),
                        onPressed: _incrementAmount,
                      ),
                      IconButton(
                        icon: Icon(Icons.arrow_drop_down),
                        onPressed: _decrementAmount,
                      ),
                    ],
                  ),
                  SizedBox(height: 10),
                  NotifyOwnerButton(
                    text: _getCurrentLanguageString(AppStringsEnglish.notifyOwnerButtonText, AppStringsAmharic.notifyOwnerButtonText),
                    onPressed: () {
                      controller.confirmBooking(widget.equipmentId!).then((_) {
                        _showRenterNotifiedPopup(context);
                      });
                    },
                  ),
                  SizedBox(height: 10),
                ],
              ),
            ),
          ),
        ));
  }

  void _showRenterNotifiedPopup(BuildContext context) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return Dialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              CircleAvatar(
                radius: 30.0,
                backgroundColor: Colors.green,
                child: Icon(Icons.check, color: Colors.white, size: 30.0),
              ),
              SizedBox(height: 10),
              Text(
                'Renter Notified',
                style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  // Navigate to booking history page
                  controller.loadBookingHistory();
                  Get.back(); // Close the dialog
                  Get.to(() => BookingHistoryPage());
                },
                child: Text('OK'),
              ),
            ],
          ),
        ),
      );
    },
  );
}

  Future<void> _selectStartDate(BuildContext context) async {
    final DateTime? pickedStartDate = await showDatePicker(
      context: context,
      initialDate: _startDate,
      firstDate: DateTime.now(),
      lastDate: DateTime.now().add(Duration(days: 365)),
    );

    if (pickedStartDate != null && pickedStartDate != _startDate) {
      if (_endDate.isBefore(pickedStartDate)) {
        _endDate = pickedStartDate;
        setState(() {
          controller.endDateController.value.text = '${_endDate.day}/${_endDate.month}/${_endDate.year}';
        });
      }
      setState(() {
        _startDate = pickedStartDate;
        controller.startDateController.value.text = '${_startDate.day}/${_startDate.month}/${_startDate.year}';
      });
    }
  }

  Future<void> _selectEndDate(BuildContext context) async {
    final DateTime? pickedEndDate = await showDatePicker(
      context: context,
      initialDate: _endDate,
      firstDate: _startDate,
      lastDate: _startDate.add(Duration(days: 365)),
    );

    if (pickedEndDate != null && pickedEndDate != _endDate) {
      setState(() {
        _endDate = pickedEndDate;
        controller.endDateController.value.text = '${_endDate.day}/${_endDate.month}/${_endDate.year}';
      });
    }
  }

  String _getCurrentLanguageString(String englishString, String amharicString) {
    if (_languageController.currentLanguage == Language.amharic) {
      return amharicString;
    } else {
      return englishString;
    }
  }

  void _incrementAmount() {
    setState(() {
      final currentAmount = int.tryParse(controller.quantityController.value.text) ?? 0;
      final newAmount = (currentAmount < widget.availability!) ? currentAmount + 1 : currentAmount;
      controller.quantityController.value.text = newAmount.toString();
    });
  }

  void _decrementAmount() {
    setState(() {
      final currentAmount = int.tryParse(controller.quantityController.value.text) ?? 0;
      final newAmount = (currentAmount > 1) ? currentAmount - 1 : currentAmount;
      controller.quantityController.value.text = newAmount.toString();
    });
  }
}
