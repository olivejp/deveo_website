import 'package:deveo_site_web/notifier/change_layout_notifier.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MultiNotifier extends StatelessWidget {
  const MultiNotifier({Key? key, required this.child}) : super(key: key);
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ChangeLayoutNotifier()),
      ],
      builder: (context, child) {
        WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
          context
              .read<ChangeLayoutNotifier>()
              .changeConstraints(MediaQuery.of(context).size);
        });
        return child!;
      },
      child: child,
    );
  }
}
