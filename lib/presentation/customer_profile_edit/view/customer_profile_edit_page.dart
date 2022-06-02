import 'package:cartanawc_app/core/dependency_injection.dart';
import 'package:cartanawc_app/presentation/common/appbar/custom_appbar_widget.dart';
import 'package:cartanawc_app/presentation/common/drawer/drawer_for_authenticated_user_widget.dart';
import 'package:cartanawc_app/presentation/common/my_text_form_field_widget.dart';
import 'package:cartanawc_app/presentation/common/section_header_widget.dart';
import 'package:cartanawc_app/presentation/common/state_render/sate_render_impl.dart';
import 'package:cartanawc_app/presentation/common/textbuttom_widget.dart';
import 'package:cartanawc_app/presentation/ressources/appsize_manager.dart';
import 'package:flutter/material.dart';

import '/domain/entities/entities.dart';
import 'customer_profile_edit_viewmodel.dart';

class CustomerProfileEditPage extends StatefulWidget {
  const CustomerProfileEditPage({Key key}) : super(key: key);

  static const String routeName = '/customerProfileEdit';

  static Route route() {
    return MaterialPageRoute(
      settings: const RouteSettings(name: routeName),
      builder: (context) => const CustomerProfileEditPage(),
    );
  }

  @override
  _CustomerProfileEditState createState() => _CustomerProfileEditState();
}

class _CustomerProfileEditState extends State<CustomerProfileEditPage> {
  final CustomerProfileEditViewModel _customerProfileEditViewModel =
      instance<CustomerProfileEditViewModel>();
  final GlobalKey<FormState> _globalKey = GlobalKey<FormState>();

  final TextEditingController _nomController = TextEditingController();
  final TextEditingController _prenomController = TextEditingController();
  final TextEditingController _typeController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _telephoneController = TextEditingController();
  final TextEditingController _adresseController = TextEditingController();
  final TextEditingController _complementAdresseController =
      TextEditingController();
  final TextEditingController _wilayaController = TextEditingController();
  final TextEditingController _codePostalController = TextEditingController();

  void _bind() {
    _customerProfileEditViewModel.start();
  }

  @override
  void initState() {
    super.initState();
    _bind();
  }

  @override
  void dispose() {
    _nomController.dispose();
    _prenomController.dispose();
    _typeController.dispose();
    _emailController.dispose();
    _telephoneController.dispose();
    _adresseController.dispose();
    _complementAdresseController.dispose();
    _wilayaController.dispose();
    _codePostalController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //appBar: buildAppBar(context, isUserProfilePage: true),
      appBar: const CustomAppBar(isUserProfilePage: true),
      drawer: DrawerForAuthenticatedUser(),
      body: StreamBuilder<FlowState>(
          stream: _customerProfileEditViewModel.outputState,
          builder: (context, snapshot) {
            return snapshot.data
                    .getScreenWidget(context, _customerProfileEdit(), () {
                  _customerProfileEditViewModel.start();
                }) ??
                Container();
          }),
    );
  }

  Widget _customerProfileEdit() {
    return StreamBuilder<CustomerDetailEntity>(
        stream: null,
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
                          child: Image.network(snapshot.data.avatarUrl),
                        ),

                        const SizedBox(height: AppSize.s20),
                        Form(
                          key: _globalKey,
                          child: Column(
                            children: <Widget>[
                              // TextFormField Nom
                              MyTextFormFieldWidget(
                                controller: _nomController,
                                hintText: 'Nom de famille',
                                labelText: 'Nom',
                                errorText: (false)
                                    ? null
                                    : 'Nom de famille ne peut pas être vide',
                              ),

                              const SizedBox(height: AppSize.s10),

                              // TextFormField Prénom
                              MyTextFormFieldWidget(
                                controller: _prenomController,
                                hintText: 'Prénom',
                                labelText: 'Préom',
                                errorText: (false)
                                    ? null
                                    : 'Prénom ne peut pas être vide',
                              ),

                              const SizedBox(height: AppSize.s10),

                              // TextFormField type
                              MyTextFormFieldWidget(
                                controller: _typeController,
                                hintText: 'Type de compte',
                                labelText: 'Type',
                                errorText: (false)
                                    ? null
                                    : 'Type ne peut pas être vide',
                              ),

                              const SizedBox(height: AppSize.s10),

                              // TextFormField Email
                              MyTextFormFieldWidget(
                                controller: _emailController,
                                keyboardType: TextInputType.emailAddress,
                                hintText: 'email@example.com',
                                labelText: 'Email',
                                errorText: (false)
                                    ? null
                                    : 'Email ne peut pas être vide',
                              ),

                              const SizedBox(height: AppSize.s10),

                              // TextFormField Téléphone
                              MyTextFormFieldWidget(
                                controller: _telephoneController,
                                keyboardType: TextInputType.phone,
                                hintText: '0550 xx xx xx',
                                labelText: 'Téléphone',
                                errorText: (false)
                                    ? null
                                    : 'Téléphone ne peut pas être vide',
                              ),

                              const SizedBox(height: AppSize.s10),

                              // TextFormField Adresse
                              MyTextFormFieldWidget(
                                controller: _adresseController,
                                keyboardType: TextInputType.streetAddress,
                                hintText: 'num, rue Nom de la rue',
                                labelText: 'Adresse',
                                errorText: (false)
                                    ? null
                                    : 'Adresse ne peut pas être vide',
                              ),

                              const SizedBox(height: AppSize.s10),

                              // TextFormField Complement d'adresse
                              MyTextFormFieldWidget(
                                controller: _complementAdresseController,
                                keyboardType: TextInputType.streetAddress,
                                hintText: "Complement d'adresse",
                                labelText: "Complement d'adresse",
                              ),

                              const SizedBox(height: AppSize.s10),

                              // TextFormField Wilaya
                              MyTextFormFieldWidget(
                                controller: _wilayaController,
                                hintText: 'Alger',
                                labelText: 'Wilaya',
                                errorText: (false)
                                    ? null
                                    : 'Wilaya ne peut pas être vide',
                              ),

                              const SizedBox(height: AppSize.s10),

                              // TextFormField CodePostal
                              MyTextFormFieldWidget(
                                controller: _codePostalController,
                                keyboardType: TextInputType.number,
                                hintText: '16000',
                                labelText: 'Code Postal',
                                errorText: (false)
                                    ? null
                                    : 'Code postal ne peut pas être vide',
                              ),

                              const SizedBox(height: AppSize.s10),
                            ],
                          ),
                        ),

                        const SizedBox(height: AppSize.s15),

                        StreamBuilder<bool>(
                            stream: _customerProfileEditViewModel
                                .outputIsAllInputsValid,
                            builder: (context, snapshot) {
                              return textButton(
                                onPressed: (snapshot.data ?? false)
                                    ? () {
                                        _customerProfileEditViewModel
                                            .updateCustomerProfile();
                                      }
                                    : null,
                                text: 'METTRE A JOUR',
                                textColor: Colors.white,
                                backgroundColor: Colors.black,
                              );
                            }),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        });
  }
}
