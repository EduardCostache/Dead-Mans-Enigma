import 'package:dead_mans_enigma/theme/button_style.dart';
import 'package:fluent_ui/fluent_ui.dart';

import '../theme/color_palette.dart';

class EncryptionPage extends StatefulWidget {
  const EncryptionPage({Key? key}) : super(key: key);

  @override
  _EncryptionPageState createState() => _EncryptionPageState();
}

class _EncryptionPageState extends State<EncryptionPage> {
  final double _buttonTextSize = 20.0;
  final double _buttonWidth = 90.0;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Column(
        children: [
          Stack(
            children: [
              Container(
                alignment: Alignment.topLeft,
                padding: const EdgeInsets.all(8.0),
                child: _backButton(),
              ),
              Container(
                padding: const EdgeInsets.only(top: 10.0),
                alignment: Alignment.center,
                child: Text(
                  'Encryption',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 36.0,
                    color: MyThemeColors.textTitle(),
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Button _backButton() {
    return Button(
      style: MyButtonStyles.defaultStyle(),
      child: Container(
        width: _buttonWidth,
        padding: const EdgeInsets.symmetric(vertical: 6.0, horizontal: 4.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Padding(
              padding: EdgeInsets.only(right: 4.0),
              child: Icon(FluentIcons.back, size: 22.0),
            ),
            Text(
              'Back',
              style: TextStyle(
                color: MyThemeColors.textTitle(),
                fontSize: _buttonTextSize,
              ),
            ),
          ],
        ),
      ),
      onPressed: () {
        Navigator.pop(context);
      },
    );
  }
}
