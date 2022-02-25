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
            child: const Text(
              "Dead Man's Enigma",
              style: TextStyle(
                fontWeight: FontWeight.w700,
                fontSize: 44.0,
                color: Colors.black,
                fontFamily: 'Roboto',
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(vertical: 18.0),
            child: const Text(
              'Choose either to encrypt or decrypt you data',
              style: TextStyle(
                  fontWeight: FontWeight.w400,
                  fontFamily: 'Roboto',
                  fontSize: 22.0,
                  color: Colors.grey),
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(vertical: 18.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
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
                ),
                Container(
                  //height: 30.0,
                  //width: 50.0,
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
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
