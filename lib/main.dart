import 'package:dead_mans_enigma/pages/main_page.dart';
import 'package:dead_mans_enigma/providers/file_processing.dart';
import 'package:fluent_ui/fluent_ui.dart';
import 'package:provider/provider.dart';
import 'package:window_manager/window_manager.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await windowManager.ensureInitialized();
  await windowManager.waitUntilReadyToShow();

  // Use it only after calling `hiddenWindowAtLaunch`
  windowManager.waitUntilReadyToShow().then((_) async {
    await windowManager.center();
    await windowManager.setTitle("Dead Man's Enigma");
    await windowManager.setResizable(false);
    await windowManager.focus();
    await windowManager.show();
  });
  runApp(
    const DeadMansEnigma(),
  );
}

class DeadMansEnigma extends StatefulWidget {
  const DeadMansEnigma({Key? key}) : super(key: key);

  @override
  _DeadMansEnigmaState createState() => _DeadMansEnigmaState();
}

class _DeadMansEnigmaState extends State<DeadMansEnigma> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => FileProgressProvider(),
      child: FluentApp(
        theme: ThemeData(fontFamily: 'Roboto'),
        home: const MainPage(),
      ),
    );
  }
}
