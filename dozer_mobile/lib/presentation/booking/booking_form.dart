import 'package:dozer_mobile/core/language/language_controller.dart';
import 'package:dozer_mobile/core/utils/app_strings.dart';
import 'package:dozer_mobile/presentation/booking/screen_widgets/notify_owner_button.dart';
import 'package:dozer_mobile/presentation/equipment_list/screen_widgets/custom_appbar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';



class BookingForm extends StatefulWidget {
  final int availability;
  final String imageUrl;
  final String equipmentName;

  const BookingForm({
    Key? key,
    required this.availability,
    required this.imageUrl,
    required this.equipmentName,
  }) : super(key: key);

  @override
  _BookingFormState createState() => _BookingFormState();
}

class _BookingFormState extends State<BookingForm> {
  late TextEditingController _amountController;
  late String _selectedSubCity;
  late DateTime _startDate; // Initialize with current date
  late DateTime _endDate; // Initialize with current date
  List<String> _subCities = ['SubCity A', 'SubCity B', 'SubCity C'];
  final LanguageController _languageController = Get.put(LanguageController());

  @override
  void initState() {
    super.initState();
    _amountController = TextEditingController();
    _selectedSubCity = _subCities.first;
    _startDate = DateTime.now(); // Initialize with current date
    _endDate = DateTime.now(); // Initialize with current date
  }

  @override
  void dispose() {
    _amountController.dispose();
    super.dispose();
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
                    offset: Offset(0, 3), // changes position of shadow
                  ),
                ],
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  // Equipment Picture and Name
                  Column(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(10.0),
                        child: Image.network(
                          widget.imageUrl,
                          width: double.infinity,
                          height: 200,
                          fit: BoxFit.cover,
                        ),
                      ),
                      SizedBox(height: 10),
                      Text(
                        widget.equipmentName,
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 20), // Spacing
                  InkWell(
                    onTap: () => _selectStartDate(context),
                    child: InputDecorator(
                      decoration: InputDecoration(
                        labelText: _getCurrentLanguageString(AppStringsEnglish.startDateLabel, AppStringsAmharic.startDateLabel),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                      ),
                      child: Text('${_startDate.day}/${_startDate.month}/${_startDate.year}'),
                    ),
                  ),
                  SizedBox(height: 10.0),
                  InkWell(
                    onTap: () => _selectEndDate(context),
                    child: InputDecorator(
                      decoration: InputDecoration(
                        labelText: _getCurrentLanguageString(AppStringsEnglish.endDateLabel, AppStringsAmharic.endDateLabel),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                      ),
                      child: Text('${_endDate.day}/${_endDate.month}/${_endDate.year}'),
                    ),
                  ),
                  SizedBox(height: 10.0),
                  DropdownButtonFormField<String>(
                    value: _selectedSubCity,
                    onChanged: (newValue) {
                      setState(() {
                        _selectedSubCity = newValue!;
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
                          controller: _amountController,
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
                        onPressed: () {
                          _incrementAmount();
                        },
                      ),
                      IconButton(
                        icon: Icon(Icons.arrow_drop_down),
                        onPressed: () {
                          _decrementAmount();
                        },
                      ),
                    ],
                  ),
                  SizedBox(height: 10.0),
                  NotifyOwnerButton(
                    text: _getCurrentLanguageString(AppStringsEnglish.notifyOwnerButtonText, AppStringsAmharic.notifyOwnerButtonText),
                    onPressed: () {},
                  ),
                  SizedBox(height: 10),
                
                ],
              ),
            ),
          ),
        ));
  }

  Future<void> _selectStartDate(BuildContext context) async {
    final DateTime? pickedStartDate = await showDatePicker(
      context: context,
      initialDate: _startDate,
      firstDate: DateTime.now(),
      lastDate: DateTime.now().add(Duration(days: 365)), // Limit selection to one year from today
    );

    if (pickedStartDate != null && pickedStartDate != _startDate) {
      setState(() {
        _startDate = pickedStartDate;
        if (_endDate.isBefore(_startDate)) {
          // If end date is before start date, reset end date to start date
          _endDate = _startDate;
        }
      });
    }
  }

  Future<void> _selectEndDate(BuildContext context) async {
    final DateTime? pickedEndDate = await showDatePicker(
      context: context,
      initialDate: _endDate,
      firstDate: _startDate,
      lastDate: DateTime.now().add(Duration(days: 365)), // Limit selection to one year from today
    );

    if (pickedEndDate != null && pickedEndDate != _endDate) {
      setState(() {
        _endDate = pickedEndDate;
      });
    }
  }

  // Method to get the appropriate string based on the current language
  String _getCurrentLanguageString(String englishString, String amharicString) {
    if (_languageController.currentLanguage == Language.amharic) {
      return amharicString;
    } else {
      return englishString;
    }
  }

  // Method to change language
  void _changeLanguage() {
    if (_languageController.currentLanguage == Language.amharic) {
      _languageController.setCurrentLanguage(Language.english);
    } else {
      _languageController.setCurrentLanguage(Language.amharic);
    }
  }

  // Method to increment the amount
  void _incrementAmount() {
    setState(() {
      final currentAmount = int.tryParse(_amountController.text) ?? 0;
      final newAmount = (currentAmount < widget.availability) ? currentAmount + 1 : currentAmount;
      _amountController.text = newAmount.toString();
    });
  }

  // Method to decrement the amount
  void _decrementAmount() {
    setState(() {
      final currentAmount = int.tryParse(_amountController.text) ?? 0;
      final newAmount = (currentAmount > 1) ? currentAmount - 1 : currentAmount;
      _amountController.text = newAmount.toString();
    });
  }
}
