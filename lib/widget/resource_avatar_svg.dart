import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ResourceAvatarSvg extends StatelessWidget {
  const ResourceAvatarSvg({
    Key? key,
    required this.roundnessFactor,
    required this.height,
    required this.colors,
    required this.svgAsset,
    this.stops,
    required this.padding,
  }) : super(key: key);

  final String svgAsset;
  final double roundnessFactor;
  final double height;
  final List<Color> colors;
  final List<double>? stops;
  final EdgeInsetsGeometry padding;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      child: AspectRatio(
        aspectRatio: 320 / 580,
        child: Stack(
          fit: StackFit.expand,
          children: [
            ClipPath(
              clipper: MyCustomClipper(roundnessFactor: roundnessFactor),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(roundnessFactor),
                  gradient: LinearGradient(
                    colors: colors,
                    stops: stops,
                    begin: Alignment.bottomCenter,
                    end: Alignment.topCenter,
                  ),
                ),
              ),
            ),
            Container(
              clipBehavior: Clip.antiAlias,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  bottomRight: Radius.circular(roundnessFactor),
                ),
              ),
              child: Padding(
                padding: padding,
                child: SvgPicture.asset(
                  svgAsset,
                  fit: BoxFit.contain,
                  alignment: Alignment.bottomRight,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class MyCustomClipper extends CustomClipper<Path> {
  MyCustomClipper({required this.roundnessFactor});

  final double heightFactor = 0.2;
  final double roundnessFactor;

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
