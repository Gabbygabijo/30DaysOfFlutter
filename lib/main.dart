import 'package:flutter/material.dart';
import 'package:screenshot/screenshot.dart';
import 'package:share_plus/share_plus.dart';
import 'dart:io'; // Import dart:io for file operations 
import 'package:path_provider/path_provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<StatefulWidget> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final _screenshotController = ScreenshotController();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Screenshot(
              controller: _screenshotController,
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  children: [
                    Image.asset('images/codepassionately.png'),
                    const Text(
                      'Code Passionately',
                      style:
                          TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                    )
                  ],
                ),
              ),
            ),
            TextButton(
                onPressed: _takeScreenshot,
                child: const Text('Take Screenshot and share'))
          ],
        )),
      ),
    );
  }

  void _takeScreenshot() async {
    final imageFile = await _screenshotController.capture();
    if (imageFile != null) {
      final tempDir = await getTemporaryDirectory();
      final filePath = '${tempDir.path}/screenshot.png';
      final file = await File(filePath).writeAsBytes(imageFile);
      Share.shareXFiles([XFile(file.path)], text: 'Check out this screenshot!');
    } else {
      print('Screenshot failed');
    }
  }
}
