import 'package:cartanawc_app/core/dependency_injection.dart';
import 'package:cartanawc_app/domain/entities/customer_detail_entity.dart';
import 'package:cartanawc_app/presentation/account/customer_profile_edit_viewmodel.dart';
import 'package:cartanawc_app/presentation/common/state_render/sate_render_impl.dart';
import 'package:cartanawc_app/presentation/common/text_form_field_widget.dart';
import 'package:cartanawc_app/presentation/ressources/appsize_manager.dart';
import 'package:cartanawc_app/presentation/common/appbar/appbar_widget.dart';
import 'package:cartanawc_app/presentation/common/drawer/drawer_widget.dart';
import 'package:cartanawc_app/presentation/common/page_header_stack_widget.dart';
import 'package:cartanawc_app/presentation/common/textbuttom_widget.dart';
import 'package:flutter/material.dart';

class CustomerProfileEditView extends StatefulWidget {
  const CustomerProfileEditView({Key key}) : super(key: key);

  @override
  _CustomerProfileEditState createState() => _CustomerProfileEditState();
}

class _CustomerProfileEditState extends State<CustomerProfileEditView> {
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
    _bind();
    super.initState();
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
      appBar: buildAppBar(context, isUserProfilePage: true),
      drawer: buildDrawer(context),
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
                                textInputType: TextInputType.text,
                                hintText: 'Nom de famille',
                                labelText: 'Nom',
                                errorText: (false)
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
                                errorText: (false)
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
                                errorText: (false)
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
                                errorText: (false)
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
                                errorText: (false)
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
                                errorText: (false)
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
                                errorText: (false)
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
