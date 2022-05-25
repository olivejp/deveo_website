import 'package:deveo_site_web/utils/utils.dart';
import 'package:flutter/material.dart';

class OnCandidateClikNotifier extends ChangeNotifier {
  OnCandidateClikNotifier(this.keys, this.scrollController);

  final List<GlobalKey> keys;
  final ScrollController scrollController;

  scroll(int position) {
    final GlobalKey key = keys[position];
    final double yPosition = Utils.getYPosition(key);
    scrollController.animateTo(
      yPosition,
      duration: const Duration(seconds: 2),
      curve: Curves.ease,
    );
  }
}
