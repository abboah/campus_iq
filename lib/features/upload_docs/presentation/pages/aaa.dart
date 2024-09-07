import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';
import 'package:pdfx/pdfx.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: PdfToImageScreen(),
    );
  }
}

class PdfToImageScreen extends StatefulWidget {
  @override
  _PdfToImageScreenState createState() => _PdfToImageScreenState();
}

class _PdfToImageScreenState extends State<PdfToImageScreen> {
  PdfDocument? _pdfDocument;
  PdfPageImage? _pdfPageImage;

  Future<void> _scanDocument() async {
    try {
      FilePickerResult? result = await FilePicker.platform
          .pickFiles(type: FileType.custom, allowedExtensions: ['pdf']);
      if (result != null) {
        final file = result.files.single.path!;

        // Open the PDF document
        _pdfDocument = await PdfDocument.openFile(file);

        // Render the first page
        final page = await _pdfDocument!.getPage(0);
        final pageImage = await page.render(
          height: MediaQuery.of(context).size.height / 5,
          width: MediaQuery.of(context).size.width / 2,
          // Optional: Set a background color
        );

        setState(() {
          _pdfPageImage = pageImage;
        });
      }
    } catch (e) {
      print('Error during file processing: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('PDF to Image Converter'),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            ElevatedButton(
              onPressed: _scanDocument,
              child: Text('Select and Convert PDF'),
            ),
            if (_pdfPageImage != null) Image.memory(_pdfPageImage!.bytes),
          ],
        ),
      ),
    );
  }
}
