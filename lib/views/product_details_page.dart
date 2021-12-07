import 'package:cartanawc_app/models/cart_request_model.dart';
import 'package:cartanawc_app/models/product_model.dart';
import 'package:cartanawc_app/model_views/providers/auth_provider.dart';
import 'package:cartanawc_app/model_views/providers/cart_provider.dart';
import 'package:cartanawc_app/model_views/providers/loader_provider.dart';
import 'package:cartanawc_app/views/widgets/expanded_text.dart';
import 'package:cartanawc_app/utils/size_config.dart';
import 'package:cartanawc_app/utils/theme_config.dart';
import 'package:cartanawc_app/core/widgets/appbar_widget.dart';
import 'package:cartanawc_app/views/widgets/image_network_loading_progress.dart';
import 'package:cartanawc_app/views/widgets/no_image_placeholder.dart';
import 'package:cartanawc_app/views/widgets/row_montant.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProductDetails extends StatefulWidget {
  ProductDetails({Key key, this.data}) : super(key: key);
  final Product data;

  final CartProducts cartProducts = CartProducts();

  @override
  _ProductDetailsState createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
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
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Container(
                color: Colors.white,
                padding: const EdgeInsets.all(20.0),
                child: Text(
                  widget.data.name,
                  style: const TextStyle(
                    fontSize: 16.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const Divider(
                height: 2.0,
                color: Colors.black,
              ),
              Container(
                color: Colors.white,
                child: Column(
                  children: [
                    if (widget.data.images[0].woocommerceSingle != null)
                      SizedBox(
                        height: getProportionateScreenHeight(335.0),
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

              const SizedBox(height: 10.0),

              // Prix
              Visibility(
                //visible: widget.data.price != '',
                visible: authProvider.loggedInStatus == Status.loggedIn,
                child: Container(
                  color: Colors.white,
                  child: Row(
                    children: [
                      Container(
                        width: 50.0,
                        height: 50.0,
                        color: Colors.black,
                        child: Image.asset(
                          'assets/images/icon_bottle.png',
                          fit: BoxFit.cover,
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.only(left: 20.0),
                        child: Text(
                            '${widget.data.price.replaceAll('.', ',')} DA / U'),
                      ),
                    ],
                  ),
                ),
              ),

              const SizedBox(height: 10.0),

              //*** Packaging
              Container(
                color: Colors.white,
                child: Row(
                  children: [
                    Container(
                      width: 50.0,
                      height: 50.0,
                      color: Colors.black,
                      child: Image.asset(
                        'assets/images/icon_packaging.png',
                        fit: BoxFit.cover,
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(left: 20.0),
                      child: Text('$productStep x pièces / carton'),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 10.0),
              Visibility(
                visible: authProvider.loggedInStatus == Status.loggedIn,
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

                    const SizedBox(height: 10.0),

                    //*** Montant
                    rowMontant(
                        textLabel: 'MONTANT',
                        valeurMontant: montant,
                        fontSize: 18.0),

                    const SizedBox(height: 10.0),

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
                                backgroundColor: ThemeConfig.cartanaColorGreen,
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
                        backgroundColor: ThemeConfig.cartanaColorBlue,
                        padding: const EdgeInsets.all(20.0),
                      ),
                      child: !inProgress
                          ? Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: const [
                                Text('AJOUTER AU PANIER'),
                                SizedBox(width: 5.0),
                                Icon(Icons.add_shopping_cart)
                              ],
                            )
                          : const Center(
                              child: CircularProgressIndicator(
                                backgroundColor: Colors.white,
                              ),
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

  // Stepper
  Widget buildStepper({double price, int min, int max, int step}) {
    return Row(
      children: [
        // Icon -
        buildContainerIconButton(Icons.remove, min, max, step, price),
        // TextField
        SizedBox(
          width: 75.0,
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
      width: 50.0,
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
