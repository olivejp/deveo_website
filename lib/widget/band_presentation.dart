import 'package:deveo_site_web/notifier/change_layout_notifier.dart';
import 'package:deveo_site_web/painter/circle_draw.dart';
import 'package:deveo_site_web/widget/layout_horizontal_padding.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BandPresentation extends StatefulWidget {
  const BandPresentation({Key? key}) : super(key: key);

  @override
  State<BandPresentation> createState() => _BandPresentationState();
}

class _BandPresentationState extends State<BandPresentation>
    with SingleTickerProviderStateMixin {
  AnimationController? _controller;
  Animation<double>? _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 60),
    );

    _animation = Tween(begin: 1.0, end: 200.0).animate(_controller!);
    _controller!.repeat(reverse: true);
  }

  @override
  void dispose() {
    _controller?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 700,
      width: double.infinity,
      child: AnimatedBuilder(
        animation: _animation!,
        builder: (context, child) {
          return Stack(
            children: [
              Positioned.fill(
                child: Container(),
              ),
              Positioned.fill(
                left: _animation!.value,
                child: Circle(
                  color: Theme.of(context).colorScheme.tertiary,
                  radius: 25,
                ),
              ),
              Positioned(
                top: 100,
                right: _animation!.value,
                child: Circle(
                  color: Theme.of(context).colorScheme.secondary,
                  radius: 25,
                ),
              ),
              LayoutHorizontalPadding(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Consumer<ChangeLayoutNotifier>(
                        builder: (context, value, child) {
                      double fontSize = 30;
                      switch (value.layoutSize) {
                        case Layout.xlarge:
                          fontSize = 80;
                          break;
                        case Layout.large:
                          fontSize = 70;
                          break;
                        case Layout.medium:
                          fontSize = 60;
                          break;
                        case Layout.small:
                          fontSize = 45;
                          break;
                      }
                      return Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Flexible(
                            flex: 1,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'DEVEO, une équipe de professionnelle',
                                  overflow: TextOverflow.fade,
                                  textAlign: TextAlign.start,
                                  style: Theme.of(context)
                                      .textTheme
                                      .headline1!
                                      .copyWith(fontSize: fontSize),
                                ),
                              ],
                            ),
                          ),
                          if ([Layout.medium, Layout.large, Layout.xlarge]
                              .contains(value.layoutSize))
                            Flexible(
                              flex: 1,
                              child: Container(
                                margin: const EdgeInsets.only(left: 20),
                                clipBehavior: Clip.antiAlias,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                child:
                                    Image.asset('assets/computer_image.jpeg'),
                              ),
                            )
                        ],
                      );
                    }),
                    Padding(
                      padding: const EdgeInsets.only(top: 75),
                      child: ConstrainedBox(
                        constraints: const BoxConstraints(maxWidth: 250),
                        child: ElevatedButton(
                          style: ButtonStyle(
                            shape: MaterialStateProperty.all(
                                const StadiumBorder()),
                            elevation:
                                MaterialStateProperty.resolveWith((states) {
                              if (states.contains(MaterialState.hovered)) {
                                return 20;
                              }
                              return 5;
                            }),
                            shadowColor:
                                MaterialStateProperty.resolveWith((states) {
                              if (states.contains(MaterialState.hovered)) {
                                return Theme.of(context).colorScheme.secondary;
                              }
                              return Colors.grey;
                            }),
                          ),
                          onPressed: () {},
                          child: Padding(
                            padding: const EdgeInsets.only(
                                top: 18.0,
                                bottom: 18.0,
                                left: 25.0,
                                right: 25.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(
                                      left: 20, right: 20),
                                  child: Text(
                                    'Candidater',
                                    style: Theme.of(context).textTheme.button,
                                  ),
                                ),
                                const Icon(Icons.newspaper)
                              ],
                            ),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}

class Circle extends StatelessWidget {
  const Circle({Key? key, required this.radius, required this.color})
      : super(key: key);
  final double radius;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: CircleDraw(
        radius: radius,
        color: color,
      ),
    );
  }
}
