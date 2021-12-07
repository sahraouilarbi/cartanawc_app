import 'package:cartanawc_app/models/cart_response_model.dart';
import 'package:cartanawc_app/model_views/providers/cart_provider.dart';
import 'package:cartanawc_app/model_views/providers/loader_provider.dart';
import 'package:cartanawc_app/utils/theme_config.dart';
import 'package:cartanawc_app/utils/utils.dart';
import 'package:cartanawc_app/views/widgets/row_montant.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CartProduct extends StatefulWidget {
  const CartProduct({Key key, this.data}) : super(key: key);
  final CartItem data;

  @override
  _CartProductState createState() => _CartProductState();
}

class _CartProductState extends State<CartProduct> {
  int qty;
  double montant;
  TextEditingController myController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0.5,
      margin: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 6.0),
      child: Container(
        decoration: const BoxDecoration(
          color: Colors.white,
        ),
        child: makeListTitle(context),
      ),
    );
  }

  Widget makeListTitle(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 15.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const SizedBox(height: 10.0),
          Container(
            color: ThemeConfig.cartanaColorYellow,
            padding:
                const EdgeInsets.symmetric(vertical: 5.0, horizontal: 10.0),
            child: Text(
              widget.data.variationId == 0
                  ? widget.data.productName
                  : '${widget.data.productName} ${widget.data.attributeValue} ${widget.data.attribute})',
              style: const TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 16.0),
            ),
          ),
          const SizedBox(height: 10.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: 75.0,
                height: 75.0,
                decoration: BoxDecoration(border: Border.all()),
                alignment: Alignment.center,
                child: Image.network(
                  widget.data.thumbnail,
                  fit: BoxFit.cover,
                ),
              ),
              Column(
                children: [
                  const Text(
                    'Cartons à commander :',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 5.0),
                  Container(
                    decoration: const BoxDecoration(color: Colors.black),
                    child: Row(
                      children: [
                        IconButton(
                            icon: const Icon(
                              Icons.remove,
                              color: Colors.white,
                            ),
                            onPressed: () {
                              setState(() {
                                // if (widget.data.qty ==
                                //     int.parse(
                                //         widget.data.lowerLimitStepper)) {
                                //   _qty = int.parse(
                                //       widget.data.lowerLimitStepper);
                                // } else {
                                //   _qty -=
                                //       int.parse(widget.data.conditionnement);
                                // }
                              });
                            }),
                        Container(
                          padding: const EdgeInsets.all(10.0),
                          decoration: BoxDecoration(
                              color: Colors.white, border: Border.all()),
                          child: Text(
                            widget.data.qty < 10
                                //? '0${widget.data.qty / int.parse(widget.data.productStep)}'
                                //: '${widget.data.qty / int.parse(widget.data.step)}',
                                ? '0${widget.data.qty}'
                                : '${widget.data.qty}',
                            style: const TextStyle(
                              fontSize: 18.0,
                            ),
                          ),
                        ),
                        IconButton(
                            icon: const Icon(Icons.add, color: Colors.white),
                            onPressed: () {}),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: 10.0),
          rowMontant(
              textLabel: 'MONTANT', valeurMontant: widget.data.lineSubtotal),
          const SizedBox(height: 10.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              TextButton(
                onPressed: () {},
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    vertical: 10.0,
                    horizontal: 20.0,
                  ),
                  color: ThemeConfig.cartanaColorGrey,
                  child: const Text(
                    'MODIFIER',
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
              TextButton(
                onPressed: () {
                  Utils().showMessage(
                    context,
                    'Cartana',
                    'Voulez-vous vraiment supprimer ce produit ?',
                    'Oui',
                    () {
                      Provider.of<LoaderProvider>(context, listen: false)
                          .setLoadingStatus(status: true);
                      Provider.of<CartProvider>(context, listen: false)
                          .removeItem(widget.data.productId);
                      Provider.of<LoaderProvider>(context, listen: false)
                          .setLoadingStatus(status: false);
                      Navigator.of(context).pop();
                    },
                    buttonText2: 'Non',
                    isConfirmationDialog: true,
                    onPressed2: () {
                      Navigator.of(context).pop();
                    },
                  );
                },
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    vertical: 10.0,
                    horizontal: 20.0,
                  ),
                  color: ThemeConfig.cartanaColorRed,
                  child: const Text(
                    'SUPPRIMER',
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ],
          ),
        ],
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
                //widget.cartProducts.quantity = qty * step;
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
            //widget.cartProducts.quantity = qty * step;
            montant = step * qty * price;
          });
        },
      ),
    );
  }
}
