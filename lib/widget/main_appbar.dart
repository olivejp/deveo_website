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
  static const List<String> menus = [
    'Services',
    'A propos',
    'Clients',
    'Témoignages',
    'Contact',
    'Candidater'
  ];

  @override
  Widget build(BuildContext context) {
    final TextStyle? textStyle =
        Theme.of(context).textTheme.bodyText2?.copyWith(
              fontWeight: FontWeight.w600,
              fontSize: 17,
            );
    return TextButtonTheme(
      data: TextButtonThemeData(
        style: ButtonStyle(
          padding: MaterialStateProperty.all(
            const EdgeInsets.all(buttonPadding),
          ),
        ),
      ),
      child: Container(
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
          child: LayoutHorizontalPadding(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const NavBarLeft(
                  leadingIconSize: leadingIconSize,
                ),
                Consumer<ChangeLayoutNotifier>(
                  builder: (_, value, child) {
                    if ([Layout.xlarge, Layout.large]
                        .contains(value.layoutSize)) {
                      return child!;
                    } else {
                      return PopupMenuButton(
                        icon: Icon(
                          Icons.reorder_rounded,
                          color: Colors.grey.shade900,
                        ),
                        itemBuilder: (BuildContext context) {
                          return menus
                              .map((e) =>
                                  PopupMenuItem(value: e, child: Text(e)))
                              .toList();
                        },
                      );
                    }
                  },
                  child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: menus
                          .map(
                            (e) => TextButton(
                                onPressed: () => context
                                    .read<OnStepClikNotifier>()
                                    .scroll(menus.indexOf(e)),
                                child: Text(e, style: textStyle)),
                          )
                          .toList()),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class NavBarLeft extends StatelessWidget {
  const NavBarLeft({
    Key? key,
    required this.leadingIconSize,
  }) : super(key: key);

  final double leadingIconSize;

  @override
  Widget build(BuildContext context) {
    return Row(
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
    );
  }
}
