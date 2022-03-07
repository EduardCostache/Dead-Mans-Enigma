import 'package:fluent_ui/fluent_ui.dart';

class FileProgressProvider {
  ValueNotifier<String> filename = ValueNotifier('');
  ValueNotifier<double> progress = ValueNotifier(0.0);

  void updateProgress(double incrementStep) {
    progress.value += incrementStep;
  }

  void updateFilename(String newFilename) {
    filename.value = newFilename;
  }

  void reset() {
    filename.value = '';
    progress.value = 0.0;
  }
}
