import 'package:flutter/material.dart';

class FinancialReportScreen extends StatelessWidget {
  final int totalEquipment;
  final int totalBooking;
  final double totalMoneyMade;

  FinancialReportScreen({
    this.totalEquipment = 0, // Default values for demo purposes
    this.totalBooking = 0,
    this.totalMoneyMade = 0.0,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Financial Report'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            FinancialReportItem(
              label: 'Total Equipment',
              value: totalEquipment.toString(),
            ),
            SizedBox(height: 16),
            FinancialReportItem(
              label: 'Total Booking',
              value: totalBooking.toString(),
            ),
            SizedBox(height: 16),
            FinancialReportItem(
              label: 'Total Money Made',
              value: '\$${totalMoneyMade.toStringAsFixed(2)}',
            ),
          ],
        ),
      ),
    );
  }
}

class FinancialReportItem extends StatelessWidget {
  final String label;
  final String value;

  FinancialReportItem({required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      title: Text(
        label,
        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
      ),
      trailing: Text(
        value,
        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
      ),
    );
  }
}
