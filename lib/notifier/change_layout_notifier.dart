import 'package:flutter/material.dart';

enum Layout { xlarge, large, medium, small }

class ChangeLayoutNotifier extends ChangeNotifier {
  Layout layoutSize = Layout.medium;
  Size? size;

  changeConstraints(Size size) {
    if (size.width >= 1680) {
      layoutSize = Layout.xlarge;
    } else if (size.width >= 1200) {
      layoutSize = Layout.large;
    } else if (size.width >= 800) {
      layoutSize = Layout.medium;
    } else {
      layoutSize = Layout.small;
    }
    this.size = size;
    notifyListeners();
  }
}
