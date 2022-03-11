import 'package:fluent_ui/fluent_ui.dart';

class FileProgressProvider extends ChangeNotifier {
  String filename = '';
  double progress = 0;

  void updateProgress(double incrementStep) {
    progress += incrementStep;
    notifyListeners();
  }

  void updateFilename(String newFilename) {
    filename = newFilename;
    notifyListeners();
  }

  void reset() {
    filename = '';
    progress = 0;
    notifyListeners();
  }
}
