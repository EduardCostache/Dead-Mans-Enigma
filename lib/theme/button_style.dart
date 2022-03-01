import 'package:fluent_ui/fluent_ui.dart';
import 'color_palette.dart';

class MyButtonStyles {
  static ButtonStyle defaultStyle() {
    return ButtonStyle(
      backgroundColor: ButtonState.all(Colors.white),
      border: ButtonState.resolveWith(
        (states) {
          if (states.isHovering) {
            return BorderSide(
              width: 2.0,
              color: MyThemeColors.regularBlue(),
            );
          }
          return const BorderSide(
            width: 2.0,
            color: Colors.black,
          );
        },
      ),
    );
  }

  static ButtonStyle dialogYes() {
    return ButtonStyle(
      backgroundColor: ButtonState.all(MyThemeColors.regularBlue()),
    );
  }

  static ButtonStyle dialogNo() {
    return ButtonStyle(
      backgroundColor: ButtonState.all(Colors.white),
    );
  }
}
