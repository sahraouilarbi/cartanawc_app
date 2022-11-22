import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

import '/core/dependency_injection.dart';
import '/presentation/accueil/accueil.dart';
import '/presentation/common/appbar/custom_appbar_widget.dart';
import '/presentation/common/drawer/drawer_for_anonymous_widget.dart';
import '/presentation/common/my_text_buttom_widget.dart';
import '/presentation/common/my_text_form_field_widget.dart';
import '/presentation/common/section_header_widget.dart';
import '/presentation/common/state_render/state_render_impl.dart';
import '/presentation/devenir_distributeur/view/devenir_distributeur_viewmodel.dart';
import '/presentation/ressources/appsize_manager.dart';

class DevenirDistributeurPage extends StatefulWidget {
  const DevenirDistributeurPage({Key? key}) : super(key: key);

  static const String routeName = '/devenirDistributeur';
  static Route route() {
    return MaterialPageRoute(
      settings: const RouteSettings(name: routeName),
      builder: (context) => const DevenirDistributeurPage(),
    );
  }

  @override
  State<DevenirDistributeurPage> createState() =>
      _DevenirDistributeurPageState();
}

class _DevenirDistributeurPageState extends State<DevenirDistributeurPage> {
  final DevenirDistributeurViewModel _viewModel =
      instance<DevenirDistributeurViewModel>();
  final GlobalKey<FormState> _globalKey = GlobalKey<FormState>();
  final TextEditingController _yourNameController = TextEditingController();
  final TextEditingController _yourEmailController = TextEditingController();
  final TextEditingController _yourPhoneController = TextEditingController();
  final TextEditingController _yourAddressController = TextEditingController();
  final TextEditingController _yourCityController = TextEditingController();
  final TextEditingController _yourPostcodeController = TextEditingController();
  final TextEditingController _yourSubjectController = TextEditingController();
  final TextEditingController _yourRegionController = TextEditingController();
  final TextEditingController _yourMessageController = TextEditingController();

  void _bind() {
    _viewModel.start();
    _yourNameController.addListener(
      () {
        _viewModel.setYourName(_yourNameController.text);
      },
    );
    _yourEmailController.addListener(
      () {
        _viewModel.setYourEmail(_yourEmailController.text);
      },
    );
    _yourPhoneController.addListener(
      () {
        _viewModel.setYourPhone(_yourPhoneController.text);
      },
    );
    _yourAddressController.addListener(
      () {
        _viewModel.setYourAddress(_yourAddressController.text);
      },
    );
    _yourCityController.addListener(
      () {
        _viewModel.setYourCity(_yourCityController.text);
      },
    );
    _yourPostcodeController.addListener(
      () {
        _viewModel.setYourPostcode(_yourPostcodeController.text);
      },
    );
    _yourSubjectController.addListener(
      () {
        _viewModel.setYourSubject(_yourSubjectController.text);
      },
    );
    _yourMessageController.addListener(
      () {
        _viewModel.setYourMessage(_yourMessageController.text);
      },
    );
    _viewModel
        .isDevenirDistributeurSendMessageSuccessfullyStreamController.stream
        .listen(
      (data) {
        SchedulerBinding.instance!.addPostFrameCallback(
          (_) {
            Navigator.pushNamed(context, AccueilPage.routeName);
          },
        );
      },
    );
  }

  @override
  void initState() {
    super.initState();
    _bind();
  }

  @override
  void dispose() {
    _yourNameController.dispose();
    _yourEmailController.dispose();
    _yourPhoneController.dispose();
    _yourAddressController.dispose();
    _yourCityController.dispose();
    _yourPostcodeController.dispose();
    _yourSubjectController.dispose();
    _yourRegionController.dispose();
    _yourMessageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(),
      drawer: const DrawerForAnonymous(),
      backgroundColor: Colors.black,
      body: StreamBuilder<FlowState>(
          stream: _viewModel.outputState,
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
                _getContentWidget(),
                () {},
              );
            }
            return const SizedBox();
          }),
    );
  }

  Widget _getContentWidget() {
    return SingleChildScrollView(
      physics: const ScrollPhysics(),
      child: Padding(
        padding: const EdgeInsets.only(
          left: AppPadding.p10,
          right: AppPadding.p10,
          bottom: AppPadding.p10,
        ),
        child: Column(
          children: <Widget>[
            const SectionHeader(sectionTitle: 'DEVENIR DISTRIBUTEUR'),
            Image.asset(
              'assets/images/devenir_distributeur_bg.jpg',
              fit: BoxFit.cover,
            ),
            Container(
              padding: const EdgeInsets.only(
                left: AppPadding.p20,
                top: AppPadding.p20,
                right: AppPadding.p20,
                bottom: AppPadding.p50,
              ),
              color: Colors.white,
              child: Column(
                children: <Widget>[
                  const Text(
                      'Vous souhaitez rejoindre notre réseaux de distribution, alors renseignez le formulaire ci-dessous et nous vous contacterons dans les 24 à 48h.'),
                  const SizedBox(height: AppSize.s30),
                  Form(
                    key: _globalKey,
                    child: Column(
                      children: <Widget>[
                        // YourName field
                        StreamBuilder<bool>(
                          stream: _viewModel.outputIsYourNameValid,
                          builder: (context, snapshot) {
                            return MyTextFormFieldWidget(
                              controller: _yourNameController,
                              keyboardType: TextInputType.name,
                              hintText: 'Nom et prénom',
                              labelText: 'Nom et prénom',
                              errorText: snapshot.data ?? true
                                  ? null
                                  : "Saisissez votre nom et prénom",
                            );
                          },
                        ),
                        const SizedBox(height: AppSize.s20),

                        // YourEmail field
                        StreamBuilder<bool>(
                          stream: _viewModel.outputIsYourEmailValid,
                          builder: (context, snapshot) {
                            return MyTextFormFieldWidget(
                              controller: _yourEmailController,
                              keyboardType: TextInputType.emailAddress,
                              hintText: 'email@exemple.com',
                              labelText: 'Email',
                              errorText: snapshot.data ?? true
                                  ? null
                                  : "Saisissez votre email",
                            );
                          },
                        ),
                        const SizedBox(height: AppSize.s20),

                        // YourPhone field
                        StreamBuilder<bool>(
                          stream: _viewModel.outputIsYourPhoneValid,
                          builder: (context, snapshot) {
                            return MyTextFormFieldWidget(
                              controller: _yourPhoneController,
                              keyboardType: TextInputType.phone,
                              hintText: '0661 00 00 00',
                              labelText: 'Téléphone',
                              errorText: snapshot.data ?? true
                                  ? null
                                  : "Saisissez votre numéro téléphone",
                            );
                          },
                        ),
                        const SizedBox(height: AppSize.s20),

                        // YourAddress field
                        StreamBuilder<bool>(
                          stream: _viewModel.outputIsYourAddressValid,
                          builder: (context, snapshot) {
                            return MyTextFormFieldWidget(
                              controller: _yourAddressController,
                              keyboardType: TextInputType.streetAddress,
                              hintText: 'num, rue Nom de la rue',
                              labelText: 'Adresse',
                              errorText: snapshot.data ?? true
                                  ? null
                                  : "Saisissez votre adresse",
                            );
                          },
                        ),
                        const SizedBox(height: AppSize.s20),

                        // YourCity field
                        StreamBuilder<bool>(
                          stream: _viewModel.outputIsYourCityValid,
                          builder: (context, snapshot) {
                            return MyTextFormFieldWidget(
                              controller: _yourCityController,
                              hintText: 'Alger',
                              labelText: 'Wilaya',
                              errorText: snapshot.data ?? true
                                  ? null
                                  : "Saisissez votre wilaya",
                            );
                          },
                        ),
                        const SizedBox(height: AppSize.s20),

                        // YourPostcode field
                        StreamBuilder<bool>(
                          stream: _viewModel.outputIsYourPostcodeValid,
                          builder: (context, snapshot) {
                            return MyTextFormFieldWidget(
                              controller: _yourPostcodeController,
                              keyboardType: TextInputType.number,
                              hintText: '16000',
                              labelText: 'Code Postal',
                              errorText: snapshot.data ?? true
                                  ? null
                                  : "Saisissez votre code postal",
                            );
                          },
                        ),
                        const SizedBox(height: AppSize.s20),

                        // YourSubject field
                        StreamBuilder<bool>(
                          stream: _viewModel.outputIsYourSubjectValid,
                          builder: (context, snapshot) {
                            return MyTextFormFieldWidget(
                              controller: _yourSubjectController,
                              hintText: 'Sujet',
                              labelText: 'Sujet',
                              errorText: snapshot.data ?? true
                                  ? null
                                  : "Saisissez le sujet",
                            );
                          },
                        ),
                        const SizedBox(height: AppSize.s20),

                        // YourMessage field
                        StreamBuilder<bool>(
                          stream: _viewModel.outputIsYourMessageValid,
                          builder: (context, snapshot) {
                            return MyTextFormFieldWidget(
                              controller: _yourMessageController,
                              maxLines: 5,
                              hintText: 'Message',
                              labelText: 'Message',
                              errorText: snapshot.data ?? true
                                  ? null
                                  : "Saisissez votre message",
                            );
                          },
                        ),
                        const SizedBox(height: AppSize.s20),

                        StreamBuilder<bool>(
                          stream: _viewModel.outputIsAllInputsValid,
                          builder: (context, snapshot) {
                            return SizedBox(
                              width: MediaQuery.of(context).size.width / 2,
                              child: MyTextButtonWidget(
                                onPressed: snapshot.data ?? false
                                    ? () {
                                        _viewModel.devenirDistributeur();
                                      }
                                    : null,
                                textButton: 'ENVOYER',
                              ),
                            );
                          },
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
