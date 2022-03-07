import 'package:fluent_ui/fluent_ui.dart';

class FileProcessor with ChangeNotifier {
  String _filename = '';
  double _progress = 0.0;

  double get progress => _progress;

  String get filename => _filename;

  void updateFilename(String newFilename) {
    _filename = newFilename;
    notifyListeners();
  }

  void incrementProgress(double newProgress) {
    _progress += newProgress;
    notifyListeners();
  }

  void reset() {
    _filename = '';
    _progress = 0.0;
  }
}
