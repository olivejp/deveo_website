import 'package:carousel_slider/carousel_slider.dart';
import 'package:deveo_site_web/theming/theme_data_utils.dart';
import 'package:flutter/material.dart';

class Temoignage {
  Temoignage(this.description, this.auteur, this.titreAuteur);

  final String description;
  final String auteur;
  final String titreAuteur;
}

class BandTemoignages extends StatelessWidget {
  const BandTemoignages({Key? key}) : super(key: key);
  static List<Temoignage> temoignages = [
    Temoignage(
        "En tant que chef de projet AMOA j’ai eu l’opportunité de travailler avec DEVEO sur le projet BOOST, application de gestion des demandeurs et offres d’emploi incluant la gestion des Jobs d’été : application web utilisée par plus de 7000 jeunes scolarisés résidents en province Sud.\n\nAbdelkrim, David et Jean-Paul ont fait preuve d’un grand professionnalisme et d’une forte implication tout au long du projet dont les attentes étaient fortes et les délais serrés. Ils ont su développer une application de qualité tout en démontrant une grande capacité d’adaptation et de souplesse face au besoin métier évolutif.\n\nPlus que des développeurs, leurs points forts sont leur capacité d’analyse des problématiques et leur force de proposition face à celles-ci. Je suis très satisfait des prestations réalisées et n’hésiterai pas à refaire appel à Deveo pour de futurs projets.",
        "Nicolas D",
        "Chef de projets AMOA"),
    Temoignage(
        "J’ai travaillé avec les membres de DEVEO dans le cadre de plusieurs prestations. Les projets se sont toujours très bien déroulés et ont abouti à des livrables répondant parfaitement au besoin exprimé. Les différents membres de l’équipe DEVEO sont compétents, disponibles, proactifs et s’adaptent parfaitement aux aléas qui peuvent jalonner la réalisation d’un projet. Si l’on ajoute à cela une sympathie et une bonne humeur constante, je ne peux que recommander les services de DEVEO.",
        "Yann C",
        "Chef de projets AMOA"),
    Temoignage(
        "Nous avons fait appel à Deveo pour développer ALOHA, notre application de gestion de la relation à l’usager. David a fait preuve d’une grande écoute et a été force de propositions pour nous suggérer des fonctionnalités toujours plus en phase avec notre besoin.\n\nSon efficacité et sa grande conscience professionnelle nous ont permis d’avancer rapidement et de tenir les délais fixés. Enfin, sa bonne humeur a rendu ce projet encore plus stimulant. Cette collaboration est un véritable succès, je n’ai relevé que des points positifs !",
        "Catherine B",
        "Chargée de projets"),
    Temoignage(
        "J'ai découvert la société Deveo pour la réalisation du projet OCMC. Ce projet fut réalisé avec succès, dans les délais prévus initialement.\n\nJ'apprécie les compétences techniques d'Abdelkrim. C'est un développeur à l'écoute des besoins et toujours force de propositions. En plus il fait très bien le café et ses blagues pourries du matin sont particulièrement appréciables, Merci à toi Abdelkrim",
        "Hugo R",
        "Chef de projet SIG"),
    Temoignage(
        "La méthode agile était une première pour moi, j’avais de l’appréhension, mais celle-ci s’est très vite évaporée car les développeurs ont su me rassurer et me guider dans la démarche.\n\nTout au long du projet, ils ont été force de proposition afin d’optimiser le système, le rendre plus fiable et plus intuitif. Toujours à l’écoute, patients, efficaces et très professionnels. Le projet s’est déroulé dans une très bonne ambiance ce qui a contribué à son succès.",
        "Fabienne H",
        "Chef de bureau facturation"),
    Temoignage(
        "C'est un plaisir de travailler avec DEVEO. J'apprécie la réactivité et la qualité du travail pour la gestion de la TMA SIDO. J'ai fortement apprécié travailler avec Jean Paul sur le projet SIDO Mobile. Son expertise a grandement contribué à l'aboutissement d'une application fonctionnelle.",
        "Cynthia D",
        "Product Owner - Administrateur fonctionnel"),
    Temoignage(
        "Nous avons eu l’occasion de travailler avec Deveo sur plusieurs projets au cours de cette année : \n\n- TMA sur le SI de gestion des objets postaux (SIDO)\n\n- Refonte du SI pour la gestion de la facturation des machines à affranchir (MAF)\n\nNous avons été très satisfait des prestations réalisées. \n\nDeveo a été à l’écoute de nos besoins, a su s’adapter quand c’était nécessaire et grâce à leurs compétences et leur professionnalisme, nous avons pu atteindre nos objectifs avec succès.",
        "Mickael H",
        "Chef du bureau SI Postal"),
    Temoignage(
        "L'équipe de Deveo a apporté son expertise technique dans le contexte du développement d’une application de la gestion de la relation à l’usager. Ils ont montré tout au long de la mission leur engagement sur le périmètre fonctionnel et le respect des délais.\n\nLeur expérience de nos métiers, du fonctionnement de l'administration et leur capacité à initier des échanges constructifs avec les MOA ont permis de construire et d’améliorer les nouvelles fonctionnalités tout au long du développement de l’application. Leurs compétences et leur grand professionnalisme ont été une réelle plus-value pour la réussite du projet.",
        "Grégory D",
        "Chef de projet informatique MOE"),
  ];

  @override
  Widget build(BuildContext context) {
    final CarouselController controller = CarouselController();
    const double iconSize = 35;

    return Stack(
      children: [
        Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(
                bottom: 20,
              ),
              child: Text(
                'Témoignages',
                style: Theme.of(context).textTheme.headline1,
              ),
            ),
            CarouselSlider(
              carouselController: controller,
              options: CarouselOptions(
                  height: 450,
                  autoPlay: true,
                  scrollPhysics: const NeverScrollableScrollPhysics(),
                  enlargeCenterPage: true,
                  pageSnapping: true,
                  autoPlayInterval: const Duration(seconds: 5)),
              items: temoignages.map((i) {
                return ConstrainedBox(
                  constraints: const BoxConstraints(
                    maxWidth: 1200,
                    minWidth: 500,
                  ),
                  child: Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    elevation: ThemeDataUtils.elevation,
                    shadowColor: Theme.of(context).colorScheme.primary,
                    child: Padding(
                      padding: const EdgeInsets.only(
                        top: 30,
                        bottom: 30,
                        left: 50,
                        right: 50,
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Expanded(
                            child: Center(
                              child: Text(
                                i.description,
                                overflow: TextOverflow.fade,
                                textAlign: TextAlign.justify,
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyText2!
                                    .copyWith(
                                      fontStyle: FontStyle.italic,
                                      color: Colors.black54,
                                    ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 15),
                            child: Text(
                              "${i.auteur} - ${i.titreAuteur}",
                              style: Theme.of(context).textTheme.subtitle1,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              }).toList(),
            ),
          ],
        ),
        Positioned(
          left: 50,
          top: 0,
          bottom: 0,
          child: IconButton(
            icon: const Icon(
              Icons.arrow_back,
              size: iconSize,
              color: Colors.black54,
            ),
            onPressed: () => controller.previousPage(),
          ),
        ),
        Positioned(
          right: 50,
          top: 0,
          bottom: 0,
          child: IconButton(
            icon: const Icon(
              Icons.arrow_forward,
              size: iconSize,
              color: Colors.black54,
            ),
            onPressed: () => controller.nextPage(),
          ),
        ),
      ],
    );
  }
}
