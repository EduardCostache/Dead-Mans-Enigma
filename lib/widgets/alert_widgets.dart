import 'package:fluent_ui/fluent_ui.dart';

import '../theme/button_style.dart';

class MyAlertWidgets {
  static showErrorAlert(BuildContext context, String title, String message) {
    showDialog(
      context: context,
      builder: (context) {
        return ContentDialog(
          title: Text(title),
          content: Text(message, style: const TextStyle(fontSize: 16.0)),
          actions: [
            const SizedBox(),
            Button(
                style: MyButtonStyles.dialogYes(),
                child: const Text('OK', style: TextStyle(fontSize: 16.0)),
                onPressed: () {
                  Navigator.pop(context);
                }),
          ],
        );
      },
    );
  }

  static showLoadingAlert(BuildContext context, String filename) {
    showDialog(
      context: context,
      builder: (context) {
        return ContentDialog(
          title: const Text('Progress'),
          content: Column(
            children: [
              SizedBox(
                width: double.infinity,
                child: ProgressBar(value: 50.0, strokeWidth: 8),
              ),
              Padding(
                padding: const EdgeInsets.all(4.0),
                child: Text(
                  'currently encrypting $filename...',
                  style: const TextStyle(
                      fontSize: 10.0, fontStyle: FontStyle.italic),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
