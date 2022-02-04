import 'package:cartanawc_app/core/dependency_injection.dart';
import 'package:cartanawc_app/core/prefs/app_prefs.dart';
import 'package:cartanawc_app/domain/entities/customer_detail_entity.dart';
import 'package:cartanawc_app/presentation/account/customer_profile_viewmodel.dart';
import 'package:cartanawc_app/presentation/common/state_render/sate_render_impl.dart';
import 'package:cartanawc_app/presentation/common/text_form_field_widget.dart';
import 'package:cartanawc_app/presentation/ressources/appsize_manager.dart';
import 'package:cartanawc_app/presentation/common/appbar/appbar_widget.dart';
import 'package:cartanawc_app/presentation/common/drawer/drawer_widget.dart';
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
    _customerProfileViewModel.start();
  }

  @override
  void initState() {
    _bind();
    super.initState();
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
                        Form(
                          key: _globalKey,
                          child: Column(
                            children: <Widget>[
                              // TextFormField Nom
                              MyTextFormFieldWidget(
                                textEditingController: _nomController,
                                initialValue: snapshot.data.firstName,
                                textInputType: TextInputType.text,
                                hintText: 'Nom de famille',
                                labelText: 'Nom',
                                errorText: (snapshot.data.firstName == null)
                                    ? null
                                    : 'Nom de famille ne peut pas être vide',
                              ),

                              const SizedBox(height: AppSize.s10),

                              // TextFormField Prénom
                              MyTextFormFieldWidget(
                                textEditingController: _prenomController,
                                textInputType: TextInputType.text,
                                hintText: 'Prénom',
                                labelText: 'Préom',
                                errorText: (snapshot.data.lastName == null)
                                    ? null
                                    : 'Prénom ne peut pas être vide',
                              ),

                              const SizedBox(height: AppSize.s10),

                              // TextFormField type
                              MyTextFormFieldWidget(
                                textEditingController: _typeController,
                                textInputType: TextInputType.text,
                                hintText: 'Type de compte',
                                labelText: 'Type',
                                errorText: (snapshot.data.role == null)
                                    ? null
                                    : 'Type ne peut pas être vide',
                              ),

                              const SizedBox(height: AppSize.s10),

                              // TextFormField Email
                              MyTextFormFieldWidget(
                                textEditingController: _emailController,
                                textInputType: TextInputType.emailAddress,
                                hintText: 'email@example.com',
                                labelText: 'Email',
                                errorText: (snapshot.data.email == null)
                                    ? null
                                    : 'Email ne peut pas être vide',
                              ),

                              const SizedBox(height: AppSize.s10),

                              // TextFormField Téléphone
                              MyTextFormFieldWidget(
                                textEditingController: _telephoneController,
                                textInputType: TextInputType.phone,
                                hintText: '0550 xx xx xx',
                                labelText: 'Téléphone',
                                errorText: (snapshot.data.billing.phone == null)
                                    ? null
                                    : 'Téléphone ne peut pas être vide',
                              ),

                              const SizedBox(height: AppSize.s10),

                              // TextFormField Adresse
                              MyTextFormFieldWidget(
                                textEditingController: _adresseController,
                                textInputType: TextInputType.streetAddress,
                                hintText: 'num, rue Nom de la rue',
                                labelText: 'Adresse',
                                errorText:
                                    (snapshot.data.billing.address1 == null)
                                        ? null
                                        : 'Adresse ne peut pas être vide',
                              ),

                              const SizedBox(height: AppSize.s10),

                              // TextFormField Complement d'adresse
                              MyTextFormFieldWidget(
                                textEditingController:
                                    _complementAdresseController,
                                textInputType: TextInputType.streetAddress,
                                hintText: "Complement d'adresse",
                                labelText: "Complement d'adresse",
                              ),

                              const SizedBox(height: AppSize.s10),

                              // TextFormField Wilaya
                              MyTextFormFieldWidget(
                                textEditingController: _wilayaController,
                                textInputType: TextInputType.text,
                                hintText: 'Alger',
                                labelText: 'Wilaya',
                                errorText: (snapshot.data.billing.city == null)
                                    ? null
                                    : 'Wilaya ne peut pas être vide',
                              ),

                              const SizedBox(height: AppSize.s10),

                              // TextFormField CodePostal
                              MyTextFormFieldWidget(
                                textEditingController: _codePostalController,
                                textInputType: TextInputType.number,
                                hintText: '16000',
                                labelText: 'Code Postal',
                                errorText:
                                    (snapshot.data.billing.postcode == null)
                                        ? null
                                        : 'Code postal ne peut pas être vide',
                              ),

                              const SizedBox(height: AppSize.s10),
                            ],
                          ),
                        ),

                        const SizedBox(height: AppSize.s15),

                        const Text('Informations non correct?'),

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
        });
  }
}

/*
FutureBuilder(
                future: fetchCustomerDetails,
                builder:
                    (context, AsyncSnapshot<CustomerDetailModel> snapshot) {
                  if (snapshot.hasData) {
                    final List<Map<String, String>> _customerDetailsFields = [
                      {'Nom': snapshot.data.firstName},
                      {'Prénom': snapshot.data.lastName},
                      {'Type': snapshot.data.role},
                      {'E-mail': snapshot.data.email},
                      {'Téléphone': snapshot.data.billing.phone},
                      {'Adresse': snapshot.data.billing.address1},
                      {"Complement d'adresse": snapshot.data.billing.address2},
                      {'Wilaya': snapshot.data.billing.city},
                      {'Code postal': snapshot.data.billing.postcode},
                    ];
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        CircleAvatar(
                          radius: AppSize.s75,
                          child: Image.network(snapshot.data.avatarUrl),
                        ),
                        const SizedBox(height: AppSize.s20),
                        SizedBox(
                          height: 900.0,
                          child: ListView.builder(
                            physics: const NeverScrollableScrollPhysics(),
                            itemCount: _customerDetailsFields.length,
                            itemBuilder: (context, index) {
                              return Column(
                                children: [
                                  Align(
                                    alignment: Alignment.centerLeft,
                                    child: FormHelper.fieldLabel(
                                        _customerDetailsFields[index]
                                            .keys
                                            .first,
                                        labelColor: ColorManager.grey),
                                  ),
                                  FormHelper.fieldLabelValue(
                                      context,
                                      _customerDetailsFields[index]
                                          .values
                                          .first),
                                ],
                              );
                            },
                          ),
                        ),
                        const SizedBox(
                          height: AppSize.s15,
                        ),
                        const Text(
                          'informations non corrects ?',
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(height: AppSize.s10),
                        textButton(
                          onPressed: () {},
                          text: 'MODIFIER',
                          textColor: Colors.white,
                          backgroundColor: Colors.black,
                        ),
                        const SizedBox(height: AppSize.s10),
                        textButton(
                          onPressed: () {
                            SharedService.logout();
                            Navigator.pop(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const HomePage(),
                              ),
                            );
                          },
                          text: 'Se déconnecter',
                        ),
                      ],
                    );
                  }
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                },
              )
 */
