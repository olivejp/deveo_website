import 'package:deveo_site_web/notifier/on_candidate_clik_notifier.dart';
import 'package:deveo_site_web/theming/theme_data_utils.dart';
import 'package:deveo_site_web/utils/utils.dart';
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
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'DEVEO NC',
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

  @override
  Widget build(BuildContext context) {
    return NotificationListener(
      onNotification: (notification) {
        if (notification is ScrollEndNotification) {
          final double competenceY = Utils.getYPosition(competencesKey);
          final double aProposY = Utils.getYPosition(aProposKey);
          final double temoignagesY = Utils.getYPosition(temoignagesKey);
          final double candidaterY = Utils.getYPosition(candidaterKey);
          final double resourceY = Utils.getYPosition(resourcesKey);

          final double competenceHeight = Utils.getHeight(competencesKey) ?? 0;
          final double aProposHeight = Utils.getHeight(aProposKey) ?? 0;
          final double temoignagesHeight = Utils.getHeight(temoignagesKey) ?? 0;
          final double candidaterHeight = Utils.getHeight(candidaterKey) ?? 0;
          final double resourceHeight = Utils.getHeight(resourcesKey) ?? 0;

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
      child: ChangeNotifierProvider(
        create: (BuildContext context) => OnStepClikNotifier([
          presentationKey,
          competencesKey,
          aProposKey,
          temoignagesKey,
          candidaterKey,
          resourcesKey
        ], _scrollController),
        child: MultiNotifier(
          child: Scaffold(
            appBar: AppBar(
              title: const MainAppBar(),
              centerTitle: true,
              elevation: 1,
              titleSpacing: 0,
            ),
            body: Stack(
              children: [
                SingleChildScrollView(
                  controller: _scrollController,
                  child: Padding(
                    padding: const EdgeInsets.only(top: 50),
                    child: Column(
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
                        onTap: (position) {
                          print('Ma position : $position');
                          context
                              .read<OnStepClikNotifier>()
                              .scroll(position.toInt());
                        },
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
      ),
    );
  }
}
