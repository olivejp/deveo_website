import 'package:deveo_site_web/notifier/change_layout_notifier.dart';
import 'package:deveo_site_web/widget/band_competence_card.dart';
import 'package:deveo_site_web/widget/layout_horizontal_padding.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BandCandidater extends StatelessWidget {
  const BandCandidater({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 150, bottom: 150),
      child: LayoutHorizontalPadding(
        child: Column(
          children: [
            Text(
              "Candidater",
              style: Theme.of(context).textTheme.headline1,
            ),
            Form(
              child: Column(
                children: [
                  TextFormField(
                    decoration: InputDecoration(
                      icon: Icon(Icons.phone_android),
                      helperText: 'Téléphone',
                    ),
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                      icon: Icon(Icons.phone_android),
                      helperText: 'Téléphone',
                    ),
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                      icon: Icon(Icons.phone_android),
                      helperText: 'Téléphone',
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
