import 'package:cartanawc_app/services/api_service.dart';
import 'package:cartanawc_app/models/customer_detail_model.dart';
import 'package:cartanawc_app/pages/home_page.dart';
import 'package:cartanawc_app/pages/login_page.dart';
import 'package:cartanawc_app/provider/customer_provider.dart';
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
    Map<String, String> customerDetailsFields = {};
    return FutureBuilder(
      future: fetchCustomerDetails,
      builder: (context, AsyncSnapshot<CustomerDetailModel> snapshot) {
        if (snapshot.hasData) {
          return Scaffold(
            drawer: buildDrawer(context),
            appBar: buildAppBar(context, isUserProfilePage: true),
            body: SingleChildScrollView(
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
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          CircleAvatar(
                            radius: 75.0,
                            child: Image.network(snapshot.data.avatarUrl),
                          ),
                          const SizedBox(height: 20.0),
                          Align(
                            alignment: Alignment.centerLeft,
                            child: FormHelper.fieldLabel('Nom',
                                labelColor: ThemeConfig.cartanaColorGrey),
                          ),
                          FormHelper.fieldLabelValue(
                              context, snapshot.data.firstName),
                          Align(
                            alignment: Alignment.centerLeft,
                            child: FormHelper.fieldLabel('Prénom',
                                labelColor: ThemeConfig.cartanaColorGrey),
                          ),
                          FormHelper.fieldLabelValue(
                              context, snapshot.data.lastName),
                          Align(
                            alignment: Alignment.centerLeft,
                            child: FormHelper.fieldLabel('Type',
                                labelColor: ThemeConfig.cartanaColorGrey),
                          ),
                          FormHelper.fieldLabelValue(
                              context, snapshot.data.role),
                          Align(
                            alignment: Alignment.centerLeft,
                            child: FormHelper.fieldLabel('E-mail',
                                labelColor: ThemeConfig.cartanaColorGrey),
                          ),
                          FormHelper.fieldLabelValue(
                              context, snapshot.data.email),
                          Align(
                            alignment: Alignment.centerLeft,
                            child: FormHelper.fieldLabel('Téléphone',
                                labelColor: ThemeConfig.cartanaColorGrey),
                          ),
                          FormHelper.fieldLabelValue(
                              context, snapshot.data.billing.phone),
                          Align(
                            alignment: Alignment.centerLeft,
                            child: FormHelper.fieldLabel('Adresse',
                                labelColor: ThemeConfig.cartanaColorGrey),
                          ),
                          FormHelper.fieldLabelValue(
                              context, snapshot.data.billing.address1),
                          Align(
                            alignment: Alignment.centerLeft,
                            child: FormHelper.fieldLabel("Complement d'adresse",
                                labelColor: ThemeConfig.cartanaColorGrey),
                          ),
                          FormHelper.fieldLabelValue(
                              context, snapshot.data.billing.address2),
                          Align(
                            alignment: Alignment.centerLeft,
                            child: FormHelper.fieldLabel('Wilaya',
                                labelColor: ThemeConfig.cartanaColorGrey),
                          ),
                          FormHelper.fieldLabelValue(
                              context, snapshot.data.billing.city),
                          Align(
                            alignment: Alignment.centerLeft,
                            child: FormHelper.fieldLabel('Code postal',
                                labelColor: ThemeConfig.cartanaColorGrey),
                          ),
                          FormHelper.fieldLabelValue(
                              context, snapshot.data.billing.postcode),
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
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        }
        return const Center(
          child: CircularProgressIndicator(),
        );
      },
    );
  }
}
