import 'package:deveo_site_web/widget/band_competence_card.dart';
import 'package:deveo_site_web/widget/layout_horizontal_padding.dart';
import 'package:flutter/material.dart';

class BandCompetences extends StatelessWidget {
  const BandCompetences({Key? key}) : super(key: key);
  static const double cardMaxWidth = 400;
  static const double cardMinWidth = 200;
  static const double edgeInset = 8.0;

  @override
  Widget build(BuildContext context) {
    return LayoutHorizontalPadding(
      child: Wrap(
        runAlignment: WrapAlignment.start,
        crossAxisAlignment: WrapCrossAlignment.start,
        direction: Axis.horizontal,
        children: const [
          Padding(
            padding: EdgeInsets.all(edgeInset),
            child: BandCompetenceCard(
              title: "Architecture logiciel",
              description:
                  "Nous concevons des architectures durables sur mesure et orientées services afin de garantir la pérénité et la stabilité de vos applications",
              icon: Icons.account_tree_rounded,
            ),
          ),
          Padding(
            padding: EdgeInsets.all(edgeInset),
            child: BandCompetenceCard(
              title: "Développement",
              description:
                  "Nous développons des applications, des sites internet et des logiciels qui correspondent à vos besoins tout en respectant les normes standards et les bonnes pratiques du développement logiciel",
              icon: Icons.computer_rounded,
            ),
          ),
          Padding(
            padding: EdgeInsets.all(edgeInset),
            child: BandCompetenceCard(
              title: "Conseil",
              description:
                  "Nous vous assistons dans l'expression de vos besoins en vous apportant des conseils pragmatiques à la conception d'une solution qui répond à ces mêmes besoins",
              icon: Icons.handshake_rounded,
            ),
          ),
        ],
      ),
    );
  }
}
