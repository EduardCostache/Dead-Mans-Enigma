import 'package:fluent_ui/fluent_ui.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final double _buttonTextSize = 18.0;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(vertical: 18.0),
            child: _buildTitle("Dead Man's Enigma", 44.0),
          ),
          Container(
            padding: const EdgeInsets.symmetric(vertical: 18.0),
            child: _buildTitle(
                'Choose to either Encrypt or Decrypt your files.', 22.0),
          ),
          Container(
            padding: const EdgeInsets.symmetric(vertical: 18.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _encryptButton(),
                _decryptButton(),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Container _buildTitle(String title, double fontSize) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 18.0),
      child: Text(
        title,
        style: TextStyle(fontSize: fontSize, color: Colors.grey),
      ),
    );
  }

  Container _encryptButton() {
    return Container(
      padding: const EdgeInsets.all(8.0),
      child: Button(
        child: Padding(
          padding: const EdgeInsets.all(14.0),
          child: Text(
            'Encrypt',
            style: TextStyle(
              color: Colors.black,
              fontSize: _buttonTextSize,
            ),
          ),
        ),
        onPressed: () {},
      ),
    );
  }

  Container _decryptButton() {
    return Container(
      padding: const EdgeInsets.all(8.0),
      child: Button(
        child: Padding(
          padding: const EdgeInsets.all(14.0),
          child: Text(
            'Decrypt',
            style: TextStyle(
              color: Colors.black,
              fontSize: _buttonTextSize,
            ),
          ),
        ),
        onPressed: () {},
      ),
    );
  }
}
