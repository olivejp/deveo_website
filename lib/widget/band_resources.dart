import 'package:deveo_site_web/widget/band_resource_card.dart';
import 'package:deveo_site_web/widget/layout_horizontal_padding.dart';
import 'package:flutter/material.dart';
import 'package:flutter_emoji/flutter_emoji.dart';
import 'package:provider/provider.dart';
import 'package:visibility_detector/visibility_detector.dart';

class BandResources extends StatelessWidget {
  const BandResources({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var parser = EmojiParser();
    return LayoutHorizontalPadding(
      bottom: 100,
      child: Wrap(
        direction: Axis.horizontal,
        runAlignment: WrapAlignment.center,
        alignment: WrapAlignment.center,
        spacing: 15,
        runSpacing: 15,
        children: [
          // const BandResourceCard(
          //   assetImage: "assets/krimo_retouche.png",
          //   nom: "Abdelkrim RAIS",
          //   description: "Fondateur de la société.",
          // ),
          const BandResourceCard(
            assetImage: "assets/david.jpeg",
            nom: "David BROUSTE",
            description: "Premier employé et premier associé de DEVEO.",
          ),
          BandResourceCard(
            assetImage: "assets/jp.jpeg",
            nom: parser.emojify("Jean Paul OLIVE :olive:"),
            description: "Troisième et dernier associé de DEVEO.",
          ),
        ],
      ),
    );
  }
}
