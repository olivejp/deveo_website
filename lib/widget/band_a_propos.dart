import 'package:deveo_site_web/notifier/change_layout_notifier.dart';
import 'package:deveo_site_web/widget/layout_horizontal_padding.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BandAPropos extends StatelessWidget {
  const BandAPropos({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutHorizontalPadding(
      top: 50,
      bottom: 150,
      child: Consumer<ChangeLayoutNotifier>(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                "A propos de nous",
                style: Theme.of(context).textTheme.headline1,
              ),
              Text(
                "Société de développement logiciel et de sites internet fondée en 2018 à Nouméa en Nouvelle Calédonie, DEVEO NC conseille et accompagne ses clients dans la définition, l'étude, la conception et la réalisation de leurs projets.",
                textAlign: TextAlign.justify,
                style: Theme.of(context).textTheme.subtitle2,
              ),
              Text(
                "\nNos équipes mettent tout en oeuvre pour satisfaire nos clients afin de réponde à leur besoin en leur offrant un service de qualité",
                style: Theme.of(context).textTheme.subtitle2,
              ),
            ],
          ),
          builder: (context, value, child) {
            return Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                if ([Layout.medium, Layout.large, Layout.xlarge]
                    .contains(value.layoutSize))
                  Expanded(
                    flex: 1,
                    child: Container(
                      margin: const EdgeInsets.only(
                        right: 20,
                      ),
                      clipBehavior: Clip.antiAlias,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Image.asset(
                        'assets/developper_group.jpeg',
                        fit: BoxFit.fitHeight,
                      ),
                    ),
                  ),
                Expanded(
                  flex: 2,
                  child: child!,
                ),
              ],
            );
          }),
    );
  }
}
