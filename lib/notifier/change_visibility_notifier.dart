import 'package:flutter/material.dart';

class ChangeVisibilityNotifier extends ChangeNotifier {
  double componentVisible = 0;

  setVisible(double component) {
    if (component > componentVisible) {
      componentVisible = component;
      notifyListeners();
    }
  }

  setInvisible(double component) {
    if (componentVisible == component) {
      double calculation = component - 1;
      componentVisible = (calculation > 0) ? calculation : 0;
      notifyListeners();
    }
  }
}
