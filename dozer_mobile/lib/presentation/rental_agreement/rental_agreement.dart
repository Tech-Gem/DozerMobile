import 'package:dozer_mobile/core/theme/colors.dart';
import 'package:dozer_mobile/core/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_signature_pad/flutter_signature_pad.dart';
import 'package:get/get.dart';
import 'dart:typed_data';
import 'dart:ui' as ui;
import 'package:intl/intl.dart';
import 'package:open_file/open_file.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:path_provider/path_provider.dart';
import 'dart:io';
import 'package:flutter_pdfview/flutter_pdfview.dart';
import 'package:printing/printing.dart';

class RentalAgreementForm extends StatefulWidget {
  @override
  _RentalAgreementFormState createState() => _RentalAgreementFormState();
}

class _RentalAgreementFormState extends State<RentalAgreementForm> {
  final _formKey = GlobalKey<FormState>();
  final _signatureKeyRenter = GlobalKey<SignatureState>();
  final _signatureKeyOwner = GlobalKey<SignatureState>();
  Uint8List? _signatureBytesRenter;
  Uint8List? _signatureBytesOwner;

  // Controllers for the form fields
  final TextEditingController _ownerNameController = TextEditingController();
  final TextEditingController _renterNameController = TextEditingController();
  final TextEditingController _equipmentController = TextEditingController();
  final TextEditingController _leaseBeginController = TextEditingController();
  final TextEditingController _leaseEndController = TextEditingController();
  final TextEditingController _rentAmountController = TextEditingController();
  final TextEditingController _rentAddressController = TextEditingController();
  final TextEditingController _lateFeeDaysController = TextEditingController();
  final TextEditingController _lateFeeAmountController = TextEditingController();
  final TextEditingController _securityDepositController = TextEditingController();
  final TextEditingController _securityDepositAmountController = TextEditingController();

  late String _filePath;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Rental Agreement Form'),
        backgroundColor: AppColors.primaryColor, // Custom primary color
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                _buildSectionHeader('Lessor Information'),
                _buildTextField(_ownerNameController, 'Lessor Name', 'Please enter the lessor\'s name'),
                SizedBox(height: 20),
                _buildSectionHeader('Lessee Information'),
                _buildTextField(_renterNameController, 'Lessee Name', 'Please enter the lessee\'s name'),
                SizedBox(height: 20),
                _buildSectionHeader('Equipment Details'),
                _buildTextField(_equipmentController, 'Equipment Description', 'Please enter the equipment description'),
                SizedBox(height: 20),
                _buildSectionHeader('Lease Details'),
                _buildDateField(_leaseBeginController, 'Lease Begin Date', 'Please enter the lease begin date'),
                SizedBox(height: 10),
                _buildDateField(_leaseEndController, 'Lease End Date', 'Please enter the lease end date'),
                SizedBox(height: 20),
                _buildSectionHeader('Payment Details'),
                _buildTextField(_rentAmountController, 'Rent Amount', 'Please enter the rent amount', keyboardType: TextInputType.number),
                SizedBox(height: 10),
                _buildTextField(_rentAddressController, 'Address for Rent Payment', 'Please enter the address for rent payment'),
                SizedBox(height: 10),
                _buildTextField(_lateFeeDaysController, 'Days for Late Fee', 'Please enter the number of days for late fee', keyboardType: TextInputType.number),
                SizedBox(height: 10),
                _buildTextField(_lateFeeAmountController, 'Late Fee Amount', 'Please enter the late fee amount', keyboardType: TextInputType.number),
                SizedBox(height: 10),
                _buildTextField(_securityDepositController, 'Security Deposit', 'Please enter the security deposit', keyboardType: TextInputType.number),
                SizedBox(height: 10),
                _buildTextField(_securityDepositAmountController, 'Security Deposit Amount', 'Please enter the security deposit amount', keyboardType: TextInputType.number),
                SizedBox(height: 20),
                _buildSectionHeader('Signatures'),
                _buildSignatureField(_signatureKeyOwner, 'Owner Signature', (signature) {
                  setState(() {
                    _signatureBytesOwner = signature;
                  });
                }),
                SizedBox(height: 20),
                _buildSignatureField(_signatureKeyRenter, 'Renter Signature', (signature) {
                  setState(() {
                    _signatureBytesRenter = signature;
                  });
                }),
                SizedBox(height: 30),
                Center(
                  child: ElevatedButton.icon(
                    onPressed: () => _generatePdf(context),
                    icon: Icon(Icons.picture_as_pdf),
                    label: Text('Generate PDF'),
                    style: ElevatedButton.styleFrom(
                      foregroundColor: AppColors.primaryColor, // Custom button color
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30.0),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTextField(TextEditingController controller, String label, String validatorMessage, {TextInputType keyboardType = TextInputType.text}) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        labelText: label,
        labelStyle: TextStyle(color: AppColors.primaryColor), // Custom label color
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
          borderSide: BorderSide(color: AppColors.primaryColor),
        ),
      ),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return validatorMessage;
        }
        return null;
      },
      keyboardType: keyboardType,
    );
  }

  Widget _buildDateField(TextEditingController controller, String label, String validatorMessage) {
    return GestureDetector(
      onTap: () async {
        DateTime? picked = await showDatePicker(
          context: context,
          initialDate: DateTime.now(),
          firstDate: DateTime(2000),
          lastDate: DateTime(2101),
        );
        if (picked != null) {
          controller.text = DateFormat('yyyy-MM-dd').format(picked);
        }
      },
      child: AbsorbPointer(
        child: TextFormField(
          controller: controller,
          decoration: InputDecoration(
            labelText: label,
            
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.0),
              borderSide: BorderSide(color: AppColors.primaryColor),
            ),
          ),
          validator: (value) {
            if (value == null || value.isEmpty) {
              return validatorMessage;
            }
            return null;
          },
        ),
      ),
    );
  }

  Widget _buildSignatureField(GlobalKey<SignatureState> key, String label, Function(Uint8List) onSign) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: AppColors.primaryColor),
        ),
        SizedBox(height: 10),
        Container(
          decoration: BoxDecoration(
            border: Border.all(color: AppColors.primaryColor),
            borderRadius: BorderRadius.circular(10.0),
          ),
          child: Signature(
            key: key,
            color: Colors.blue,
            onSign: () async {
              final signaturePad = key.currentState;
              if (signaturePad != null) {
                final signature = await signaturePad.getData();
                final bytes = await signature.toByteData(format: ui.ImageByteFormat.png);
                if (bytes != null) {
                  onSign(bytes.buffer.asUint8List());
                }
              }
            },
          ),
          height: 150,
        ),
        SizedBox(height: 10),
        Center(
          child: ElevatedButton.icon(
            onPressed: () {
              key.currentState!.clear();
              setState(() {
                if (label == 'Owner Signature') {
                  _signatureBytesOwner = null;
                } else {
                  _signatureBytesRenter = null;
                }
              });
            },
            icon: Icon(Icons.clear),
            label: Text('Clear Signature'),
            style: ElevatedButton.styleFrom(
              foregroundColor: Colors.red, // Clear button color
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30.0),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildSectionHeader(String title) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
        
          ),
        ),
        Divider(
          color: AppColors.primaryColor,
          thickness: 2,
        ),
        SizedBox(height: 10),
      ],
    );
  }
Future<void> _generatePdf(BuildContext context) async {
  if (!_formKey.currentState!.validate()) {
    return;
  }

  final pdf = pw.Document();
  final companyName = "Construction Rentals Inc.";
  final companyAddress = "1234 Builder St, Construct City, 56789";
  final companyLogo = await _loadLogo('assets/company_logo.png');

  pdf.addPage(
    pw.Page(
      margin: pw.EdgeInsets.all(32),
      build: (context) => pw.Column(
        crossAxisAlignment: pw.CrossAxisAlignment.start,
        children: [
          if (companyLogo != null) pw.Image(companyLogo, height: 100),
          pw.SizedBox(height: 20),
          pw.Text(
            companyName,
            style: pw.TextStyle(
              fontSize: 24,
              fontWeight: pw.FontWeight.bold,
              color: PdfColors.blue,
            ),
          ),
          pw.Text(companyAddress),
          pw.Divider(thickness: 2, color: PdfColors.blue),
          pw.SizedBox(height: 20),
          pw.Text('Rental Agreement', style: pw.TextStyle(fontSize: 20, fontWeight: pw.FontWeight.bold)),
          pw.SizedBox(height: 20),
          _buildPdfSectionTitle('Lessor Information'),
          _buildPdfText('Name: ${_ownerNameController.text}'),
          pw.SizedBox(height: 10),
          _buildPdfSectionTitle('Lessee Information'),
          _buildPdfText('Name: ${_renterNameController.text}'),
          pw.SizedBox(height: 10),
          _buildPdfSectionTitle('Equipment Details'),
          _buildPdfText('Description: ${_equipmentController.text}'),
          pw.SizedBox(height: 10),
          _buildPdfSectionTitle('Lease Details'),
          _buildPdfText('Lease Begin Date: ${_leaseBeginController.text}'),
          _buildPdfText('Lease End Date: ${_leaseEndController.text}'),
          pw.SizedBox(height: 10),
          _buildPdfSectionTitle('Payment Details'),
          _buildPdfText('Rent Amount: ${_rentAmountController.text}'),
          _buildPdfText('Address for Rent Payment: ${_rentAddressController.text}'),
          _buildPdfText('Days for Late Fee: ${_lateFeeDaysController.text}'),
          _buildPdfText('Late Fee Amount: ${_lateFeeAmountController.text}'),
          _buildPdfText('Security Deposit: ${_securityDepositController.text}'),
          _buildPdfText('Security Deposit Amount: ${_securityDepositAmountController.text}'),
          pw.SizedBox(height: 20),
          _buildPdfSectionTitle('Signatures'),
          if (_signatureBytesOwner != null)
            pw.Column(
              crossAxisAlignment: pw.CrossAxisAlignment.start,
              children: [
                pw.Image(pw.MemoryImage(_signatureBytesOwner!), height: 60, width: 200),
                pw.Text('Owner Signature'),
                pw.SizedBox(height: 10),
              ],
            ),
          if (_signatureBytesRenter != null)
            pw.Column(
              crossAxisAlignment: pw.CrossAxisAlignment.start,
              children: [
                pw.Image(pw.MemoryImage(_signatureBytesRenter!), height: 60, width: 200),
                pw.Text('Renter Signature'),
              ],
            ),
          pw.SizedBox(height: 30),
          pw.Text('Generated on: ${DateFormat('yyyy-MM-dd').format(DateTime.now())}', style: pw.TextStyle(fontSize: 10)),
        ],
      ),
    ),
  );

  final output = await getTemporaryDirectory();
  final file = File("${output.path}/rental_agreement.pdf");
  await file.writeAsBytes(await pdf.save());

  setState(() {
    _filePath = file.path;
  });

  // Display PDF
  await Navigator.push(
    context,
    MaterialPageRoute(
      builder: (context) => PdfViewerPage(filePath: _filePath),
    ),
  );
}

Future<pw.ImageProvider?> _loadLogo(String path) async {
  try {
    final bytes = await rootBundle.load(path);
    return pw.MemoryImage(bytes.buffer.asUint8List());
  } catch (e) {
    print("Failed to load logo: $e");
    return null;
  }
}

pw.Widget _buildPdfSectionTitle(String title) {
  return pw.Container(
    margin: pw.EdgeInsets.symmetric(vertical: 10),
    child: pw.Text(
      title,
      style: pw.TextStyle(fontSize: 16, fontWeight: pw.FontWeight.bold, color: PdfColors.blue),
    ),
  );
}

pw.Widget _buildPdfText(String text) {
  return pw.Text(
    text,
    style: pw.TextStyle(fontSize: 12),
  );
}

}

class PdfViewerPage extends StatelessWidget {
  final String filePath;

  PdfViewerPage({required this.filePath});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: primaryColor,
        title: Text(' Agreement PDF',style: TextStyle(color: Colors.white),),

        actions: [
          IconButton(
            icon: Icon(Icons.print),
            onPressed: () {
              Printing.layoutPdf(onLayout: (PdfPageFormat format) async => File(filePath).readAsBytesSync());
            },
          ),
          IconButton(
            icon: Icon(Icons.download),
            onPressed: () async {
              OpenFile.open(filePath);
            },
          ),
        ],
      ),
      body: PDFView(
        filePath: filePath,
      ),
    );
  }
}
