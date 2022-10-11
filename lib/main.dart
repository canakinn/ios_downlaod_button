import 'package:download_button/downloadButton/download_button.dart';
import 'package:download_button/model/simulated_download_controller.dart';
import 'package:flutter/material.dart';

import 'abstract/download_controller.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Download Button',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Download Button'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late final DownloadController _downloadController;

  @override
  void initState() {
    super.initState();
    _downloadController = SimulatedDownloadController(
      onOpenDownload: () => _openDownload(),
    );
  }

  void _openDownload() {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Open App'),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final downloadController = _downloadController;
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: SizedBox(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              width: 100,
              child: AnimatedBuilder(
                  animation: downloadController,
                  builder: (context, child) {
                    return DownloadButton(
                      status: downloadController.downloadStatus,
                      downloadProgress: downloadController.progress,
                      onCancel: downloadController.stopDownload,
                      onDownload: downloadController.startDownload,
                      onOpen: downloadController.openDownload,
                    );
                  }),
            ),
          ],
        ),
      ),
    );
  }
}
