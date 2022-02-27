import 'package:dead_mans_enigma/pages/encryption_page.dart';
import 'package:dead_mans_enigma/theme/button_style.dart';
import 'package:dead_mans_enigma/theme/color_palette.dart';
import 'package:fluent_ui/fluent_ui.dart';

import 'decryption_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final double _buttonTextSize = 20.0;

  final double _buttonVerticalPadding = 18.0;
  final double _buttonHorizontalPadding = 100.0;

  final double _rowChildrenPadding = 18.0;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Center(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(vertical: _rowChildrenPadding),
              child: Text(
                "Dead Man's Enigma",
                style: TextStyle(
                    fontSize: 44.0,
                    color: MyThemeColors.textTitle(),
                    fontWeight: FontWeight.w500),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: _rowChildrenPadding),
              child: Text(
                "Choose either to Encrypt or Decrypt your files.",
                style: TextStyle(
                  fontSize: 22.0,
                  color: MyThemeColors.textSubtitle(),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: _rowChildrenPadding),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  _encryptButton(),
                  _decryptButton(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Button _encryptButton() {
    return Button(
      style: MyButtonStyles.defaultStyle(),
      child: Container(
        padding: EdgeInsets.symmetric(
            vertical: _buttonVerticalPadding,
            horizontal: _buttonHorizontalPadding),
        child: Text(
          'Encrypt',
          style: TextStyle(
            color: MyThemeColors.textTitle(),
            fontSize: _buttonTextSize,
          ),
        ),
      ),
      onPressed: () {
        Navigator.push(context,
            FluentPageRoute(builder: (context) => const EncryptionPage()));
      },
    );
  }

  Button _decryptButton() {
    return Button(
      style: MyButtonStyles.defaultStyle(),
      child: Container(
        padding: EdgeInsets.symmetric(
            vertical: _buttonVerticalPadding,
            horizontal: _buttonHorizontalPadding),
        child: Text(
          'Decrypt',
          style: TextStyle(
            color: MyThemeColors.textTitle(),
            fontSize: _buttonTextSize,
          ),
        ),
      ),
      onPressed: () {
        Navigator.push(context,
            FluentPageRoute(builder: (context) => const DecryptionPage()));
      },
    );
  }
}
