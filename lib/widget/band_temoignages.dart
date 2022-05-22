import 'package:deveo_site_web/notifier/change_layout_notifier.dart';
import 'package:deveo_site_web/widget/band_competence_card.dart';
import 'package:deveo_site_web/widget/layout_horizontal_padding.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BandTemoignages extends StatelessWidget {
  const BandTemoignages({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutHorizontalPadding(
      child: Wrap(
        direction: Axis.horizontal,
        children: const [
          Padding(
            padding: EdgeInsets.all(8.0),
            child: BandCompetenceCard(
              title: "Architecture logiciel",
              description:
                  "Nous concevons des architectures durables sur mesure et orientées services afin de garantir la pérénité et la stabilité de vos applications",
              icon: Icons.account_tree_rounded,
            ),
          ),
          Padding(
            padding: EdgeInsets.all(8.0),
            child: BandCompetenceCard(
              title: "Développement",
              description:
                  "Nous développons des applications, des sites internet et des logiciels qui correspondent à vos besoins tout en respectant les normes standards et les bonnes pratiques du développement logiciel",
              icon: Icons.computer_rounded,
            ),
          ),
          Padding(
            padding: EdgeInsets.all(8.0),
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
