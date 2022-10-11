import 'package:flutter/cupertino.dart';

import '../downloadButton/download_button.dart';

abstract class DownloadController implements ChangeNotifier {
  DownloadStatus get downloadStatus;
  double get progress;
  void startDownload();
  void stopDownload();
  void openDownload();
}
