import 'package:flutter/material.dart';

import '/presentation/common/appbar/custom_appbar_widget.dart';
import '/presentation/common/my_text_buttom_widget.dart';
import '/presentation/common/my_text_form_field_widget.dart';
import '/presentation/common/section_header_widget.dart';
import '/presentation/ressources/appsize_manager.dart';

class ForgotPasswordPage extends StatefulWidget {
  const ForgotPasswordPage({Key? key}) : super(key: key);
  static const String routeName = '/forgotPassword';
  static Route route() {
    return MaterialPageRoute(
      settings: const RouteSettings(name: routeName),
      builder: (context) => const ForgotPasswordPage(),
    );
  }

  @override
  State<ForgotPasswordPage> createState() => _ForgotPasswordPageState();
}

class _ForgotPasswordPageState extends State<ForgotPasswordPage> {
  final TextEditingController _emailController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(),
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        physics: const ScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.only(
            left: AppPadding.p10,
            right: AppPadding.p10,
            bottom: AppPadding.p10,
          ),
          child: Column(
            children: <Widget>[
              const SectionHeader(sectionTitle: 'MON ESPACE'),
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: AppPadding.p20,
                  vertical: AppPadding.p50,
                ),
                color: Colors.white,
                child: Column(
                  children: <Widget>[
                    const Icon(Icons.vpn_key, size: AppSize.s120),
                    const SizedBox(height: AppSize.s10),
                    const Text(
                      "Mot de Passe perdu",
                      style: TextStyle(
                        fontSize: 22.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: AppSize.s10),
                    const Text(
                        "Mot de passe perdu ? Veuillez saisir votre votre adresse e-mail. Vous recevrez un code de 04 chiffres par e-mail."),
                    const SizedBox(height: AppSize.s10),
                    MyTextFormFieldWidget(
                      controller: _emailController,
                      keyboardType: TextInputType.emailAddress,
                      labelText: 'Email',
                      hintText: 'email@exemple.com',
                    ),
                    const SizedBox(height: AppSize.s10),
                    SizedBox(
                      width: MediaQuery.of(context).size.width / 2,
                      child: MyTextButtonWidget(
                        onPressed: () {},
                        textButton: 'ENVOYER',
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
