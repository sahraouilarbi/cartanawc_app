import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '/core/dependency_injection.dart';
import '/core/extensions.dart';
import '/core/prefs/app_prefs.dart';
import '/data/models/models.dart';
import '/domain/entities/entities.dart';
import '/presentation/common/appbar/custom_appbar_widget.dart';
import '/presentation/common/my_text_buttom_widget.dart';
import '/presentation/common/row_montant.dart';
import '/presentation/common/stepper_widget.dart';
import '/presentation/ressources/appsize_manager.dart';
import '/presentation/ressources/color_manager.dart';
import '/providers/auth_provider.dart';
import '/providers/cart_provider.dart';
import '/providers/loader_provider.dart';
import 'widgets.dart';

class ProductDetailsPage extends StatefulWidget {
  ProductDetailsPage({Key? key, required this.data}) : super(key: key);
  //final ProductModel data;
  final ProductEntity data;

  final CartProductsModel cartProducts = CartProductsModel();

  static const String routeName = '/productDetails';

  static Route route({required ProductEntity data}) {
    return MaterialPageRoute(
      settings: const RouteSettings(name: routeName),
      builder: (context) => ProductDetailsPage(data: data),
    );
  }

  @override
  _ProductDetailsPageState createState() => _ProductDetailsPageState();
}

class _ProductDetailsPageState extends State<ProductDetailsPage> {
  final AppPreferences _appPreferences = instance<AppPreferences>();
  bool isUserLoggedIn = false;

  late int qty;
  late double productPrice;
  late double montant;
  late int productStep, productMinQty, productMaxQty;
  late AuthProvider authProvider;
  bool inProgress = false;

  void calculMontant() {
    montant = double.parse(widget.data.price) * qty * productStep;
  }

  TextEditingController qtyStepController = TextEditingController();

  void _bind() {
    _appPreferences.isUserLoggedIn().then((value) {
      setState(() {
        isUserLoggedIn = value;
      });
    });
  }

  @override
  void initState() {
    super.initState();

    _bind();

    authProvider = Provider.of<AuthProvider>(context, listen: false);

    // Récuperer le prix
    widget.data.price != null && widget.data.price != kEMPTY
        ? productPrice = double.parse(widget.data.price)
        : productPrice = 0;

    // Récuperer la valeur step du produit des metadata
    productStep = int.parse(widget.data.metaData
        .where((element) => element.key == '_wcmmq_s_product_step')
        .first
        .value);

    // Récuperer la valeur minStep du produit des metadata
    productMinQty = int.parse(widget.data.metaData
        .where((element) => element.key == '_wcmmq_s_min_quantity')
        .first
        .value);

    // Récuperer la valeur MaxStep du produit des metadata
    productMaxQty = int.parse(widget.data.metaData
        .where((element) => element.key == '_wcmmq_s_max_quantity')
        .first
        .value);

    // initialiser la qty a 1 et calculer le montant
    qty = 1;
    calculMontant();

    // initiliser la quantité du produit dans le panier
    widget.cartProducts.quantity = qty * productStep;

    // Afficher une quantité 1 dans le textField Qty
    qtyStepController.text = qty.toString();
  }

  @override
  void dispose() {
    qtyStepController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(),
      body: SingleChildScrollView(
        child: Container(
          color: const Color(0xFFF3F3F3),
          padding: const EdgeInsets.all(AppPadding.p20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // Product Name
              ProductNameWidget(productName: widget.data.name),

              const Divider(height: AppSize.s2),

              // Product Description
              ProductDescriptionWidget(
                productImageUrl: widget.data.images[0].woocommerceSingle,
                productDescription: widget.data.description,
                productShortDescription: widget.data.shortDescription,
              ),
              const SizedBox(height: AppSize.s10),

              // Product Price
              ProductPriceDisplayWidget(
                productPrice: widget.data.price,
                isUserLoggedIn: isUserLoggedIn,
              ),

              const SizedBox(height: AppSize.s10),

              // Product Packaging
              ProductPackagingWidget(productStep: productStep),

              const SizedBox(height: AppSize.s10),

              // Stepper
              Visibility(
                visible: isUserLoggedIn,
                child: Column(
                  children: [
                    // Stepper
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          'Cartons à\ncommander :',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        StepperWidget(
                            qtyStepController: qtyStepController,
                            stepActionRemove: () {
                              setState(
                                () {
                                  if (qty <= 1) {
                                    qty = 1;
                                  } else {
                                    qty -= 1;
                                  }
                                  qtyStepController.text = qty.toString();
                                  widget.cartProducts.quantity =
                                      qty * productStep;
                                  montant = productStep * qty * productPrice;
                                },
                              );
                            },
                            stepActionAdd: () {
                              setState(
                                () {
                                  if (qty ==
                                      (productMaxQty / productStep).round()) {
                                    qty = (productMaxQty / productStep).round();
                                  } else {
                                    qty += 1;
                                  }
                                  qtyStepController.text = qty.toString();
                                  widget.cartProducts.quantity =
                                      qty * productStep;
                                  montant = productStep * qty * productPrice;
                                },
                              );
                            },
                            stepActionOnSubmitedValue: (String value) {
                              if (int.parse(value) >
                                  (productMaxQty / productStep).round()) {
                                value = (productMaxQty / productStep)
                                    .round()
                                    .toString();
                              } else if (int.parse(value) <
                                  productMinQty / productStep) {
                                value = '1';
                              }
                              setState(
                                () {
                                  qtyStepController.text = value;
                                  qty = int.parse(value);
                                  widget.cartProducts.quantity =
                                      qty * productStep;
                                  montant = productStep * qty * productPrice;
                                },
                              );
                            }),
                      ],
                    ),

                    const SizedBox(height: AppSize.s10),

                    // Montant
                    MontantWidget(
                      value: montant,
                      fontSize: 18.0,
                    ),

                    const SizedBox(height: AppSize.s10),

                    MyTextButtonWidget(
                      onPressed: () {
                        if (qty == 0) {
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                            content: const Text('Ajouter une quantité > 0'),
                            backgroundColor: ColorManager.red,
                          ));
                        } else if (qty > 0) {
                          setState(() {
                            inProgress = !inProgress;
                          });

                          Provider.of<LoaderProvider>(context, listen: false)
                              .setLoadingStatus(status: true);
                          final cartProvider =
                              Provider.of<CartProvider>(context, listen: false);
                          widget.cartProducts.productId = widget.data.id;
                          // TODO revoir variations
                          // widget.cartProducts.variationId =
                          //     widget.data.variations != null
                          //         ? widget.data.variations.id
                          //         : 0;
                          // TODO
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
