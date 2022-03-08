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
    var fileProvider =
        Provider.of<FileProgressProvider>(context, listen: false);

    showDialog(
      context: context,
      builder: (context) {
        return ContentDialog(
          title: const Text('Progress'),
          content: Column(
            children: [
              SizedBox(
                width: double.infinity,
                child: ValueListenableBuilder<double>(
                  valueListenable: fileProvider.progress,
                  builder: (context, value, child) {
                    return ProgressBar(value: value, strokeWidth: 12);
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: ValueListenableBuilder<String>(
                  valueListenable: fileProvider.filename,
                  builder: (context, value, child) {
                    var currentProgress = fileProvider.progress.value;
                    var modeText = mode ? 'decrypting' : 'encrypting';

                    if (currentProgress == 100.0) {
                      return const Text(
                        "All files completed... \nFiles saved in Documents/Dead Man's Enigma Output/",
                        style: TextStyle(
                            fontSize: 16.0, fontStyle: FontStyle.italic),
                      );
                    } else {
                      return Text(
                        'currently $modeText $value...',
                        style: const TextStyle(
                            fontSize: 12.0, fontStyle: FontStyle.italic),
                      );
                    }
                  },
                ),
              ),
            ],
          ),
          actions: [
            const SizedBox(),
            ValueListenableBuilder<double>(
              valueListenable: fileProvider.progress,
              builder: (context, value, child) {
                var currentProgress = fileProvider.progress.value;

                if (currentProgress == 100.0) {
                  return Button(
                    style: MyButtonStyles.dialogYes(),
                    child: const Text('Done', style: TextStyle(fontSize: 16.0)),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  );
                } else {
                  return Button(
                    style: MyButtonStyles.dialogNo(),
                    child:
                        const Text('Wait...', style: TextStyle(fontSize: 16.0)),
                    onPressed: () {},
                  );
                }
              },
            )
          ],
        );
      },
    );
  }
}
