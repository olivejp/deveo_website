import 'package:deveo_site_web/widget/band_resource_card.dart';
import 'package:deveo_site_web/widget/layout_horizontal_padding.dart';
import 'package:deveo_site_web/widget/resource_avatar_svg.dart';
import 'package:flutter/material.dart';
import 'package:flutter_emoji/flutter_emoji.dart';

class BandResources extends StatelessWidget {
  const BandResources({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutHorizontalPadding(
      bottom: 100,
      child: Column(
        children: [
          Text(
            'Notre équipe',
            style: Theme.of(context).textTheme.headline1,
          ),
          Wrap(
            direction: Axis.horizontal,
            runAlignment: WrapAlignment.center,
            alignment: WrapAlignment.center,
            spacing: 15,
            runSpacing: 15,
            children: const [
              ResourceAvatarSvg(
                padding: 20,
                roundnessFactor: 25,
                height: 300,
                colors: [
                  Colors.deepOrange,
                  Colors.amber,
                  Colors.amberAccent,
                ],
                stops: [0, 0.5, 0.6],
                svgAsset: 'assets/krimo.svg',
              ),
            ],
          ),
        ],
      ),
    );
  }
}
