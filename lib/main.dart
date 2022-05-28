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
import 'package:flutter_svg/svg.dart';
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

          final double competenceHeight = Utils.getHeight(competencesKey);
          final double aProposHeight = Utils.getHeight(aProposKey);
          final double temoignagesHeight = Utils.getHeight(temoignagesKey);
          final double candidaterHeight = Utils.getHeight(candidaterKey);
          final double resourceHeight = Utils.getHeight(resourcesKey);

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
        create: (BuildContext context) => OnCandidateClikNotifier(
            [presentationKey, competencesKey, aProposKey, temoignagesKey, candidaterKey, resourcesKey],
            _scrollController),
        child: MultiNotifier(
          child: Scaffold(
            body: Stack(
              children: [
                SingleChildScrollView(
                  controller: _scrollController,
                  child: Stack(
                    children: [
                      Padding(
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
                      const Positioned(
                        top: 0,
                        left: 0,
                        right: 0,
                        child: MainAppBar(),
                      ),
                      SizedBox(
                        height: 580,
                        child: AspectRatio(
                          aspectRatio:  320 / 580,
                          child: Stack(
                            fit: StackFit.expand,
                            children: [
                              ClipPath(
                                clipper: MyCustomClipper(),
                                child: Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(50),
                                    color: Colors.amber,
                                    gradient: const LinearGradient(
                                      colors: [
                                        Colors.deepOrange,
                                        Colors.amber,
                                        Colors.amberAccent,
                                      ],
                                      stops: [0, 0.5, 0.6],
                                      begin: Alignment.bottomCenter,
                                      end: Alignment.topCenter,
                                    ),
                                  ),
                                ),
                              ),
                              Container(
                                child: SvgPicture.asset(
                                  "assets/krimo.svg",
                                  fit: BoxFit.contain,
                                  alignment: Alignment.center,
                                ),
                              ),
                            ],
                          ),
                        ),
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
                        onTap: (position) {
                          print('Ma position : $position');
                          context.read<OnCandidateClikNotifier>().scroll(position.toInt());
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

class MyCustomClipper extends CustomClipper<Path> {
  final double heightFactor = 0.2;
  final double roundnessFactor = 50.0;

  @override
  Path getClip(Size size) {
    final Path path = Path();
    path.moveTo(0, size.height * 0.33);
    path.lineTo(0, size.height - roundnessFactor);
    path.quadraticBezierTo(0, size.height, roundnessFactor, size.height);
    path.lineTo(size.width - roundnessFactor, size.height);
    path.quadraticBezierTo(size.width, size.height, size.width, size.height - roundnessFactor);
    path.lineTo(size.width, roundnessFactor * 2);
    path.quadraticBezierTo(size.width, 0, size.width - roundnessFactor * 3, roundnessFactor * 2);
    path.lineTo(roundnessFactor, size.height * 0.33 + 10);
    path.quadraticBezierTo(0, size.height * 0.33 + roundnessFactor, 0, size.height * 0.33 + roundnessFactor * 2);
    // path.moveTo(0, size.height * 0.3);
    // path.quadraticBezierTo(size.width * 0.25, size.height * 0.25, size.width * 0.5, size.height * 0.3);
    // path.quadraticBezierTo(size.width * 0.75, size.height * 0.35, size.width, size.height * 0.3);
    // path.lineTo(size.width, size.height);
    // path.lineTo(0, size.height);
    // path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return false;
  }
}
