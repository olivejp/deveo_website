import 'package:flutter/material.dart';

class MainAppBar extends StatelessWidget {
  const MainAppBar({Key? key}) : super(key: key);

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
        child: Wrap(
          alignment: WrapAlignment.end,
          children: [
            TextButton(
              onPressed: () {},
              child: Text(
                'A propos',
                style: Theme.of(context).textTheme.bodyText1,
              ),
            ),
            TextButton(
              onPressed: () {},
              child: Text(
                'Services',
                style: Theme.of(context).textTheme.bodyText1,
              ),
            ),
            TextButton(
              onPressed: () {},
              child: Text(
                'Clients',
                style: Theme.of(context).textTheme.bodyText1,
              ),
            ),
            TextButton(
              onPressed: () {},
              child: Text(
                'Témoignages',
                style: Theme.of(context).textTheme.bodyText1,
              ),
            ),
            TextButton(
              onPressed: () {},
              child: Text(
                'Candidater',
                style: Theme.of(context).textTheme.bodyText1,
              ),
            ),
            TextButton(
              onPressed: () {},
              child: Text(
                'Contact',
                style: Theme.of(context).textTheme.bodyText1,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
