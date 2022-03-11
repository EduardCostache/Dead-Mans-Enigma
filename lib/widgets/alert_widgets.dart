import 'package:dead_mans_enigma/providers/file_processing.dart';
import 'package:fluent_ui/fluent_ui.dart';
import 'package:provider/provider.dart';

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

  static showLoadingAlert(BuildContext context, bool mode) {
    // mode == false : encrypting
    // mode == true : decrypting

    showDialog(
      context: context,
      builder: (context) {
        return Consumer<FileProgressProvider>(
          builder: (context, value, child) {
            var progress = value.progress;
            var filename = value.filename;
            var modeText = mode ? 'decrypting' : 'encrypting';

            if (progress < 100.0) {
              return ContentDialog(
                title: const Text('Progress'),
                content: Column(
                  children: [
                    SizedBox(
                      width: double.infinity,
                      child: Consumer<FileProgressProvider>(
                        builder: (context, value, child) {
                          return ProgressBar(value: progress, strokeWidth: 12);
                        },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 8.0),
                      child: Text(
                        'currently $modeText $filename...',
                        style: const TextStyle(
                            fontSize: 12.0, fontStyle: FontStyle.italic),
                      ),
                    ),
                  ],
                ),
                actions: [
                  Button(
                    style: MyButtonStyles.dialogNo(),
                    child:
                        const Text('Wait...', style: TextStyle(fontSize: 16.0)),
                    onPressed: () {},
                  )
                ],
              );
            } else {
              return ContentDialog(
                title: const Text('Progress'),
                content: Column(
                  children: [
                    SizedBox(
                      width: double.infinity,
                      child: Consumer<FileProgressProvider>(
                        builder: (context, value, child) {
                          return const ProgressBar(
                              value: 100.0, strokeWidth: 12);
                        },
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.only(top: 8.0),
                      child: Text(
                        "All files completed... \nFiles saved in Documents/Dead Man's Enigma Output/",
                        style: TextStyle(
                            fontSize: 16.0, fontStyle: FontStyle.italic),
                      ),
                    ),
                  ],
                ),
                actions: [
                  Button(
                    style: MyButtonStyles.dialogYes(),
                    child: const Text('Done', style: TextStyle(fontSize: 16.0)),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  )
                ],
              );
            }
          },
        );
      },
    );
  }
}
