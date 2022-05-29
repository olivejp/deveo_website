import 'package:deveo_site_web/notifier/change_layout_notifier.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LayoutHorizontalPadding extends StatelessWidget {
  const LayoutHorizontalPadding({
    Key? key,
    required this.child,
    this.top = 0,
    this.bottom = 0,
  }) : super(key: key);
  final Widget child;
  final double top;
  final double bottom;

  @override
  Widget build(BuildContext context) {
    return Consumer<ChangeLayoutNotifier>(
      builder: (_, value, child) {
        double padding = 20;
        switch (value.layoutSize) {
          case Layout.xlarge:
            padding = 200;
            break;
          case Layout.large:
            padding = 150;
            break;
          case Layout.medium:
            padding = 100;
            break;
          case Layout.small:
            padding = 20;
            break;
        }
        return Padding(
          padding: EdgeInsets.only(
              left: padding, right: padding, top: top, bottom: bottom),
          child: child,
        );
      },
      child: child,
    );
  }
}
