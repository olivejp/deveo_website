import 'package:deveo_site_web/notifier/change_layout_notifier.dart';
import 'package:deveo_site_web/notifier/on_candidate_clik_notifier.dart';
import 'package:deveo_site_web/widget/layout_horizontal_padding.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MainAppBar extends StatelessWidget {
  const MainAppBar({Key? key}) : super(key: key);
  static const double topBottomPadding = 10;
  static const double buttonPadding = 20;
  static const double leadingIconSize = 40;

  @override
  Widget build(BuildContext context) {
    final TextStyle? textStyle =
        Theme.of(context).textTheme.bodyText2?.copyWith(
              fontWeight: FontWeight.w600,
              fontSize: 17,
            );
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).scaffoldBackgroundColor,
        border: Border(
          bottom: BorderSide(color: Colors.grey.shade100),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.only(
          top: topBottomPadding,
          bottom: topBottomPadding,
        ),
        child: TextButtonTheme(
          data: TextButtonThemeData(
            style: ButtonStyle(
              padding: MaterialStateProperty.all(
                const EdgeInsets.all(buttonPadding),
              ),
            ),
          ),
          child: LayoutHorizontalPadding(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Image.asset(
                      'assets/favicon.png',
                      width: leadingIconSize,
                      height: leadingIconSize,
                    ),
                    Text(
                      'DEVEO',
                      style: Theme.of(context).textTheme.subtitle1,
                    ),
                  ],
                ),
                Consumer<ChangeLayoutNotifier>(
                  builder: (context, value, child) {
                    bool isSmall = false;
                    if ([Layout.xlarge, Layout.large]
                        .contains(value.layoutSize)) {
                      isSmall = false;
                    } else {
                      isSmall = true;
                    }
                    if (isSmall) {
                      return Icon(
                        Icons.reorder_rounded,
                        color: Colors.grey.shade900,
                      );
                    } else {
                      return child!;
                    }
                  },
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      TextButton(
                        onPressed: () =>
                            context.read<OnStepClikNotifier>().scroll(1),
                        child: Text(
                          'Services',
                          style: textStyle,
                        ),
                      ),
                      TextButton(
                        onPressed: () =>
                            context.read<OnStepClikNotifier>().scroll(2),
                        child: Text(
                          'A propos',
                          style: textStyle,
                        ),
                      ),
                      TextButton(
                        onPressed: () =>
                            context.read<OnStepClikNotifier>().scroll(2),
                        child: Text(
                          'Clients',
                          style: textStyle,
                        ),
                      ),
                      TextButton(
                        onPressed: () =>
                            context.read<OnStepClikNotifier>().scroll(3),
                        child: Text(
                          'Témoignages',
                          style: textStyle,
                        ),
                      ),
                      TextButton(
                        onPressed: () =>
                            context.read<OnStepClikNotifier>().scroll(4),
                        child: Text(
                          'Candidater',
                          style: textStyle,
                        ),
                      ),
                      TextButton(
                        onPressed: () =>
                            context.read<OnStepClikNotifier>().scroll(5),
                        child: Text(
                          'Contact',
                          style: textStyle,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
