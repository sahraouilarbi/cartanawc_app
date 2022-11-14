import 'package:flutter/material.dart';

import '/core/dependency_injection.dart';
import '/core/prefs/app_prefs.dart';
import '/domain/entities/entities.dart';
import '/presentation/common/appbar/custom_appbar_widget.dart';
import '/presentation/common/drawer/drawer_for_authenticated_user_widget.dart';
import '/presentation/common/my_text_buttom_widget.dart';
import '/presentation/common/section_header_widget.dart';
import '/presentation/common/state_render/sate_render_impl.dart';
import '/presentation/common/text_customer_profile_view_widget.dart';
import '/presentation/common/textbuttom_widget.dart';
import '/presentation/pages.dart';
import '/presentation/ressources/appsize_manager.dart';
import 'customer_profile_viewmodel.dart';

class CustomerProfilePage extends StatefulWidget {
  const CustomerProfilePage({Key? key}) : super(key: key);

  static const String routeName = '/customerProfile';

  static Route route() {
    return MaterialPageRoute(
      settings: const RouteSettings(name: routeName),
      builder: (context) => const CustomerProfilePage(),
    );
  }

  @override
  _CustomerProfileState createState() => _CustomerProfileState();
}

class _CustomerProfileState extends State<CustomerProfilePage> {
  final CustomerProfileViewModel _customerProfileViewModel =
      instance<CustomerProfileViewModel>();
  final AppPreferences _appPreferences = instance<AppPreferences>();

  void _bind() {
    _customerProfileViewModel.start();
  }

  @override
  void initState() {
    super.initState();
    _bind();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(),
      drawer: DrawerForAuthenticatedUser(),
      body: StreamBuilder<FlowState>(
        stream: _customerProfileViewModel.outputState,
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Center(
              child: Text(
                snapshot.error.toString(),
              ),
            );
          }
          if (snapshot.hasData) {
            return snapshot.data!.getScreenWidget(
              context,
              _customerProfile(),
              () {
                _customerProfileViewModel.start();
              },
            );
          }
          return const SizedBox();
        },
      ),
    );
  }

  Widget _customerProfile() {
    return SingleChildScrollView(
      physics: const ScrollPhysics(),
      child: Container(
        color: Colors.black,
        padding: const EdgeInsets.only(
          left: AppPadding.p10,
          right: AppPadding.p10,
          bottom: AppPadding.p10,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const SectionHeader(sectionTitle: 'PROFIL'),
            Container(
              padding: const EdgeInsets.symmetric(
                  horizontal: AppPadding.p20, vertical: AppPadding.p40),
              color: Colors.white,
              child: Column(
                children: [
                  StreamBuilder<CustomerDetailEntity>(
                    stream: _customerProfileViewModel.outputCustomerProfileData,
                    builder: (context, snapshot) {
                      switch (snapshot.connectionState) {
                        case ConnectionState.none:
                          return const Center(
                            child: Text('Aucune donnée a affichée'),
                          );
                        case ConnectionState.waiting:
                          return const Center(
                            child: CircularProgressIndicator(),
                          );
                        case ConnectionState.active:
                        case ConnectionState.done:
                          return Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              // Customer Image profil
                              CircleAvatar(
                                radius: AppSize.s75,
                                child: Image.network(
                                  snapshot.data!.avatarUrl!,
                                  fit: BoxFit.cover,
                                ),
                              ),

                              const SizedBox(height: AppSize.s20),

                              // Nom
                              TextCustomerProfileViewWidget(
                                labelText: 'Nom',
                                insideFieldText:
                                    '${snapshot.data!.firstName} ${snapshot.data!.lastName}',
                              ),

                              const SizedBox(height: AppSize.s10),

                              // Type
                              TextCustomerProfileViewWidget(
                                labelText: 'Type',
                                insideFieldText: snapshot.data!.role!,
                              ),

                              const SizedBox(height: AppSize.s10),

                              // Télphone 01
                              TextCustomerProfileViewWidget(
                                labelText: 'Télphone 01',
                                insideFieldText: snapshot.data!.billing!.phone,
                              ),

                              const SizedBox(height: AppSize.s10),

                              // Téléphone 02
                              TextCustomerProfileViewWidget(
                                labelText: 'Télphone 02',
                                insideFieldText: snapshot.data!.shipping!.phone,
                              ),
                              const SizedBox(height: AppSize.s10),

                              // Email
                              TextCustomerProfileViewWidget(
                                labelText: 'Email',
                                insideFieldText: snapshot.data!.email!,
                              ),

                              const SizedBox(height: AppSize.s10),

                              // Adresse
                              TextCustomerProfileViewWidget(
                                labelText: 'Adresse de facturation',
                                insideFieldText:
                                    "${snapshot.data!.billing!.address1}, ${snapshot.data!.billing!.city}",
                              ),

                              const SizedBox(height: AppSize.s10),

                              // Adresse
                              TextCustomerProfileViewWidget(
                                labelText: 'Adresse de livraison',
                                insideFieldText:
                                    "${snapshot.data!.shipping!.address1}, ${snapshot.data!.shipping!.city}",
                              ),

                              const SizedBox(height: AppSize.s25),

                              const Text(
                                'Informations non correct?',
                                textAlign: TextAlign.center,
                              ),
                              const SizedBox(height: AppSize.s10),

                              //MyTextButtonWidget(
                              textButton(
                                onPressed: () {
                                  Navigator.pushNamed(context,
                                      CustomerProfileEditCopyPage.routeName,
                                      arguments: snapshot.data);
                                },
                                text: 'MODIFIER',
                              ),
                            ],
                          );
                      }
                    },
                  ),
                  const SizedBox(height: AppSize.s10),
                  MyTextButtonWidget(
                    onPressed: () {
                      _appPreferences.logout();
                      Navigator.pushNamed(context, AccueilPage.routeName);
                    },
                    textButton: 'Se déconnecter',
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
