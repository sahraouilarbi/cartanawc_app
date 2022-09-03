import 'package:flutter/material.dart';

import '/core/dependency_injection.dart';
import '/domain/entities/entities.dart';
import '/presentation/common/appbar/custom_appbar_widget.dart';
import '/presentation/common/drawer/drawer_for_authenticated_user_widget.dart';
import '/presentation/common/my_text_form_field_widget.dart';
import '/presentation/common/section_header_widget.dart';
import '/presentation/common/state_render/sate_render_impl.dart';
import '/presentation/common/textbuttom_widget.dart';
import '/presentation/ressources/appsize_manager.dart';
import 'customer_profile_edit_viewmodel.dart';

class CustomerProfileEditPage extends StatefulWidget {
  const CustomerProfileEditPage({Key? key, required this.customerProfileEdit})
      : super(key: key);

  final CustomerDetailEntity customerProfileEdit;

  static const String routeName = '/customerProfileEdit';

  static Route route({required CustomerDetailEntity customerProfileEdit}) {
    return MaterialPageRoute(
      settings: const RouteSettings(name: routeName),
      builder: (context) =>
          CustomerProfileEditPage(customerProfileEdit: customerProfileEdit),
    );
  }

  @override
  _CustomerProfileEditState createState() => _CustomerProfileEditState();
}

class _CustomerProfileEditState extends State<CustomerProfileEditPage> {
  final CustomerProfileEditViewModel _customerProfileEditViewModel =
      instance<CustomerProfileEditViewModel>();
  final GlobalKey<FormState> _globalKey = GlobalKey<FormState>();

  final TextEditingController _firstNameShippingController =
      TextEditingController();
  final TextEditingController _lastNameShippingController =
      TextEditingController();
  final TextEditingController _companyShippingController =
      TextEditingController();
  final TextEditingController _address1ShippingController =
      TextEditingController();
  final TextEditingController _address2ShippingController =
      TextEditingController();
  final TextEditingController _cityShippingController = TextEditingController();
  final TextEditingController _postCodeShippingController =
      TextEditingController();
  final TextEditingController _countryShippingController =
      TextEditingController();
  final TextEditingController _stateShippingController =
      TextEditingController();
  final TextEditingController _phoneShippingController =
      TextEditingController();

  void _bind() {
    _customerProfileEditViewModel.start();
  }

  @override
  void initState() {
    super.initState();
    _customerProfileEditViewModel.customerProfileEdit =
        widget.customerProfileEdit;
    _firstNameShippingController.text =
        widget.customerProfileEdit.shipping!.firstName;
    _lastNameShippingController.text =
        widget.customerProfileEdit.shipping!.lastName;
    _companyShippingController.text =
        widget.customerProfileEdit.shipping!.company;
    _address1ShippingController.text =
        widget.customerProfileEdit.shipping!.address1;
    _address2ShippingController.text =
        widget.customerProfileEdit.shipping!.address2;
    _cityShippingController.text = widget.customerProfileEdit.shipping!.city;
    _postCodeShippingController.text =
        widget.customerProfileEdit.shipping!.postcode;
    _countryShippingController.text =
        widget.customerProfileEdit.shipping!.country;
    _stateShippingController.text = widget.customerProfileEdit.shipping!.state;
    _phoneShippingController.text = widget.customerProfileEdit.shipping!.phone;

    _bind();
  }

  @override
  void dispose() {
    _firstNameShippingController.dispose();
    _lastNameShippingController.dispose();
    _companyShippingController.dispose();
    _address1ShippingController.dispose();
    _address2ShippingController.dispose();
    _cityShippingController.dispose();
    _postCodeShippingController.dispose();
    _countryShippingController.dispose();
    _stateShippingController.dispose();
    _phoneShippingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(),
      drawer: DrawerForAuthenticatedUser(),
      body: StreamBuilder<FlowState>(
          stream: _customerProfileEditViewModel.outputState,
          builder: (context, snapshot) {
            return snapshot.data!.getScreenWidget(
              context,
              _customerProfileEdit(),
              () {
                _customerProfileEditViewModel.start();
              },
            );
          }),
    );
  }

  Widget _customerProfileEdit() {
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
            const SectionHeader(sectionTitle: 'PROFIL: MODIFICATION'),
            Container(
              padding: const EdgeInsets.symmetric(
                  horizontal: AppPadding.p20, vertical: AppPadding.p40),
              color: Colors.white,
              child: Column(
                children: [
                  const Text('Adresse de livraison du client'),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      // Customer Image profil
                      // CircleAvatar(
                      //   radius: AppSize.s75,
                      //   child: Image.network(snapshot.data!.avatarUrl!),
                      // ),
                      //
                      // const SizedBox(height: AppSize.s20),
                      Form(
                        key: _globalKey,
                        child: Column(
                          children: <Widget>[
                            // TextFormField Nom
                            StreamBuilder<bool>(
                              stream: _customerProfileEditViewModel
                                  .outputIsFirstNameShippingValid,
                              builder: (context, snapshot) {
                                return MyTextFormFieldWidget(
                                  controller: _firstNameShippingController,
                                  hintText: 'Nom de famille',
                                  labelText: 'Nom',
                                  errorText: snapshot.data ?? true
                                      ? null
                                      : 'Nom de famille ne peut pas être vide',
                                );
                              },
                            ),

                            const SizedBox(height: AppSize.s10),

                            // TextFormField Prénom
                            StreamBuilder<bool>(
                              stream: _customerProfileEditViewModel
                                  .outputIsLastNameShippingValid,
                              builder: (context, snapshot) {
                                return MyTextFormFieldWidget(
                                  controller: _lastNameShippingController,
                                  hintText: 'Prénom',
                                  labelText: 'Prénom',
                                  errorText: snapshot.data ?? true
                                      ? null
                                      : 'Prénom ne peut pas être vide',
                                );
                              },
                            ),

                            const SizedBox(height: AppSize.s10),

                            // TextFormField Company
                            StreamBuilder<bool>(
                              stream: _customerProfileEditViewModel
                                  .outputIsCompanyShippingValid,
                              builder: (context, snapshot) {
                                return MyTextFormFieldWidget(
                                  controller: _companyShippingController,
                                  hintText: 'Type de compte',
                                  labelText: 'Type',
                                  errorText: snapshot.data ?? true
                                      ? null
                                      : 'Type ne peut pas être vide',
                                );
                              },
                            ),

                            const SizedBox(height: AppSize.s10),

                            // TextFormField Adresse
                            StreamBuilder<bool>(
                              stream: _customerProfileEditViewModel
                                  .outputIsAddress1ShippingValid,
                              builder: (context, snapshot) {
                                return MyTextFormFieldWidget(
                                  controller: _address1ShippingController,
                                  keyboardType: TextInputType.streetAddress,
                                  hintText: 'num, rue Nom de la rue',
                                  labelText: 'Adresse',
                                  errorText: snapshot.data ?? true
                                      ? null
                                      : 'Email ne peut pas être vide',
                                );
                              },
                            ),

                            const SizedBox(height: AppSize.s10),

                            // TextFormField Complement adresse
                            StreamBuilder<bool>(
                              stream: _customerProfileEditViewModel
                                  .outputIsAddress2ShippingValid,
                              builder: (context, snapshot) {
                                return MyTextFormFieldWidget(
                                  controller: _address2ShippingController,
                                  keyboardType: TextInputType.streetAddress,
                                  hintText: 'complement adresse',
                                  labelText: 'Complement adresse',
                                  errorText: snapshot.data ?? true
                                      ? null
                                      : 'Téléphone ne peut pas être vide',
                                );
                              },
                            ),

                            const SizedBox(height: AppSize.s10),

                            // TextFormField City
                            StreamBuilder<bool>(
                              stream: _customerProfileEditViewModel
                                  .outputIsCityShippingValid,
                              builder: (context, snapshot) {
                                return MyTextFormFieldWidget(
                                  controller: _cityShippingController,
                                  keyboardType: TextInputType.streetAddress,
                                  hintText: 'Alger',
                                  labelText: 'City',
                                  errorText: snapshot.data ?? true
                                      ? null
                                      : 'Adresse ne peut pas être vide',
                                );
                              },
                            ),

                            const SizedBox(height: AppSize.s10),

                            // TextFormField Complement d'adresse
                            StreamBuilder<bool>(
                              stream: _customerProfileEditViewModel
                                  .outputIsPostCodeShippingValid,
                              builder: (context, snapshot) {
                                return MyTextFormFieldWidget(
                                  controller: _postCodeShippingController,
                                  keyboardType: TextInputType.number,
                                  hintText: "16000",
                                  labelText: "Code postal",
                                  errorText: snapshot.data ?? true
                                      ? null
                                      : 'Code postal ne peut pas être vide',
                                );
                              },
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: AppSize.s15),
                  StreamBuilder<bool>(
                    stream:
                        _customerProfileEditViewModel.outputIsAllInputsValid,
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
                    },
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
