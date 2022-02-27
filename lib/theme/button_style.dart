import 'package:fluent_ui/fluent_ui.dart';
import 'color_palette.dart';

class MyButtonStyles {
  static ButtonStyle defaultStyle() {
    return ButtonStyle(
      backgroundColor: ButtonState.all(Colors.white),
      border: ButtonState.resolveWith(
        (states) {
          if (states.isHovering) {
            return BorderSide(width: 2.0, color: MyThemeColors.regularBlue());
          }
          return const BorderSide(
            width: 2.0,
            //color: Color.fromARGB(255, 230, 230, 230),
            color: Colors.black,
          );
        },
      ),
    );
  }
}
