import 'package:flutter/material.dart';

import '/core/dependency_injection.dart';
import '/core/prefs/app_prefs.dart';
import '/domain/entities/entities.dart';
import '/presentation/common/appbar/custom_appbar_widget.dart';
import '/presentation/common/drawer/drawer_for_authenticated_user_widget.dart';
import '/presentation/common/my_text_form_field_widget.dart';
import '/presentation/common/section_header_widget.dart';
import '/presentation/common/state_render/sate_render_impl.dart';
import '/presentation/common/textbuttom_widget.dart';
import '/presentation/ressources/appsize_manager.dart';
import 'customer_profile_edit_copy_viewmodel.dart';

class CustomerProfileEditCopyPage extends StatefulWidget {
  const CustomerProfileEditCopyPage({
    Key? key,
//    required this.customerProfileEdit,
  }) : super(key: key);

//  final CustomerDetailEntity customerProfileEdit;

  static const String routeName = '/customerProfileEditCopy';

  static Route route({required CustomerDetailEntity customerProfileEdit}) {
    return MaterialPageRoute(
      settings: const RouteSettings(name: routeName),
      builder: (context) =>
//          CustomerProfileEditCopyPage(customerProfileEdit: customerProfileEdit),
          const CustomerProfileEditCopyPage(),
    );
  }

  @override
  _CustomerProfileEditCopyState createState() =>
      _CustomerProfileEditCopyState();
}

class _CustomerProfileEditCopyState extends State<CustomerProfileEditCopyPage> {
  final CustomerProfileEditCopyViewModel _customerProfileEditCopyViewModel =
      instance<CustomerProfileEditCopyViewModel>();
  final AppPreferences _appPreferences = instance<AppPreferences>();
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

  Future<void> _bind() async {
    await _customerProfileEditCopyViewModel.start();

    _firstNameShippingController.addListener(
      () => _customerProfileEditCopyViewModel.setFirstNameShipping(
        _firstNameShippingController.text,
      ),
    );
    _lastNameShippingController.addListener(
      () => _customerProfileEditCopyViewModel.setLastNameShipping(
        _lastNameShippingController.text,
      ),
    );
    _companyShippingController.addListener(
      () => _customerProfileEditCopyViewModel.setCompanyShipping(
        _companyShippingController.text,
      ),
    );
    _address1ShippingController.addListener(
      () => _customerProfileEditCopyViewModel.setAddress1Shipping(
        _address1ShippingController.text,
      ),
    );
    _address2ShippingController.addListener(
      () => _customerProfileEditCopyViewModel.setAddress2Shipping(
        _address2ShippingController.text,
      ),
    );
    _cityShippingController.addListener(
      () => _customerProfileEditCopyViewModel.setCityShipping(
        _cityShippingController.text,
      ),
    );
    _postCodeShippingController.addListener(
      () => _customerProfileEditCopyViewModel.setPostcodeShipping(
        _postCodeShippingController.text,
      ),
    );
    _countryShippingController.addListener(
      () => _customerProfileEditCopyViewModel.setCountryShipping(
        _countryShippingController.text,
      ),
    );
    _stateShippingController.addListener(
      () => _customerProfileEditCopyViewModel.setStateShipping(
        _stateShippingController.text,
      ),
    );
    _phoneShippingController.addListener(
      () => _customerProfileEditCopyViewModel.setPhoneShipping(
        _phoneShippingController.text,
      ),
    );

    // _customerProfileEditCopyViewModel
    //     .isUserProfileSavedSuccessfullyStreamController.stream
    //     .listen(() {});
  }

  @override
  void initState() {
    super.initState();
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
        stream: _customerProfileEditCopyViewModel.outputState,
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
              _customerProfileEdit(),
              () {
                _customerProfileEditCopyViewModel.start();
              },
            );
          }
          return const Center(
            child: Text('rien a affiché'),
          );
        },
      ),
    );
  }

  Widget _customerProfileEdit() {
    // Initialize firstNameShippingController
    _firstNameShippingController.text =
        _customerProfileEditCopyViewModel.firstNameShipping;

    // Initialize lastNameShippingController
    _lastNameShippingController.text =
        _customerProfileEditCopyViewModel.lastNameShipping;

    // Initialize address2ShippingController
    _companyShippingController.text =
        _customerProfileEditCopyViewModel.companyShipping;

    // Initialize address1ShippingController
    _address1ShippingController.text =
        _customerProfileEditCopyViewModel.address1Shipping;

    // Initialize address2ShippingController
    _address2ShippingController.text =
        _customerProfileEditCopyViewModel.address2Shipping;

    // Initialize cityShippingController
    _cityShippingController.text =
        _customerProfileEditCopyViewModel.cityShipping;

    // Initialize postcodeShippingController
    _postCodeShippingController.text =
        _customerProfileEditCopyViewModel.postcodeShipping;

    // Initialize countryShippingController
    _countryShippingController.text =
        _customerProfileEditCopyViewModel.countryShipping;

    // Initialize stateShippingController
    _stateShippingController.text =
        _customerProfileEditCopyViewModel.stateShipping;

    // Initialize phoneShippingController
    _phoneShippingController.text =
        _customerProfileEditCopyViewModel.phoneShipping;

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
                  const Text(
                    'Adresse de livraison',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: AppSize.s20),
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
                            // TextFormField Prénom
                            StreamBuilder<bool>(
                              stream: _customerProfileEditCopyViewModel
                                  .outputIsFirstNameShippingValid,
                              builder: (context, snapshot) {
                                return MyTextFormFieldWidget(
                                  controller: _firstNameShippingController,
                                  hintText: 'Prénom',
                                  labelText: 'Prénom',
                                  errorText: snapshot.data ?? true
                                      ? null
                                      : 'Prénom ne peut pas être vide',
                                );
                              },
                            ),

                            const SizedBox(height: AppSize.s10),
                            // TextFormField Nom
                            StreamBuilder<bool>(
                              stream: _customerProfileEditCopyViewModel
                                  .outputIsLastNameShippingValid,
                              builder: (context, snapshot) {
                                return MyTextFormFieldWidget(
                                  controller: _lastNameShippingController,
                                  hintText: 'Nom de famille',
                                  labelText: 'Nom',
                                  errorText: snapshot.data ?? true
                                      ? null
                                      : 'Nom de famille ne peut pas être vide',
                                );
                              },
                            ),

                            const SizedBox(height: AppSize.s10),

                            // TextFormField Company
                            StreamBuilder<bool>(
                              stream: _customerProfileEditCopyViewModel
                                  .outputIsCompanyShippingValid,
                              builder: (context, snapshot) {
                                return MyTextFormFieldWidget(
                                  controller: _companyShippingController,
                                  hintText: 'Entreprise',
                                  labelText: 'Entreprise',
                                  errorText: snapshot.data ?? true
                                      ? null
                                      : 'Entreprise ne peut pas être vide',
                                );
                              },
                            ),

                            const SizedBox(height: AppSize.s10),

                            // TextFormField Adresse1
                            StreamBuilder<bool>(
                              stream: _customerProfileEditCopyViewModel
                                  .outputIsAddress1ShippingValid,
                              builder: (context, snapshot) {
                                return MyTextFormFieldWidget(
                                  controller: _address1ShippingController,
                                  keyboardType: TextInputType.streetAddress,
                                  hintText: 'num, rue Nom de la rue',
                                  labelText: 'Adresse',
                                  errorText: snapshot.data ?? true
                                      ? null
                                      : 'Adresse ne peut pas être vide',
                                );
                              },
                            ),

                            const SizedBox(height: AppSize.s10),

                            // TextFormField Adresse2
                            StreamBuilder<bool>(
                              stream: _customerProfileEditCopyViewModel
                                  .outputIsAddress2ShippingValid,
                              builder: (context, snapshot) {
                                return MyTextFormFieldWidget(
                                  controller: _address2ShippingController,
                                  keyboardType: TextInputType.streetAddress,
                                  hintText: "complement d'adresse",
                                  labelText: "Complement d'adresse",
                                  // errorText: snapshot.data ?? true
                                  //     ? null
                                  //     : 'Adresse ne peut pas être vide',
                                );
                              },
                            ),

                            const SizedBox(height: AppSize.s10),

                            // TextFormField City
                            StreamBuilder<bool>(
                              stream: _customerProfileEditCopyViewModel
                                  .outputIsCityShippingValid,
                              builder: (context, snapshot) {
                                return MyTextFormFieldWidget(
                                  controller: _cityShippingController,
                                  keyboardType: TextInputType.streetAddress,
                                  hintText: 'Alger',
                                  labelText: 'Commune',
                                  errorText: snapshot.data ?? true
                                      ? null
                                      : 'Ville ne peut pas être vide',
                                );
                              },
                            ),

                            const SizedBox(height: AppSize.s10),

                            // TextFormField Code Postal
                            StreamBuilder<bool>(
                              stream: _customerProfileEditCopyViewModel
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

                            const SizedBox(height: AppSize.s10),

                            // TextFormField State
                            StreamBuilder<bool>(
                              stream: _customerProfileEditCopyViewModel
                                  .outputIsStateShippingValid,
                              builder: (context, snapshot) {
                                return MyTextFormFieldWidget(
                                  controller: _stateShippingController,
                                  hintText: 'Alger',
                                  labelText: 'Wilaya',
                                  errorText: snapshot.data ?? true
                                      ? null
                                      : 'Wilaya ne peut pas être vide',
                                );
                              },
                            ),

                            const SizedBox(height: AppSize.s10),

                            // TextFormField Phone
                            StreamBuilder<bool>(
                              stream: _customerProfileEditCopyViewModel
                                  .outputIsPhoneShippingValid,
                              builder: (context, snapshot) {
                                return MyTextFormFieldWidget(
                                  controller: _phoneShippingController,
                                  keyboardType: TextInputType.phone,
                                  hintText: '021 ## ## ##',
                                  labelText: 'Téléphone',
                                  errorText: snapshot.data ?? true
                                      ? null
                                      : 'Téléphone ne peut pas être vide',
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
                    stream: _customerProfileEditCopyViewModel
                        .outputIsAllInputsValid,
                    builder: (context, snapshot) {
                      return textButton(
                        onPressed: (snapshot.data ?? false)
                            ? () {
                                _customerProfileEditCopyViewModel
                                    .updateShippingInformations();
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
