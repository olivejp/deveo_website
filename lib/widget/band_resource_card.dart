import 'package:deveo_site_web/notifier/change_layout_notifier.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BandResourceCard extends StatefulWidget {
  const BandResourceCard(
      {Key? key,
      this.radius = 20,
      required this.assetImage,
      required this.nom,
      required this.description})
      : super(key: key);

  final double radius;
  final String assetImage;
  final String nom;
  final String description;
  final double heightSizedBox = 400;
  final double circleAvatarRadius = 40;

  @override
  State<BandResourceCard> createState() {
    return _BandResourceCardState();
  }
}

class _BandResourceCardState extends State<BandResourceCard>
    with SingleTickerProviderStateMixin {
  AnimationController? _controller;
  Animation<double>? _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(microseconds: 10),
    );

    _animation = Tween(begin: 1.0, end: 5.0).animate(_controller!);
  }

  @override
  void dispose() {
    _controller?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<ChangeLayoutNotifier>(
      builder: (context, value, child) {
        double maxWidth = 300;
        switch (value.layoutSize) {
          case Layout.xlarge:
            maxWidth = 300;
            break;
          case Layout.large:
            maxWidth = 400;
            break;
          case Layout.medium:
            maxWidth = 350;
            break;
          case Layout.small:
            maxWidth = 600;
            break;
        }
        return ConstrainedBox(
          constraints: BoxConstraints(
            maxWidth: maxWidth,
            maxHeight: widget.heightSizedBox,
          ),
          child: child,
        );
      },
      child: AnimatedBuilder(
          animation: _animation!,
          builder: (context, child) {
            return MouseRegion(
              cursor: SystemMouseCursors.click,
              onEnter: (event) => _controller!.forward(),
              onExit: (event) => _controller!.reverse(),
              child: Card(
                clipBehavior: Clip.antiAlias,
                elevation: _animation!.value,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(widget.radius),
                ),
                child: Stack(
                  children: [
                    Positioned(
                      top: 0,
                      left: 0,
                      right: 0,
                      child: Container(
                        color: Color(Theme.of(context).colorScheme.primary.value),
                        height: widget.heightSizedBox / 4,
                      ),
                    ),
                    Column(
                      children: [
                        Padding(
                          padding: EdgeInsets.only(
                              top: (widget.heightSizedBox / 4) -
                                  widget.circleAvatarRadius,
                              bottom: 20),
                          child: CircleAvatar(
                            foregroundImage: AssetImage(widget.assetImage),
                            radius: widget.circleAvatarRadius,
                          ),
                        ),
                        Text(
                          widget.nom,
                          style: Theme.of(context).textTheme.subtitle1,
                        ),
                        Center(
                          child: Text(widget.description),
                        )
                      ],
                    )
                  ],
                ),
              ),
            );
          }),
    );
  }
}
