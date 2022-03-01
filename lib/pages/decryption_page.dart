import 'package:fluent_ui/fluent_ui.dart';

import '../theme/button_style.dart';
import '../theme/color_palette.dart';

class DecryptionPage extends StatefulWidget {
  const DecryptionPage({Key? key}) : super(key: key);

  @override
  _DecryptionPageState createState() => _DecryptionPageState();
}

class _DecryptionPageState extends State<DecryptionPage> {
  final double _buttonTextSize = 20.0;

  final double _buttonVerticalPadding = 8.0;
  final double _buttonHorizontalPadding = 4.0;

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
                  'Decryption',
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
        padding: EdgeInsets.symmetric(
            vertical: _buttonVerticalPadding,
            horizontal: _buttonHorizontalPadding),
        child: Row(
          mainAxisSize: MainAxisSize.min,
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
