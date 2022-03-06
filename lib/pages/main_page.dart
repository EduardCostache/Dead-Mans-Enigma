import 'package:dead_mans_enigma/functions/encrypt_decrypt_functions.dart';
import 'package:dead_mans_enigma/theme/button_style.dart';
import 'package:dead_mans_enigma/widgets/alert_widgets.dart';
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

  final int _keyLength = 32;

  List<File>? _files;

  late final TextEditingController _textController;
  late final FlyoutController _flyoutController;

  @override
  void initState() {
    super.initState();
    _textController = TextEditingController();
    _flyoutController = FlyoutController();
  }

  @override
  void dispose() {
    _textController.dispose();
    _flyoutController.dispose();
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
          Padding(
            padding: const EdgeInsets.only(top: 8.0),
            child: _files == null
                ? Container(
                    height: 19.0 // 19.0 height so that the layout doesn't shift
                    )
                : Text('You have selected ${_files!.length} file(s)',
                    style: const TextStyle(
                        fontSize: 16.0, fontStyle: FontStyle.italic)),
          ),
          const Expanded(
            child: SizedBox(),
          ),
          _buildSubtitle('2. Enter your key'),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _keyTextBox(),
              Flyout(
                controller: _flyoutController,
                contentWidth: 450,
                content: const FlyoutContent(
                  child: Text(
                    'Please note that keys must be no LONGER than 32 characters (including spaces). If the key is SHORTER than 32 characters, the program will fill in the remaining charatcers with empty spaces.',
                    style: TextStyle(fontSize: 16.0),
                  ),
                ),
                child: IconButton(
                  icon: const Icon(FluentIcons.info, size: 30.0),
                  onPressed: () {
                    _flyoutController.open = true;
                  },
                ),
              ),
            ],
          ),
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
      setState(() {
        _files = result.paths.map((path) => File(path!)).toList();
      });
    } else {
      setState(() {
        _files = null;
      });
    }
  }

  bool _validateKeyError(String key) {
    // true = error
    // false = valid
    if (key.isEmpty) {
      MyAlertWidgets.showErrorAlert(
          context, 'Invalid Key', 'Key cannot be empty!');
      return true;
    } else if (key.length > _keyLength) {
      MyAlertWidgets.showErrorAlert(context, 'Invalid Key',
          'Key must be less than $_keyLength characters, including spaces!');
      return true;
    } else {
      return false;
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
                onPressed: () async {
                  String key = _textController.text;

                  if (_files == null) {
                    MyAlertWidgets.showErrorAlert(
                        context,
                        'Invalid File Selection',
                        'You must select at least 1 file!');
                  } else {
                    if (!_validateKeyError(key)) {
                      await Enigma().encrypt(key, _files!, context);

                      // TODO: ADD LOADING BAR FOR ENCRYPTION

                    }
                  }
                },
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
                onPressed: () async {
                  String key = _textController.text;

                  if (_files == null) {
                    MyAlertWidgets.showErrorAlert(
                        context,
                        'Invalid File Selection',
                        'You must select at least 1 file!');
                  } else {
                    if (!_validateKeyError(key)) {
                      await Enigma().decrypt(key, _files!);
                      // TODO: ADD LOADING BAR FOR ENCRYPTION

                    }
                  }
                },
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
      padding: const EdgeInsets.all(8.0),
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
        width: _widgetWidth * 2,
        child: TextBox(
          decoration: BoxDecoration(
            border: Border.all(
              width: 2.0,
              color: MyThemeColors.regularBlue(),
            ),
          ),
          controller: _textController,
          style: TextStyle(
            fontSize: 20.0,
            color: MyThemeColors.textTitle(),
          ),
        ),
      ),
    );
  }
}
