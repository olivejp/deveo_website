import 'package:deveo_site_web/notifier/on_candidate_clik_notifier.dart';
import 'package:deveo_site_web/painter/circle_draw.dart';
import 'package:deveo_site_web/widget/band_presentation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MainAppBar extends StatelessWidget {
  MainAppBar({Key? key}) : super(key: key);
  final GlobalKey rightRowKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(18.0),
      child: TextButtonTheme(
        data: TextButtonThemeData(
          style: ButtonStyle(
            padding: MaterialStateProperty.all(
              const EdgeInsets.all(20),
            ),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: const [
                Circle(
                  radius: 10,
                  color: Colors.black,
                ),
                Text('DEVEO'),
              ],
            ),
            Row(key: rightRowKey, children: [
              TextButton(
                onPressed: () => context.read<OnStepClikNotifier>().scroll(1),
                child: Text(
                  'Services',
                  style: Theme.of(context).textTheme.bodyText1,
                ),
              ),
              TextButton(
                onPressed: () => context.read<OnStepClikNotifier>().scroll(2),
                child: Text(
                  'A propos',
                  style: Theme.of(context).textTheme.bodyText1,
                ),
              ),
              TextButton(
                onPressed: () => context.read<OnStepClikNotifier>().scroll(2),
                child: Text(
                  'Clients',
                  style: Theme.of(context).textTheme.bodyText1,
                ),
              ),
              TextButton(
                onPressed: () => context.read<OnStepClikNotifier>().scroll(3),
                child: Text(
                  'Témoignages',
                  style: Theme.of(context).textTheme.bodyText1,
                ),
              ),
              TextButton(
                onPressed: () => context.read<OnStepClikNotifier>().scroll(4),
                child: Text(
                  'Candidater',
                  style: Theme.of(context).textTheme.bodyText1,
                ),
              ),
              TextButton(
                onPressed: () => context.read<OnStepClikNotifier>().scroll(5),
                child: Text(
                  'Contact',
                  style: Theme.of(context).textTheme.bodyText1,
                ),
              ),
            ]),
          ],
        ),
      ),
    );
  }
}
