import 'package:deveo_site_web/widget/layout_horizontal_padding.dart';
import 'package:flutter/material.dart';
import 'package:flutter_emoji/flutter_emoji.dart';

class BandCandidater extends StatelessWidget {
  const BandCandidater({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var parser = EmojiParser();
    return Padding(
      padding: const EdgeInsets.only(
        top: 150,
        bottom: 150,
      ),
      child: LayoutHorizontalPadding(
        child: Column(
          children: [
            Text(
              "Candidater",
              style: Theme.of(context).textTheme.headline1,
            ),
            Wrap(
              direction: Axis.horizontal,
              children: [
                Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(
                        top: 25,
                        bottom: 25,
                      ),
                      child: Text(
                        'Développeur(se) Fullstack Java / Angular',
                        style: Theme.of(context).textTheme.subtitle1,
                      ),
                    ),
                    RichText(
                      text: TextSpan(
                          style: Theme.of(context).textTheme.bodyText2,
                          children: [
                            const TextSpan(
                                text:
                                    'Pour renforcer nos équipes et répondre aux besoins de nos clients, nous sommes à la recherche d\'un(e) développeur(se) d\'applications dans le domaine '),
                            TextSpan(
                              text: 'JAVA / J2EE',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Theme.of(context).colorScheme.primary,
                              ),
                            ),
                            const TextSpan(text: '.\n\n'),
                            const TextSpan(
                                text: 'Votre mission serait de : \n\n'),
                            const TextSpan(
                                text:
                                    '- Participer aux ateliers d\'études et de conception\n'),
                            const TextSpan(
                                text:
                                    '- Développer les fonctionnalités décrites dans le cahier des charges dans un environnement Java/J2EE\n'),
                            const TextSpan(
                                text:
                                    '- Rédiger et metter à jour les spécifications techniques et fonctionnelles\n\n'),
                            const TextSpan(
                                text:
                                    'Nous recherchons un profil à fort potentiel. Votre esprit d\'analyse, vos qualités relationnelles et votre capacité d\'adaptation seront vos atouts pour réussir les missions qui vous seront confiées.\n\n'),
                            const TextSpan(
                                text:
                                    'Vous êtes ingénieur ou diplômé universitaire avec option informatique, doté d\'une première expérience significative sur un poste similaire, alors envoyez-nous votre CV à l\'adresse contact@deveo.nc'),
                          ]),
                    ),
                  ],
                ),
                Form(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Row(
                        children: [
                          Flexible(
                            child: TextFormField(
                              decoration: const InputDecoration(
                                icon: Icon(Icons.person),
                                helperText: 'Nom',
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 20,
                          ),
                          Flexible(
                            child: TextFormField(
                              decoration: const InputDecoration(
                                helperText: 'Prénom',
                              ),
                            ),
                          ),
                        ],
                      ),
                      TextFormField(
                        decoration: const InputDecoration(
                          icon: Icon(Icons.mail_outline_rounded),
                          helperText: 'Email',
                        ),
                      ),
                      TextFormField(
                        decoration: const InputDecoration(
                          icon: Icon(Icons.phone_android),
                          helperText: 'Téléphone',
                        ),
                      ),
                      TextButton(
                        onPressed: () {},
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Padding(
                              padding:
                                  const EdgeInsets.only(left: 20, right: 20),
                              child: Text(
                                'Envoyer',
                                style: Theme.of(context).textTheme.button,
                              ),
                            ),
                            const Icon(Icons.send)
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
