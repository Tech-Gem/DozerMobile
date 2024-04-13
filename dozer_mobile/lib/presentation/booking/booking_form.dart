import 'package:dozer_mobile/core/utils/app_strings.dart';
import 'package:dozer_mobile/dozer_exports.dart';
import 'package:dozer_mobile/presentation/booking/screen_widgets/notify_owner_button.dart';
import 'package:dozer_mobile/presentation/equipment_list/screen_widgets/custom_appbar.dart';
import 'package:flutter/material.dart';

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
  late TextEditingController _availabilityController;
  late String _selectedSubCity;
  late DateTime _startDate; // Initialize with current date
  late DateTime _endDate; // Initialize with current date
  List<String> _subCities = ['SubCity A', 'SubCity B', 'SubCity C'];

  @override
  void initState() {
    super.initState();
    _amountController = TextEditingController();
    _availabilityController = TextEditingController(text: '1'); // Initialize with 1
    _selectedSubCity = _subCities.first;
    _startDate = DateTime.now(); // Initialize with current date
    _endDate = DateTime.now(); // Initialize with current date
  }

  @override
  void dispose() {
    _amountController.dispose();
    _availabilityController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: CustomAppBar(),
        body: Padding(
          padding: EdgeInsets.only(top: 10.h),
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 25.h, vertical: 40),
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
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // Equipment Picture and Name
                Column(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(10.0), // Adjust the radius as needed
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
                      labelText: AppStringsEnglish.startDateLabel,
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
                      labelText: AppStringsEnglish.endDateLabel,
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
                    labelText: AppStringsEnglish.subCityLabel,
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
                        controller: _availabilityController,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          labelText: AppStringsEnglish.amountLabel,
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
                        int currentAvailability = int.parse(_availabilityController.text);
                        if (currentAvailability < widget.availability) {
                          setState(() {
                            _availabilityController.text = (currentAvailability + 1).toString();
                          });
                        }
                      },
                    ),
                    IconButton(
                      icon: Icon(Icons.arrow_drop_down),
                      onPressed: () {
                        int currentAvailability = int.parse(_availabilityController.text);
                        if (currentAvailability > 1) {
                          setState(() {
                            _availabilityController.text = (currentAvailability - 1).toString();
                          });
                        }
                      },
                    ),
                  ],
                ),
                SizedBox(height: 10.0),
                NotifyOwnerButton(
                  text: AppStringsEnglish.notifyOwnerButtonText,
                  onPressed: () {},
                ),
              ],
            ),
          ),
        ),
      ),
    );
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
}