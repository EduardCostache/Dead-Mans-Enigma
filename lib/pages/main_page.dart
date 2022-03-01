import 'dart:developer';

import 'package:dead_mans_enigma/functions/encryption_function.dart';
import 'package:dead_mans_enigma/theme/button_style.dart';
import 'package:fluent_ui/fluent_ui.dart';
import 'dart:io';

import 'package:file_picker/file_picker.dart';

import '../theme/color_palette.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  final double _buttonTextSize = 20.0;
  final double _widgetWidth = 200.0;

  late TextEditingController _textController;

  @override
  void initState() {
    super.initState();
    _textController = TextEditingController();
  }

  @override
  void dispose() {
    _textController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Column(
        children: [
          _header(),
          const Expanded(
            child: SizedBox(),
          ),
          _buildSubtitle('1. Choose your files'),
          _pickFilesButton(),
          _buildSubtitle('2. Enter your key'),
          _keyTextBox(),
          const Expanded(
            child: SizedBox(),
          ),
          _footer(),
        ],
      ),
    );
  }

  void pickFiles() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['txt'],
      allowMultiple: true,
    );

    if (result != null) {
      List<File> files = result.paths.map((path) => File(path!)).toList();
      inspect(files);
    } else {
      // User canceled the picker
    }
  }

  Container _header() {
    return Container(
      padding: const EdgeInsets.only(top: 10.0),
      alignment: Alignment.center,
      child: Text(
        "Dead Man's Enigma",
        textAlign: TextAlign.center,
        style: TextStyle(
          fontSize: 44.0,
          color: MyThemeColors.textTitle(),
          fontWeight: FontWeight.w400,
        ),
      ),
    );
  }

  Padding _footer() {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12.0),
            child: SizedBox(
              width: _widgetWidth,
              child: Button(
                style: MyButtonStyles.defaultStyle(),
                onPressed: () {},
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 12.0),
                  child: Text(
                    'Encrypt',
                    style: TextStyle(
                      color: MyThemeColors.textTitle(),
                      fontSize: _buttonTextSize,
                    ),
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12.0),
            child: SizedBox(
              width: _widgetWidth,
              child: Button(
                style: MyButtonStyles.defaultStyle(),
                onPressed: () {},
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 12.0),
                  child: Text(
                    'Decrypt',
                    style: TextStyle(
                      color: MyThemeColors.textTitle(),
                      fontSize: _buttonTextSize,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Container _buildSubtitle(String text) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      width: _widgetWidth,
      child: Text(
        text,
        textAlign: TextAlign.start,
        style: TextStyle(
          fontSize: 22.0,
          color: MyThemeColors.textSubtitle(),
        ),
      ),
    );
  }

  Padding _pickFilesButton() {
    return Padding(
      padding: const EdgeInsets.only(top: 8.0, bottom: 64.0),
      child: SizedBox(
        width: _widgetWidth,
        child: Button(
          style: MyButtonStyles.defaultStyle(),
          onPressed: () {
            pickFiles();
          },
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 12.0),
            child: Text(
              'Choose Files',
              style: TextStyle(
                color: MyThemeColors.textTitle(),
                fontSize: _buttonTextSize,
              ),
            ),
          ),
        ),
      ),
    );
  }

  Padding _keyTextBox() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: SizedBox(
        width: _widgetWidth,
        child: TextBox(
          controller: _textController,
          style: TextStyle(
            fontSize: 20.0,
            color: MyThemeColors.textTitle(),
          ),
        ),
      ),
    );
  }
  // Container _testEncryption() {
  //   return Container(
  //     alignment: Alignment.center,
  //     padding: const EdgeInsets.only(top: 16.0),
  //     child: Button(
  //       style: MyButtonStyles.defaultStyle(),
  //       child: Container(
  //         width: _widgetWidth,
  //         padding: const EdgeInsets.symmetric(vertical: 6.0, horizontal: 4.0),
  //         child: Text(
  //           'Test Encryption',
  //           style: TextStyle(
  //             color: MyThemeColors.textTitle(),
  //             fontSize: _buttonTextSize,
  //           ),
  //         ),
  //       ),
  //       onPressed: () {
  //         String decryptedText = Encryption().encrypt(_textController.text);

  //         setState(() {
  //           _decryptedText = decryptedText;
  //         });
  //       },
  //     ),
  //   );
  // }
}
