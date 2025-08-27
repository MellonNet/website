import 'package:flutter/material.dart';

extension ContextUtils on BuildContext {
  TextTheme get textTheme => Theme.of(this).textTheme;
  ColorScheme get colorScheme => Theme.of(this).colorScheme;
  bool get isMobile => MediaQuery.sizeOf(this).width < 750;
}
