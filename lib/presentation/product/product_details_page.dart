import 'package:cartanawc_app/core/dependency_injection.dart';
import 'package:cartanawc_app/core/prefs/app_prefs.dart';
import 'package:cartanawc_app/data/models/cart_request_model.dart';
import 'package:cartanawc_app/data/models/product_model.dart';
import 'package:cartanawc_app/model_views/providers/auth_provider.dart';
import 'package:cartanawc_app/model_views/providers/cart_provider.dart';
import 'package:cartanawc_app/model_views/providers/loader_provider.dart';
import 'package:cartanawc_app/presentation/common/my_text_buttom_widget.dart';
import 'package:cartanawc_app/presentation/ressources/appsize_manager.dart';
import 'package:cartanawc_app/presentation/common/expanded_text.dart';
import 'package:cartanawc_app/presentation/ressources/color_manager.dart';
import 'package:cartanawc_app/presentation/ressources/size_config.dart';
import 'package:cartanawc_app/presentation/common/appbar/appbar_widget.dart';
import 'package:cartanawc_app/presentation/common/image_network_loading_progress.dart';
import 'package:cartanawc_app/presentation/common/no_image_placeholder.dart';
import 'package:cartanawc_app/presentation/common/row_montant.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProductDetails extends StatefulWidget {
  ProductDetails({Key key, this.data}) : super(key: key);
  final ProductModel data;

  final CartProductsModel cartProducts = CartProductsModel();

  @override
  _ProductDetailsState createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
  final AppPreferences _appPreferences = instance<AppPreferences>();
  bool isUserLoggedIn;

  int qty = 0;
  double productPrice;
  double montant = 0;
  int productStep, productMinQty, productMaxQty;
  AuthProvider authProvider;
  bool inProgress = false;

  void calculMontant() {
    montant = double.parse(widget.data.price) * qty * productStep;
  }

  final myController = TextEditingController();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    authProvider = Provider.of<AuthProvider>(context, listen: false);

    // Récuperer le prix
    widget.data.price != null && widget.data.price != ''
        ? productPrice = double.parse(widget.data.price)
        : productPrice = 0;

    // Récuperer la valeur step du produit des metadata
    productStep = int.parse(widget.data.productMetaData
        .where((element) => element.key == '_wcmmq_s_product_step')
        .first
        .value);

    // Récuperer la valeur minStep du produit des metadata
    productMinQty = int.parse(widget.data.productMetaData
        .where((element) => element.key == '_wcmmq_s_min_quantity')
        .first
        .value);

    // Récuperer la valeur MaxStep du produit des metadata
    productMaxQty = int.parse(widget.data.productMetaData
        .where((element) => element.key == '_wcmmq_s_max_quantity')
        .first
        .value);

    // Afficher une quantité 0 dans le textField Qty
    myController.text = qty.toString();
  }

  @override
  void dispose() {
    myController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context),
      body: SingleChildScrollView(
        child: Container(
          color: const Color(0xFFF3F3F3),
          padding: const EdgeInsets.all(AppPadding.p20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Container(
                color: Colors.white,
                padding: const EdgeInsets.all(AppPadding.p20),
                child: Text(
                  widget.data.name,
                  style: const TextStyle(
                    fontSize: 16.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const Divider(
                height: AppSize.s2,
                color: Colors.black,
              ),
              Container(
                color: Colors.white,
                child: Column(
                  children: [
                    if (widget.data.images[0].woocommerceSingle != null)
                      SizedBox(
                        height: getProportionateScreenHeight(AppSize.s335),
                        child: Image.network(
                          widget.data.images[0].woocommerceSingle,
                          fit: BoxFit.cover,
                          loadingBuilder: imageNetworkLoadingProgress,
                        ),
                      )
                    else
                      noImagePlaceHolder(),
                    Visibility(
                      visible: widget.data.description != '',
                      child: ExpandedText(
                        labelHeader: 'Détails du produit',
                        description: widget.data.description ?? '',
                        shortDescription: widget.data.shortDescription ?? '',
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: AppSize.s10),

              // Prix
              Visibility(
                //visible: widget.data.price != '',
                //visible: authProvider.loggedInStatus == Status.loggedIn,
                // TODO isUserLoggedIn
                // visible: isUserLoggedIn,
                child: Container(
                  color: Colors.white,
                  child: Row(
                    children: [
                      Container(
                        width: AppSize.s50,
                        height: AppSize.s50,
                        color: Colors.black,
                        child: Image.asset(
                          'assets/images/icon_bottle.png',
                          fit: BoxFit.cover,
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.only(left: AppMargin.m20),
                        child: Text(
                            '${widget.data.price.replaceAll('.', ',')} DA / U'),
                      ),
                    ],
                  ),
                ),
              ),

              const SizedBox(height: AppSize.s10),

              //*** Packaging
              Container(
                color: Colors.white,
                child: Row(
                  children: [
                    Container(
                      width: AppSize.s50,
                      height: AppSize.s50,
                      color: Colors.black,
                      child: Image.asset(
                        'assets/images/icon_packaging.png',
                        fit: BoxFit.cover,
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(left: AppMargin.m20),
                      child: Text('$productStep x pièces / carton'),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: AppSize.s10),
              Visibility(
                //visible: authProvider.loggedInStatus == Status.loggedIn,
                child: Column(
                  children: [
                    //*** Stepper
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          'Cartons à\ncommander :',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        buildStepper(
                            price: productPrice,
                            min: productMinQty,
                            max: productMaxQty,
                            step: productStep),
                      ],
                    ),

                    const SizedBox(height: AppSize.s10),

                    //*** Montant
                    rowMontant(
                        textLabel: 'MONTANT',
                        valeurMontant: montant,
                        fontSize: 18.0),

                    const SizedBox(height: AppSize.s10),

                    MyTextButtonWidget(
                      onPressed: () {
                        if (qty > 0) {
                          setState(() {
                            inProgress = !inProgress;
                          });

                          Provider.of<LoaderProvider>(context, listen: false)
                              .setLoadingStatus(status: true);
                          final cartProvider =
                              Provider.of<CartProvider>(context, listen: false);
                          widget.cartProducts.productId = widget.data.id;
                          widget.cartProducts.variationId =
                              widget.data.variableProduct != null
                                  ? widget.data.variableProduct.id
                                  : 0;
                          //TODO
                          cartProvider.addToCart(
                            widget.cartProducts,
                            (val) {
                              setState(() {
                                inProgress = !inProgress;
                              });
                              final snackBar = SnackBar(
                                content:
                                    const Text('Produit ajoutés au panier'),
                                backgroundColor: ColorManager.greenAccent,
                              );
                              ScaffoldMessenger.of(context)
                                  .showSnackBar(snackBar);
                              Provider.of<LoaderProvider>(context,
                                      listen: false)
                                  .setLoadingStatus(status: false);
                            },
                          );
                        }
                      },
                      backgroundColor: ColorManager.blue,
                      textButton: 'AJOUTER AU PANIER',
                      hasIcon: true,
                      svgIconSrc: 'assets/images/shopping_cart.svg',
                      inProgress: inProgress,
                    ),
/**
                    TextButton(
                      onPressed: () {
                        if (qty > 0) {
                          setState(() {
                            inProgress = !inProgress;
                          });

                          Provider.of<LoaderProvider>(context, listen: false)
                              .setLoadingStatus(status: true);
                          final cartProvider =
                              Provider.of<CartProvider>(context, listen: false);
                          widget.cartProducts.productId = widget.data.id;
                          widget.cartProducts.variationId =
                              widget.data.variableProduct != null
                                  ? widget.data.variableProduct.id
                                  : 0;
                          //TODO
                          cartProvider.addToCart(
                            widget.cartProducts,
                            (val) {
                              setState(() {
                                inProgress = !inProgress;
                              });
                              final snackBar = SnackBar(
                                content:
                                    const Text('Produit ajoutés au panier'),
                                backgroundColor: ColorManager.greenAccent,
                              );
                              ScaffoldMessenger.of(context)
                                  .showSnackBar(snackBar);
                              Provider.of<LoaderProvider>(context,
                                      listen: false)
                                  .setLoadingStatus(status: false);
                            },
                          );
                        }
                      },
                      style: TextButton.styleFrom(
                        primary: Colors.white,
                        backgroundColor: ColorManager.blue,
                        padding: const EdgeInsets.all(AppPadding.p20),
                      ),
                      child: !inProgress
                          ? Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Text('AJOUTER AU PANIER'),
                                const SizedBox(width: AppSize.s5),
                                SvgPicture.asset(
                                  'assets/images/shopping_cart.svg',
                                  color: Colors.white,
                                  fit: BoxFit.cover,
                                ),
                                //Icon(Icons.add_shopping_cart)
                              ],
                            )
                          : const Center(
                              child: CircularProgressIndicator(
                                backgroundColor: Colors.white,
                              ),
                            ),
                    ),
    **/
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Stepper
  Widget buildStepper({double price, int min, int max, int step}) {
    return Row(
      children: [
        // Icon -
        buildContainerIconButton(Icons.remove, min, max, step, price),
        // TextField
        SizedBox(
          width: AppSize.s75,
          child: TextField(
            controller: myController,
            keyboardType: TextInputType.number,
            decoration: const InputDecoration(
              border: InputBorder.none,
              filled: true,
              fillColor: Colors.white,
            ),
            textAlign: TextAlign.center,
            onSubmitted: (String value) {
              if (int.parse(value) > (max / step).round()) {
                value = (max / step).round().toString();
              } else if (int.parse(value) < min / step) {
                value = '1';
              }

              setState(() {
                myController.text = value;
                qty = int.parse(value);
                widget.cartProducts.quantity = qty * step;
                montant = step * qty * price;
              });
            },
          ),
        ),
        // Icon +
        buildContainerIconButton(Icons.add, min, max, step, price),
      ],
    );
  }

  Container buildContainerIconButton(
    IconData iconSign,
    int min,
    int max,
    int step,
    double price,
  ) {
    return Container(
      width: AppSize.s50,
      color: Colors.black,
      child: IconButton(
        icon: Icon(iconSign),
        color: Colors.white,
        onPressed: () {
          setState(() {
            if (iconSign == Icons.remove) {
              if (qty == 1) {
                qty = 1;
              } else {
                qty -= 1;
              }
            }

            if (iconSign == Icons.add) {
              if (qty == (max / step).round()) {
                qty = (max / step).round();
              } else {
                qty += 1;
              }
            }
            myController.text = qty.toString();
            widget.cartProducts.quantity = qty * step;
            montant = step * qty * price;
          });
        },
      ),
    );
  }
}
