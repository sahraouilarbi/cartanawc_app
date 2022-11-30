import 'package:cartanawc_app/presentation/accueil/view/tab_accueil/widgets/devenir_distributeur_widget.dart';
import 'package:cartanawc_app/presentation/accueil/view/tab_accueil/widgets/espace_professionnel_widget.dart';
import 'package:cartanawc_app/presentation/accueil/view/tab_accueil/widgets/nouveautes_widget.dart';
import 'package:cartanawc_app/presentation/accueil/view/tab_accueil/widgets/partenaires_widget.dart';
import 'package:cartanawc_app/presentation/common/section_header_widget.dart';
import 'package:cartanawc_app/presentation/ressources/appsize_manager.dart';
import 'package:cartanawc_app/presentation/ressources/color_manager.dart';
import 'package:flutter/material.dart';

/*
 * Build Page Accueil from de site : www2.cartana.dz
 */
class TabAccueil extends StatelessWidget {
  const TabAccueil({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        color: Colors.black,
        child: Column(
          children: [
            const Partenaire(),
            const SectionHeader(sectionTitle: 'NOUVEAUTES'),
            const Nouveautes(),
            const SectionHeader(sectionTitle: 'ESPACE PROFESSIONNEL'),
            EspaceProfessionnel(
              src: 'assets/images/salon_coiffure_institut_beaute_bg.jpg',
              headerText: 'SALON DE COIFFURE\nINSTITUT DE BEAUTE',
              paragraphText:
                  "Bénéficiez d'échantillons gratuits\npour tester nos produits",
              paragraphBgGradientColorStart: const Color(0xFF8200D8),
              paragraphBgGradientColorEnd: ColorManager.purple,
              badgeText: 'TESTER',
              badgeBgColor: ColorManager.purple,
            ),
            const SizedBox(height: AppSize.s10),
            EspaceProfessionnel(
              src: 'assets/images/magasin_cosmetique.jpg',
              headerText: 'MAGASIN\nCOSMETIQUE',
              paragraphText:
                  "Vous disposez d'un point de vente en cosmétique, et vous souhaitez commercialisez nos offres",
              paragraphBgGradientColorStart: const Color(0xFF000D60),
              paragraphBgGradientColorEnd: ColorManager.blue,
              badgeText: 'COMMANDER',
              badgeBgColor: ColorManager.blue,
            ),
            const SectionHeader(sectionTitle: 'DEVENIR DISTRIBUTEUR'),
            const DevenirDistributeur(),
          ],
        ),
      ),
    );
  }
}
