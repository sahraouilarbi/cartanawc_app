import 'package:cartanawc_app/models/cart_request_model.dart';
import 'package:cartanawc_app/models/product_model.dart';
import 'package:cartanawc_app/provider/auth_provider.dart';
import 'package:cartanawc_app/provider/cart_provider.dart';
import 'package:cartanawc_app/provider/loader_provider.dart';
import 'package:cartanawc_app/widgets/expanded_text.dart';
import 'package:cartanawc_app/utils/size_config.dart';
import 'package:cartanawc_app/utils/theme_config.dart';
import 'package:cartanawc_app/widgets/appbar_widget.dart';
import 'package:cartanawc_app/widgets/image_network_loading_progress.dart';
import 'package:cartanawc_app/widgets/no_image_placeholder.dart';
import 'package:cartanawc_app/widgets/row_montant.dart';
import 'package:cartanawc_app/widgets/textbuttom_widget.dart';
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
    productPrice = double.parse(widget.data.price);

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
                visible: widget.data.price != '',
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
                visible:
                    true, // TODO authProvider.loggedInStatus == Status.loggedIn,
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

                    textButton(
                      onPressed: () {
                        if (qty > 0) {
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
                              // final snackBar = SnackBar(
                              //   // Orthographe : Verifier si la variable qty est supèrieure a 1 pour ajouter 's' à carton
                              //   // Idem pour la variable step pour ajouter 's' à pièce
                              //   content: qty > 1
                              //       ? int.parse(widget.cartProducts.step) > 1
                              //           ? Text(
                              //               '($qty) cartons de (${widget.cartProducts.step} x pièces) ajoutés au panier')
                              //           : Text(
                              //               '($qty) cartons de (${widget.cartProducts.step} x pièce) ajoutés au panier')
                              //       : int.parse(widget.cartProducts.step) > 1
                              //           ? Text(
                              //               '($qty) carton de (${widget.cartProducts.step} x pièces) ajouté au panier')
                              //           : Text(
                              //               '($qty) carton de (${widget.cartProducts.step} x pièce) ajouté au panier'),
                              //   backgroundColor: ThemeConfig.cartanaColorGreen,
                              // );
                              // ScaffoldMessenger.of(context)
                              //     .showSnackBar(snackBar);
                              Provider.of<LoaderProvider>(context,
                                      listen: false)
                                  .setLoadingStatus(status: false);
                            },
                          );
                        }
                      },
                      text: 'AJOUTER AU PANIER',
                      textColor: Colors.white,
                      iconRight: const Icon(Icons.add_shopping_cart),
                      backgroundColor: ThemeConfig.cartanaColorBlue,
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
