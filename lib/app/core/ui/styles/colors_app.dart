import 'package:flutter/widgets.dart';

class ColorsApp {
  static ColorsApp? _instance;

  ColorsApp._(); // não da para fazer new na class

  static ColorsApp get i {
    _instance ??= ColorsApp._();
    return _instance!;
  }

  Color get primary => const Color(0XFF791435);
  Color get secondary => const Color(0XFFFDCE50);
  Color get yellow => const Color(0XFFFDCE50);
  Color get grey => const Color(0XFFCCCCCC);
  Color get greyDart => const Color(0XFF999999);
}

// * Para não ter que ficar usando Color.app.i.yellow, vamos criar uma extension
extension ColorsAppExtensions on BuildContext {
  ColorsApp get colors => ColorsApp.i;
}
