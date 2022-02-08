import 'package:cartanawc_app/core/dependency_injection.dart';
import 'package:cartanawc_app/core/prefs/app_prefs.dart';
import 'package:cartanawc_app/domain/entities/customer_detail_entity.dart';
import 'package:cartanawc_app/presentation/account/customer_profile_viewmodel.dart';
import 'package:cartanawc_app/presentation/common/state_render/sate_render_impl.dart';
import 'package:cartanawc_app/presentation/common/text_customer_profile_view_widget.dart';
import 'package:cartanawc_app/presentation/ressources/appsize_manager.dart';
import 'package:cartanawc_app/presentation/common/appbar/appbar_widget.dart';
import 'package:cartanawc_app/presentation/common/drawer/drawer_anonymous_tile/drawer_anonymous_widget.dart';
import 'package:cartanawc_app/presentation/common/page_header_stack_widget.dart';
import 'package:cartanawc_app/presentation/common/textbuttom_widget.dart';
import 'package:cartanawc_app/presentation/ressources/routes_manager.dart';
import 'package:flutter/material.dart';

class CustomerProfileView extends StatefulWidget {
  const CustomerProfileView({Key key}) : super(key: key);

  @override
  _CustomerProfileState createState() => _CustomerProfileState();
}

class _CustomerProfileState extends State<CustomerProfileView> {
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
      appBar: buildAppBar(context, isUserProfilePage: true),
      drawer: buildDrawer(context),
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
                pageHeaderStack(pageHeader: 'PROFIL'),
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
                        child: Image.network(snapshot.data.avatarUrl),
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

                      textButton(
                        onPressed: () {
                          Navigator.pushReplacementNamed(
                              context, Routes.editProfileRoute);
                        },
                        text: 'MODIFIER',
                        textColor: Colors.white,
                        backgroundColor: Colors.black,
                      ),

                      const SizedBox(height: AppSize.s10),

                      textButton(
                          onPressed: () {
                            _appPreferences.logout();
                            Navigator.pushReplacementNamed(
                                context, Routes.loginRoute);
                          },
                          text: 'Se déconnecter'),
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
