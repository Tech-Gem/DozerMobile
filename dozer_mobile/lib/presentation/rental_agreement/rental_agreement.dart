import 'package:flutter/material.dart';
import 'package:flutter_signature_pad/flutter_signature_pad.dart';
import 'package:get/get.dart';
import 'dart:typed_data';
import 'dart:ui' as ui;
import 'package:intl/intl.dart';
import 'package:open_file/open_file.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:io';
import 'package:flutter_pdfview/flutter_pdfview.dart';

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
  TextEditingController _rentalInstructionsController = TextEditingController();
  TextEditingController _ownerNameController = TextEditingController();
  TextEditingController _renterNameController = TextEditingController();
  TextEditingController _rentalItemController = TextEditingController();

  late String _filePath;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Rental Agreement Form'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  'Rental Instructions:',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                TextFormField(
                  controller: _rentalInstructionsController,
                  maxLines: 5,
                  decoration: InputDecoration(
                    labelText: 'Enter rental instructions',
                    border: OutlineInputBorder(),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter rental instructions';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 20),
                Text(
                  'Owner:',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                TextFormField(
                  controller: _ownerNameController,
                  decoration: InputDecoration(
                    labelText: 'Owner Name',
                    border: OutlineInputBorder(),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter owner name';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 10),
                Text(
                  'Renter:',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                TextFormField(
                  controller: _renterNameController,
                  decoration: InputDecoration(
                    labelText: 'Renter Name',
                    border: OutlineInputBorder(),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter renter name';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 10),
                Text(
                  'Rental Item:',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                TextFormField(
                  controller: _rentalItemController,
                  decoration: InputDecoration(
                    labelText: 'Rental Item',
                    border: OutlineInputBorder(),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter rental item';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 20),
                Text(
                  'Rental Agreement:',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 10),
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey),
                  ),
                  child: Signature(
                    key: _signatureKeyOwner,
                    color: Colors.blue,
                    onSign: () async {
                      final signaturePad = _signatureKeyOwner.currentState;
                      if (signaturePad != null) {
                        final signature = await signaturePad.getData();
                        final bytes = await signature.toByteData(format: ui.ImageByteFormat.png);
                        setState(() {
                          _signatureBytesOwner = bytes!.buffer.asUint8List();
                        });
                      }
                    },
                  ),
                  height: 150,
                ),
                SizedBox(height: 10),
                Text(
                  'Owner Signature',
                  style: TextStyle(fontSize: 16),
                ),
                SizedBox(height: 20),
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey),
                  ),
                  child: Signature(
                    key: _signatureKeyRenter,
                    color: Colors.blue,
                    onSign: () async {
                      final signaturePad = _signatureKeyRenter.currentState;
                      if (signaturePad != null) {
                        final signature = await signaturePad.getData();
                        final bytes = await signature.toByteData(format: ui.ImageByteFormat.png);
                        setState(() {
                          _signatureBytesRenter = bytes!.buffer.asUint8List();
                        });
                      }
                    },
                  ),
                  height: 150,
                ),
                SizedBox(height: 10),
                Text(
                  'Renter Signature',
                  style: TextStyle(fontSize: 16),
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () => _generatePdf(context),
                  child: Text('Generate PDF'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> _generatePdf(BuildContext context) async {
    if (_formKey.currentState!.validate()) {
      final pdf = pw.Document();

      String formattedDate = DateFormat('MMMM dd, yyyy').format(DateTime.now());

      final rentalAgreementText = '''
      Rental Agreement

      This Rental Agreement is made on $formattedDate, between the parties below,
      who agree as follows:

      1. **Parties**
          1.1 **Owner:** ${_ownerNameController.text}
          1.2 **Renter:** ${_renterNameController.text}
      
      2. **Rental Item**
          The Owner agrees to rent, and the Renter agrees to lease the following described item:
          ${_rentalItemController.text}
      
      3. **Rental Instructions**
          ${_rentalInstructionsController.text}
      
      4. **Signatures**
          Owner: ${_ownerNameController.text}
          ${_signatureBytesOwner != null ? '[signature]' : '______________________'}

          Renter: ${_renterNameController.text}
          ${_signatureBytesRenter != null ? '[signature]' : '______________________'}
      ''';

      pdf.addPage(
        pw.Page(
          build: (pw.Context context) {
            return pw.Column(
              crossAxisAlignment: pw.CrossAxisAlignment.start,
              children: [
                pw.Text('Rental Agreement',
                    style: pw.TextStyle(
                      fontSize: 24,
                      fontWeight: pw.FontWeight.bold,
                    )),
                pw.SizedBox(height: 20),
                pw.Paragraph(
                  text: rentalAgreementText,
                  style: pw.TextStyle(
                    fontSize: 12,
                    height: 1.5,
                  ),
                ),
                pw.SizedBox(height: 20),
                if (_signatureBytesOwner != null)
                  pw.Container(
                    height: 50,
                    child: pw.Image(
                      pw.MemoryImage(_signatureBytesOwner!),
                    ),
                  ),
                pw.SizedBox(height: 10),
                if (_signatureBytesRenter != null)
                  pw.Container(
                    height: 50,
                    child: pw.Image(
                      pw.MemoryImage(_signatureBytesRenter!),
                    ),
                  ),
              ],
            );
          },
        ),
      );

      final output = await getTemporaryDirectory();
      final file = File("${output.path}/rental_agreement.pdf");
      await file.writeAsBytes(await pdf.save());

      setState(() {
        _filePath = file.path;
      });

      // Navigate to the PDF preview page
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => PdfPreviewPage(filePath: _filePath),
        ),
      );
    }
  }
}

class PdfPreviewPage extends StatelessWidget {
  final String filePath;

  PdfPreviewPage({required this.filePath});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('PDF Preview'),
        actions: [
          IconButton(
            icon: Icon(Icons.download),
            onPressed: () {
              // Trigger file download
              _downloadFile(context);
            },
          ),
          IconButton(
            icon: Icon(Icons.print),
            onPressed: () {
              // Trigger file printing
              _printFile(context);
            },
          ),
        ],
      ),
      body: PDFView(
        filePath: filePath,
      ),
    );
  }


Future<void> _downloadFile(BuildContext context) async {
  final pdfFile = File(filePath);
  final bytes = await pdfFile.readAsBytes();
  final dir = await getExternalStorageDirectory();
  final file = File('${dir!.path}/rental_agreement.pdf');
  await file.writeAsBytes(bytes);
  
  // Open the downloaded file
  OpenFile.open(file.path);
  
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(content: Text('PDF downloaded successfully')),
  );
}

  Future<void> _printFile(BuildContext context) async {
    final pdfFile = File(filePath);
    await Printing.layoutPdf(
      onLayout: (PdfPageFormat format) async => pdfFile.readAsBytes(),
    );
  }
}
