import 'package:deveo_site_web/theming/theme_data_utils.dart';
import 'package:deveo_site_web/widget/band_a_propos.dart';
import 'package:deveo_site_web/widget/band_candidater.dart';
import 'package:deveo_site_web/widget/band_competences.dart';
import 'package:deveo_site_web/widget/band_presentation.dart';
import 'package:deveo_site_web/widget/band_resources.dart';
import 'package:deveo_site_web/widget/band_temoignages.dart';
import 'package:deveo_site_web/widget/layout_notifier.dart';
import 'package:deveo_site_web/widget/main_appbar.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'DEVEO',
      theme: ThemeDataUtils.getThemeData(),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  MyHomePage({Key? key}) : super(key: key);
  final ScrollController _scrollController = ScrollController();
  final GlobalKey presentationKey = LabeledGlobalKey('presentation-key');
  final GlobalKey competencesKey = LabeledGlobalKey('competences-key');
  final GlobalKey aProposKey = LabeledGlobalKey('aPropos-key');
  final GlobalKey temoignagesKey = LabeledGlobalKey('temoignages-key');
  final GlobalKey candidaterKey = LabeledGlobalKey('candidater-key');
  final GlobalKey resourcesKey = LabeledGlobalKey('resources-key');
  final ValueNotifier<double> _valueScrollIndicator = ValueNotifier(0);

  double getYPosition(GlobalKey key) {
    final RenderBox box = key.currentContext?.findRenderObject() as RenderBox;
    final Offset offset = box.localToGlobal(Offset.zero);
    return offset.dy;
  }

  double getHeight(GlobalKey key) {
    final RenderBox box = key.currentContext?.findRenderObject() as RenderBox;
    return box.size.height;
  }

  @override
  Widget build(BuildContext context) {
    return NotificationListener(
      onNotification: (notification) {
        if (notification is ScrollEndNotification) {
          final double competenceY = getYPosition(competencesKey);
          final double aProposY = getYPosition(aProposKey);
          final double temoignagesY = getYPosition(temoignagesKey);
          final double candidaterY = getYPosition(candidaterKey);
          final double resourceY = getYPosition(resourcesKey);

          final double competenceHeight = getHeight(competencesKey);
          final double aProposHeight = getHeight(aProposKey);
          final double temoignagesHeight = getHeight(temoignagesKey);
          final double candidaterHeight = getHeight(candidaterKey);
          final double resourceHeight = getHeight(resourcesKey);

          if (resourceY < resourceHeight / 2) {
            _valueScrollIndicator.value = 5;
          } else if (candidaterY < candidaterHeight / 2) {
            _valueScrollIndicator.value = 4;
          } else if (temoignagesY < temoignagesHeight / 2) {
            _valueScrollIndicator.value = 3;
          } else if (aProposY < aProposHeight / 2) {
            _valueScrollIndicator.value = 2;
          } else if (competenceY < competenceHeight / 2) {
            _valueScrollIndicator.value = 1;
          } else {
            _valueScrollIndicator.value = 0;
          }
        }
        return false;
      },
      child: MultiNotifier(
        child: Scaffold(
          body: Stack(
            children: [
              SingleChildScrollView(
                controller: _scrollController,
                child: Stack(
                  children: [
                    Column(
                      children: [
                        BandPresentation(
                          key: presentationKey,
                        ),
                        BandCompetences(
                          key: competencesKey,
                        ),
                        BandAPropos(
                          key: aProposKey,
                        ),
                        BandTemoignages(
                          key: temoignagesKey,
                        ),
                        BandCandidater(
                          key: candidaterKey,
                        ),
                        BandResources(
                          key: resourcesKey,
                        )
                      ],
                    ),
                    const Positioned(
                      top: 0,
                      left: 0,
                      right: 0,
                      child: MainAppBar(),
                    ),
                  ],
                ),
              ),
              Positioned(
                top: 0,
                bottom: 0,
                left: 0,
                child: ValueListenableBuilder<double>(
                  valueListenable: _valueScrollIndicator,
                  builder: (context, value, child) {
                    return DotsIndicator(
                      axis: Axis.vertical,
                      dotsCount: 6,
                      position: value,
                      decorator: DotsDecorator(
                        color: Colors.black87, // Inactive color
                        activeColor: Theme.of(context).colorScheme.secondary,
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
