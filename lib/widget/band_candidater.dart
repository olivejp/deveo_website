import 'package:deveo_site_web/widget/layout_horizontal_padding.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class BandCandidater extends StatelessWidget {
  const BandCandidater({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormState>();
    const regexpEmail =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
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
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
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
                        const TextSpan(text: 'Votre mission serait de : \n\n'),
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
                Padding(
                  padding: const EdgeInsets.only(top: 50),
                  child: ConstrainedBox(
                    constraints: const BoxConstraints(maxWidth: 600),
                    child: Form(
                      key: formKey,
                      child: FocusTraversalGroup(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            TextFormField(
                              autovalidateMode:
                                  AutovalidateMode.onUserInteraction,
                              maxLength: 255,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Le nom est obligatoire';
                                }
                                return null;
                              },
                              style: Theme.of(context).textTheme.caption,
                              decoration: const InputDecoration(
                                border: OutlineInputBorder(),
                                icon: Icon(Icons.person),
                                labelText: 'Nom',
                              ),
                            ),
                            TextFormField(
                              autovalidateMode:
                                  AutovalidateMode.onUserInteraction,
                              maxLength: 255,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'L\'email est obligatoire';
                                }
                                if (!RegExp(regexpEmail).hasMatch(value)) {
                                  return "L'adresse mail n'est pas formatée correctement'.";
                                }
                                return null;
                              },
                              style: Theme.of(context).textTheme.caption,
                              decoration: const InputDecoration(
                                icon: Icon(Icons.mail_outline_rounded),
                                border: OutlineInputBorder(),
                                labelText: 'Email',
                              ),
                            ),
                            TextFormField(
                              minLines: 5,
                              maxLines: 10,
                              style: Theme.of(context).textTheme.caption,
                              decoration: const InputDecoration(
                                border: OutlineInputBorder(),
                                icon: Icon(Icons.message_outlined),
                                labelText: 'Message',
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 15),
                              child: TextButton(
                                onPressed: () {
                                  if (formKey.currentState!.validate()) {
                                    print("Send something");
                                  }
                                },
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    const Padding(
                                      padding: EdgeInsets.only(
                                          top: 10,
                                          bottom: 10,
                                          left: 20,
                                          right: 20),
                                      child: Text(
                                        'Envoyer',
                                      ),
                                    ),
                                    Icon(
                                      Icons.send,
                                      color: Theme.of(context)
                                          .colorScheme
                                          .secondary,
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
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
