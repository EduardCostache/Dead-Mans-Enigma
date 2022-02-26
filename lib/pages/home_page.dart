import 'package:dead_mans_enigma/theme/color_palette.dart';
import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter/cupertino.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final double _buttonTextSize = 20.0;

  final double _buttonVerticalPadding = 18.0;
  final double _buttonHorizontalPadding = 100.0;
  final double _buttonSeperatorPadding = 40.0;

  final double _rowChildrenPadding = 18.0;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Center(
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.symmetric(vertical: _rowChildrenPadding),
              child: Text(
                "Dead Man's Enigma",
                style: TextStyle(
                    fontSize: 44.0,
                    color: MyThemeColors.textTitle(),
                    fontWeight: FontWeight.w500),
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(vertical: _rowChildrenPadding),
              child: Text(
                "Choose either to Encrypt or Decrypt your files.",
                style: TextStyle(
                  fontSize: 22.0,
                  color: MyThemeColors.textSubtitle(),
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(vertical: _rowChildrenPadding),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    padding: EdgeInsets.only(right: _buttonSeperatorPadding),
                    child: _encryptButton(),
                  ),
                  Container(
                    padding: EdgeInsets.only(left: _buttonSeperatorPadding),
                    child: _decryptButton(),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  ButtonStyle _buttonStyle() {
    return ButtonStyle(
      backgroundColor: ButtonState.all(Colors.white),
      border: ButtonState.resolveWith(
        (states) {
          if (states.contains(ButtonStates.hovering)) {
            return BorderSide(width: 2.0, color: MyThemeColors.regularBlue());
          }
          return const BorderSide(
            width: 2.0,
            color: Color.fromARGB(255, 230, 230, 230),
          );
        },
      ),
    );
  }

  Button _encryptButton() {
    return Button(
      style: _buttonStyle(),
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
      onPressed: () {},
    );
  }

  Button _decryptButton() {
    return Button(
      style: _buttonStyle(),
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
      onPressed: () {},
    );
  }
}
