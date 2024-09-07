import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';
import 'package:image_picker/image_picker.dart';
import 'package:file_picker/file_picker.dart';
import 'dart:io';
import 'package:pdfx/pdfx.dart';
import '../../../../core/themes/extra_colors.dart';
import '../../../../core/widgets/gradient_textbutton.dart';

class UploadScanScreen extends StatefulWidget {
  static const routeName = '/uploaddocs';
  const UploadScanScreen({super.key});

  @override
  _UploadScanScreenState createState() => _UploadScanScreenState();
}

class _UploadScanScreenState extends State<UploadScanScreen> {
  File? _courseRegistrationFile;
  File? _timetableFile;
  final ImagePicker _picker = ImagePicker();
  PdfDocument? _pdfDocument;
  PdfPageImage? _pdfPageImage;
  PdfDocument? _coursePdfDocument;
  PdfPageImage? _coursePdfPageImage;
  PdfDocument? _timetalePdfDocument;
  PdfPageImage? _timetablePageImage;

  Future<void> _pickDocument(bool isCourseRegistration) async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['pdf', 'jpg', 'png'],
    );
    if (result != null) {
      final file = File(result.files.single.path!);
      if (file.path.endsWith('.pdf')) {
        // If the file is a PDF, render the first page as an image
        _pdfDocument = await PdfDocument.openFile(file.path);
        final page = await _pdfDocument!.getPage(1); // Get the first page
        _pdfPageImage = await page.render(
          width: page.width,
          height: page.height,
        );
        await page.close();

        setState(() {
          if (isCourseRegistration) {
            _courseRegistrationFile = file;
            _coursePdfDocument = _pdfDocument;
            _coursePdfPageImage = _pdfPageImage;
          } else {
            _timetableFile = file;
            _timetalePdfDocument = _pdfDocument;
            _timetablePageImage = _pdfPageImage;
          }
        });
      } else {
        // For non-PDF files (e.g., images), store them directly
        setState(() {
          if (isCourseRegistration) {
            _courseRegistrationFile = file;
          } else {
            _timetableFile = file;
          }
        });
      }
    }
  }

  Future<void> _scanDocument(bool isCourseRegistration) async {
    final pickedFile = await _picker.pickImage(source: ImageSource.camera);
    if (pickedFile != null) {
      setState(() {
        if (isCourseRegistration) {
          _courseRegistrationFile = File(pickedFile.path);
        } else {
          _timetableFile = File(pickedFile.path);
        }
      });
    }
  }

  // void _skip() {
  //   // Navigate to the next screen or perform any action on skip
  //   Navigator.of(context).pushNamed(HomeScreen.routeName);
  // }

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    final bool isLightTheme = Theme.of(context).brightness == Brightness.light;

    return Scaffold(
      appBar: AppBar(
        forceMaterialTransparency: true,
        // title: Text(
        //   'WELCOME',
        //   style: textTheme.titleLarge?.copyWith(
        //       color: isLightTheme ? ExtraColors.black : ExtraColors.white,
        //       fontSize: 25,
        //       fontWeight: FontWeight.w800),
        // ),
        // actions: [
        //   TextButton(
        //       onPressed: _skip,
        //       child: Text(
        //         'Skip',
        //         style: textTheme.titleLarge?.copyWith(
        //             color: ExtraColors.blue,
        //             fontSize: 20,
        //             fontWeight: FontWeight.w500),
        //       ))
        // ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                'Course Registration Slip',
                textAlign: TextAlign.center,
                style: textTheme.titleLarge?.copyWith(
                    color: isLightTheme ? ExtraColors.black : ExtraColors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.w600),
              ),
              const SizedBox(height: 16.0),
              TButton(
                onPressed: () => _pickDocument(true),
                text: 'Upload',
                icon: IconlyLight.upload,
                isLightTheme: isLightTheme,
              ),
              Row(
                children: <Widget>[
                  Expanded(
                    child: Divider(
                      color: isLightTheme
                          ? ExtraColors.black.withOpacity(0.5)
                          : ExtraColors.white.withOpacity(0.5),
                      thickness: 1.0,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 10.0, vertical: 10.0),
                    child: Text(
                      'or',
                      style: textTheme.bodyMedium?.copyWith(
                          color: isLightTheme
                              ? ExtraColors.black
                              : ExtraColors.white),
                    ),
                  ),
                  Expanded(
                    child: Divider(
                      color: isLightTheme
                          ? ExtraColors.black.withOpacity(0.5)
                          : ExtraColors.white.withOpacity(0.5),
                      thickness: 1.0,
                    ),
                  ),
                ],
              ),
              TButton(
                onPressed: () => _scanDocument(true),
                text: 'Scan',
                icon: IconlyLight.scan,
                isLightTheme: isLightTheme,
              ),
              const SizedBox(height: 32.0),
              if (_courseRegistrationFile != null)
                Column(
                  children: [
                    const Text('Selected Course Registration File:'),
                    const SizedBox(height: 8.0),
                    // Text(_courseRegistrationFile!.path),
                    const SizedBox(height: 16.0),
                    _courseRegistrationFile!.path.endsWith('.jpg') ||
                            _courseRegistrationFile!.path.endsWith('.png')
                        ? Image.file(
                            _courseRegistrationFile!,
                            height: MediaQuery.of(context).size.height / 5,
                            width: MediaQuery.of(context).size.width / 2,
                          )
                        : Image.memory(_coursePdfPageImage!.bytes),
                  ],
                ),
              const SizedBox(height: 32.0),
              Text(
                'Time Table',
                textAlign: TextAlign.center,
                style: textTheme.titleLarge?.copyWith(
                    color: isLightTheme ? ExtraColors.black : ExtraColors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.w600),
              ),
              const SizedBox(height: 16.0),
              TButton(
                onPressed: () {
                  if (_courseRegistrationFile == null) {
                    showDialog(
                        context: context,
                        barrierDismissible: true,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            title: Text('Error'),
                            content: Text(
                                'Please upload a course registration file first.'),
                          );
                        });
                  } else
                    _pickDocument(false);
                },
                text: 'Upload',
                icon: IconlyLight.upload,
                isLightTheme: isLightTheme,
              ),
              Row(
                children: <Widget>[
                  Expanded(
                    child: Divider(
                      color: isLightTheme
                          ? ExtraColors.black.withOpacity(0.5)
                          : ExtraColors.white.withOpacity(0.5),
                      thickness: 1.0,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 10.0, vertical: 10.0),
                    child: Text(
                      'or',
                      style: textTheme.bodyMedium?.copyWith(
                          color: isLightTheme
                              ? ExtraColors.black
                              : ExtraColors.white),
                    ),
                  ),
                  Expanded(
                    child: Divider(
                      color: isLightTheme
                          ? ExtraColors.black.withOpacity(0.5)
                          : ExtraColors.white.withOpacity(0.5),
                      thickness: 1.0,
                    ),
                  ),
                ],
              ),
              TButton(
                onPressed: () {
                  if (_courseRegistrationFile == null) {
                    showDialog(
                        context: context,
                        barrierDismissible: true,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            title: Text('Error'),
                            content: Text(
                                'Please upload a course registration file first.'),
                          );
                        });
                  } else
                    _scanDocument(false);
                },
                text: 'Scan',
                icon: IconlyLight.scan,
                isLightTheme: isLightTheme,
              ),
              const SizedBox(height: 32.0),
              if (_timetableFile != null)
                Column(
                  children: [
                    const Text('Selected Time Table File:'),
                    const SizedBox(height: 8.0),
                    // Text(_timetableFile!.path),
                    const SizedBox(height: 16.0),
                    _timetableFile!.path.endsWith('.jpg') ||
                            _timetableFile!.path.endsWith('.png')
                        ? Image.file(
                            _timetableFile!,
                            height: MediaQuery.of(context).size.height / 5,
                            width: MediaQuery.of(context).size.width / 2,
                            fit: BoxFit.cover,
                          )
                        : Image.memory(_timetablePageImage!.bytes)
                  ],
                ),
              const SizedBox(height: 70.0),
              Button(
                  onPressed: () {
                    // function to process images
                  },
                  text: 'Continue'),
              const SizedBox(height: 16.0),
              Text(
                'The course registration slip and timetable will be used to help you schedule your personal timetable and customize your experience.',
                style: textTheme.labelMedium?.copyWith(
                  color: isLightTheme ? ExtraColors.black : ExtraColors.white,
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class TButton extends StatelessWidget {
  const TButton({
    super.key,
    required this.onPressed,
    required this.text,
    required this.icon,
    required this.isLightTheme,
  });

  final String text;
  final IconData icon;
  final VoidCallback onPressed;
  final bool isLightTheme;

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    return Container(
      decoration: BoxDecoration(
        color: isLightTheme ? ExtraColors.white : ExtraColors.black,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: ExtraColors.buttonOutline),
      ),
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
            minimumSize: const Size(double.infinity, 50),
            backgroundColor:
                isLightTheme ? ExtraColors.white : ExtraColors.black),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              text,
              style: textTheme.titleLarge?.copyWith(
                  color: isLightTheme ? ExtraColors.black : ExtraColors.white,
                  fontSize: 17),
            ),
            const SizedBox(
              width: 10,
            ),
            Icon(
              icon,
              color: ExtraColors.buttonOutline,
            )
          ],
        ),
      ),
    );
  }
}
