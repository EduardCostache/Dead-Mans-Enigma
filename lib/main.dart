import 'package:dead_mans_enigma/pages/home_page.dart';
import 'package:fluent_ui/fluent_ui.dart';
import 'package:window_manager/window_manager.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await windowManager.ensureInitialized();
  await windowManager.waitUntilReadyToShow();

  // Use it only after calling `hiddenWindowAtLaunch`
  windowManager.waitUntilReadyToShow().then((_) async {
    await windowManager.setSize(const Size(800, 600));
    await windowManager.center();
    await windowManager.setTitle("Dead Man's Enigma");
    await windowManager.setResizable(false);
    await windowManager.show();
    await windowManager.focus();
  });
  runApp(DeadMansEnigma());
}

class DeadMansEnigma extends StatefulWidget {
  const DeadMansEnigma({Key? key}) : super(key: key);

  @override
  _DeadMansEnigmaState createState() => _DeadMansEnigmaState();
}

class _DeadMansEnigmaState extends State<DeadMansEnigma> {
  @override
  Widget build(BuildContext context) {
    return FluentApp(
      home: Center(
        child: Text('Hello windows'),
      ),
    );
  }
}
