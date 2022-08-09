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
import '/presentation/ressources/appsize_manager.dart';
import 'customer_profile_viewmodel.dart';

class CustomerProfilePage extends StatefulWidget {
  const CustomerProfilePage({Key key}) : super(key: key);

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
      //appBar: buildAppBar(context, isUserProfilePage: true),
      appBar: const CustomAppBar(isUserProfilePage: true),
      drawer: DrawerForAuthenticatedUser(),
      body: StreamBuilder<FlowState>(
          stream: _customerProfileViewModel.outputState,
          builder: (context, snapshot) {
            return snapshot.data.getScreenWidget(context, _customerProfile(),
                    () {
                  _customerProfileViewModel.start();
                }) ??
                Container();
          }),
    );
  }

  Widget _customerProfile() {
    return StreamBuilder<CustomerDetailEntity>(
      stream: _customerProfileViewModel.outputCustomerProfileData,
      builder: (context, snapshot) {
        return SingleChildScrollView(
          physics: const ScrollPhysics(),
          child: Container(
            color: Colors.black,
            padding: const EdgeInsets.all(AppPadding.p10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const SectionHeader(sectionTitle: 'PROFIL'),
                Container(
                  padding: const EdgeInsets.symmetric(
                      horizontal: AppPadding.p20, vertical: AppPadding.p40),
                  color: Colors.white,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      // Customer Image profil
                      CircleAvatar(
                        radius: AppSize.s75,
                        child: Image.network(
                          snapshot.data.avatarUrl,
                          fit: BoxFit.cover,
                        ),
                      ),

                      const SizedBox(height: AppSize.s20),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          //Nom
                          TextCustomerProfileViewWidget(
                            labelText: 'Nom',
                            insideFieldText:
                                '${snapshot.data.firstName} ${snapshot.data.lastName}',
                          ),
                          const SizedBox(height: AppSize.s10),

                          // Type
                          TextCustomerProfileViewWidget(
                            labelText: 'Type',
                            insideFieldText: snapshot.data.role,
                          ),
                          const SizedBox(height: AppSize.s10),

                          // Tél
                          TextCustomerProfileViewWidget(
                            labelText: 'Tél',
                            insideFieldText: snapshot.data.billing.phone,
                          ),
                          const SizedBox(height: AppSize.s10),

                          // Email
                          TextCustomerProfileViewWidget(
                            labelText: 'Email',
                            insideFieldText: snapshot.data.email,
                          ),
                          const SizedBox(height: AppSize.s10),

                          // Adresse
                          TextCustomerProfileViewWidget(
                            labelText: 'Adresse',
                            insideFieldText:
                                "${snapshot.data.billing.address1}, ${snapshot.data.billing.city}",
                          ),

                          const SizedBox(height: AppSize.s10),
                        ],
                      ),

                      const SizedBox(height: AppSize.s15),

                      const Text(
                        'Informations non correct?',
                        textAlign: TextAlign.center,
                      ),

                      const SizedBox(height: AppSize.s10),

                      /**
                      textButton(
                        onPressed: () {
                          Navigator.pushReplacementNamed(
                              context, Routes.editProfileRoute);
                        },
                        text: 'MODIFIER',
                        textColor: Colors.white,
                        backgroundColor: Colors.black,
                      ),**/

                      //MyTextButtonWidget(
                      textButton(
                        onPressed: () {
                          Navigator.pushNamed(context, '/customerProfileEdit');
                        },
                        text: 'MODIFIER',
                      ),

                      const SizedBox(height: AppSize.s10),

                      MyTextButtonWidget(
                          onPressed: () {
                            _appPreferences.logout();
                            Navigator.pushNamed(context, '/');
                          },
                          textButton: 'Se déconnecter'),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
