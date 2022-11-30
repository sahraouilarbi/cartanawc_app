import 'package:cartanawc_app/core/dependency_injection.dart';
import 'package:cartanawc_app/presentation/common/appbar/custom_appbar_widget.dart';
import 'package:cartanawc_app/presentation/common/drawer/drawer_for_anonymous_widget.dart';
import 'package:cartanawc_app/presentation/common/my_text_buttom_widget.dart';
import 'package:cartanawc_app/presentation/common/my_text_form_field_widget.dart';
import 'package:cartanawc_app/presentation/common/section_header_widget.dart';
import 'package:cartanawc_app/presentation/common/state_render/state_render_impl.dart';
import 'package:cartanawc_app/presentation/contact/view/contact_viewmodel.dart';
import 'package:cartanawc_app/presentation/pages.dart';
import 'package:cartanawc_app/presentation/ressources/appsize_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

enum ClientType { consomateur, distributeur, client }

class ContactPage extends StatefulWidget {
  const ContactPage({Key? key}) : super(key: key);

  static const String routeName = '/contactPage';
  static Route route() {
    return MaterialPageRoute(
      settings: const RouteSettings(name: routeName),
      builder: (context) => const ContactPage(),
    );
  }

  @override
  State<ContactPage> createState() => _ContactPageState();
}

class _ContactPageState extends State<ContactPage> {
  final ContactViewModel _viewModel = instance<ContactViewModel>();
  final GlobalKey _globalKey = GlobalKey<FormState>();
  final TextEditingController _yourNameController = TextEditingController();
  final TextEditingController _yourEmailController = TextEditingController();
  final TextEditingController _yourTelephoneController =
      TextEditingController();
  final TextEditingController _yourSujetController = TextEditingController();
  final TextEditingController _yourMessageController = TextEditingController();

  ClientType? _clientType = ClientType.consomateur;

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
    _yourTelephoneController.addListener(
      () {
        _viewModel.setYourTelephone(_yourTelephoneController.text);
      },
    );
    _yourSujetController.addListener(
      () {
        _viewModel.setYourSujet(_yourSujetController.text);
      },
    );
    _yourMessageController.addListener(
      () {
        _viewModel.setYourMessage(_yourMessageController.text);
      },
    );
    _viewModel.isContactSendMessageSuccessfullyStreamController.stream.listen(
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
    _yourTelephoneController.dispose();
    _yourSujetController.dispose();
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
              _getScreenWidget(),
              () {},
            );
          }
          return const SizedBox();
        },
      ),
    );
  }

  Widget _getScreenWidget() {
    return SingleChildScrollView(
      physics: const ScrollPhysics(),
      padding: const EdgeInsets.only(
        left: AppPadding.p10,
        right: AppPadding.p10,
        bottom: AppPadding.p10,
      ),
      child: Column(
        children: <Widget>[
          const SectionHeader(sectionTitle: 'CONTACT'),
          ClipRect(
            child: Align(
              heightFactor: 0.5,
              child: Image.asset(
                'assets/images/salon_coiffure_institut_beaute_bg.jpg',
                fit: BoxFit.cover,
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.all(AppPadding.p20),
            color: Colors.white,
            child: Column(
              children: <Widget>[
                const Text(
                  'Pour nous écrire, veuillez renseignez le formulaire ci-dessous et nous vous contacterons dans les 24 à 48h.',
                ),
                const SizedBox(
                  height: AppSize.s30,
                ),
                Form(
                  key: _globalKey,
                  child: Column(
                    children: <Widget>[
                      // Your Name
                      StreamBuilder<bool>(
                        builder: (context, snapshot) {
                          return MyTextFormFieldWidget(
                            controller: _yourNameController,
                            keyboardType: TextInputType.name,
                            hintText: 'Nom et Prénom',
                            labelText: 'Nom et Prénom',
                            errorText: snapshot.data ?? true
                                ? null
                                : 'Nom et prénom ne peut pas être vide',
                          );
                        },
                      ),

                      const SizedBox(height: AppSize.s20),

                      // Your Email
                      StreamBuilder<bool>(
                        builder: (context, snapshot) {
                          return MyTextFormFieldWidget(
                            controller: _yourEmailController,
                            keyboardType: TextInputType.emailAddress,
                            hintText: 'email@exemple.com',
                            labelText: 'Email',
                            errorText: snapshot.data ?? true
                                ? null
                                : 'Saisissez une adresse mail valide',
                          );
                        },
                      ),

                      const SizedBox(height: AppSize.s20),

                      // Your Telephone
                      StreamBuilder<bool>(
                        builder: (context, snapshot) {
                          return MyTextFormFieldWidget(
                            controller: _yourTelephoneController,
                            keyboardType: TextInputType.phone,
                            hintText: '0661 00 00 00',
                            labelText: 'Téléphone',
                            errorText: snapshot.data ?? true
                                ? null
                                : 'Téléphone ne peut pas être vide',
                          );
                        },
                      ),

                      const SizedBox(height: AppSize.s20),

                      // Client Type
                      const Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          'Vous êtes ?',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      RadioListTile<ClientType>(
                        title: const Text('Consomateur'),
                        value: ClientType.consomateur,
                        groupValue: _clientType,
                        onChanged: (ClientType? value) {
                          setState(
                            () {
                              _clientType = value;
                            },
                          );
                        },
                      ),
                      RadioListTile<ClientType>(
                        title: const Text('Distributeur'),
                        value: ClientType.distributeur,
                        groupValue: _clientType,
                        onChanged: (ClientType? value) {
                          setState(
                            () {
                              _clientType = value;
                            },
                          );
                        },
                      ),
                      RadioListTile<ClientType>(
                        title: const Text('Client'),
                        value: ClientType.client,
                        groupValue: _clientType,
                        onChanged: (ClientType? value) {
                          setState(
                            () {
                              _clientType = value;
                            },
                          );
                        },
                      ),

                      const SizedBox(height: AppSize.s20),

                      // Your Sujet
                      StreamBuilder<bool>(
                        builder: (context, snapshot) {
                          return MyTextFormFieldWidget(
                            controller: _yourSujetController,
                            hintText: 'sujet',
                            labelText: 'Sujet',
                            errorText: snapshot.data ?? true
                                ? null
                                : 'Sujet ne peut pas être vide',
                          );
                        },
                      ),

                      const SizedBox(height: AppSize.s20),

                      // Your Message
                      StreamBuilder<bool>(
                        builder: (context, snapshot) {
                          return MyTextFormFieldWidget(
                            controller: _yourMessageController,
                            maxLines: 5,
                            hintText: 'message',
                            labelText: 'Message',
                            errorText: snapshot.data ?? true
                                ? null
                                : 'Message ne peut pas être vide',
                          );
                        },
                      ),

                      const SizedBox(height: AppSize.s20),

                      // Bouton envoyer
                      StreamBuilder<bool>(
                        stream: _viewModel.outputIsAllInputsValid,
                        builder: (context, snapshot) {
                          return SizedBox(
                            width: MediaQuery.of(context).size.width / 2,
                            child: MyTextButtonWidget(
                              onPressed: snapshot.data ?? false
                                  ? () {
                                      _viewModel.vousEtes = _clientType
                                          .toString()
                                          .split('.')
                                          .last;
                                      _viewModel.contact();
                                    }
                                  : null,
                              textButton: 'ENVOYER',
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
