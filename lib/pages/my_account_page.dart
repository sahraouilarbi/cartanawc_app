import 'package:cartanawc_app/provider/auth_provider.dart';
import 'package:cartanawc_app/services/api_service.dart';
import 'package:cartanawc_app/models/customer_detail_model.dart';
import 'package:cartanawc_app/pages/home_page.dart';
import 'package:cartanawc_app/pages/login_page.dart';
import 'package:cartanawc_app/services/shared_service.dart';
import 'package:cartanawc_app/utils/form_helper.dart';
import 'package:cartanawc_app/utils/theme_config.dart';
import 'package:cartanawc_app/widgets/appbar_widget.dart';
import 'package:cartanawc_app/widgets/drawer_widget.dart';
import 'package:cartanawc_app/widgets/page_header_stack_widget.dart';
import 'package:cartanawc_app/widgets/textbuttom_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MyAccountPage extends StatefulWidget {
  const MyAccountPage({Key key}) : super(key: key);

  @override
  _MyAccountPageState createState() => _MyAccountPageState();
}

class _MyAccountPageState extends State<MyAccountPage> {
  APIService apiService;
  Future<CustomerDetailModel> fetchCustomerDetails;
  AuthProvider authProvider;

  @override
  void initState() {
    super.initState();
    apiService = APIService();
    authProvider = Provider.of<AuthProvider>(context, listen: false);
    fetchCustomerDetails = apiService.customerDetails();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: SharedService.isLoggedIn(),
        builder: (context, AsyncSnapshot<bool> loginModel) {
          if (loginModel.hasData) {
            if (loginModel.data) {
              return _customerDetailsView(context);
            } else {
              return LoginPage();
            }
          }
          return const Center(
            child: CircularProgressIndicator(),
          );
        });
  }

  Widget _customerDetailsView(BuildContext context) {
    return Scaffold(
      drawer: buildDrawer(context),
      appBar: buildAppBar(context, isUserProfilePage: true),
      body: SingleChildScrollView(
        physics: const ScrollPhysics(),
        child: Container(
          color: Colors.black,
          padding: const EdgeInsets.all(10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              pageHeaderStack(pageHeader: 'PROFIL'),
              Container(
                padding: const EdgeInsets.symmetric(
                    horizontal: 20.0, vertical: 40.0),
                color: Colors.white,
                child: FutureBuilder(
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
                        {
                          "Complement d'adresse": snapshot.data.billing.address2
                        },
                        {'Wilaya': snapshot.data.billing.city},
                        {'Code postal': snapshot.data.billing.postcode},
                      ];
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          CircleAvatar(
                            radius: 75.0,
                            child: Image.network(snapshot.data.avatarUrl),
                          ),
                          const SizedBox(height: 20.0),
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
                                          labelColor:
                                              ThemeConfig.cartanaColorGrey),
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
                            height: 15.0,
                          ),
                          const Text(
                            'informations non corrects ?',
                            textAlign: TextAlign.center,
                          ),
                          const SizedBox(height: 10.0),
                          textButton(
                            onPressed: () {},
                            text: 'MODIFIER',
                            textColor: Colors.white,
                            backgroundColor: Colors.black,
                          ),
                          const SizedBox(height: 10.0),
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
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
