import 'package:cartanawc_app/data/models/models.dart';
import 'package:cartanawc_app/presentation/common/row_montant.dart';
import 'package:cartanawc_app/presentation/common/stepper_widget.dart';
import 'package:cartanawc_app/presentation/common/utils.dart';
import 'package:cartanawc_app/presentation/ressources/appsize_manager.dart';
import 'package:cartanawc_app/presentation/ressources/color_manager.dart';
import 'package:cartanawc_app/providers/cart_provider.dart';
import 'package:cartanawc_app/providers/loader_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CartProduct extends StatefulWidget {
  const CartProduct({Key? key, required this.data}) : super(key: key);
  final CartItemModel data;

  @override
  _CartProductState createState() => _CartProductState();
}

class _CartProductState extends State<CartProduct> {
  int _cartonACommander = 1;
  late int _qty;
  late int _productStep;
  late int _productMaxQty;
  late double _productPrice;
  late double? _montant;
  TextEditingController qtyStepController = TextEditingController();

  @override
  void initState() {
    super.initState();

    // Récuperer la valeur step
    _productStep = int.parse(widget.data.productStep!);

    // Récuperer la quantité commandée
    _qty = widget.data.qty!;

    // Calculer le nombre de cartons commandés
    _cartonACommander = _qty ~/ _productStep;

    // Afficher le nombre de cartons commandés
    qtyStepController.text = _cartonACommander.toString();

    // Récupérer le prix du product
    _productPrice = double.parse(widget.data.productRegularPrice!);

    // Récuperer la valeur ProductMaxQty
    // TODO Déterminer la valeur maximal a commander
    _productMaxQty = 1000;
  }

  @override
  void dispose() {
    qtyStepController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: AppSize.s1,
      margin: const EdgeInsets.symmetric(
        horizontal: AppMargin.m10,
        vertical: AppMargin.m6,
      ),
      child: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: AppPadding.p20,
          vertical: AppPadding.p15,
        ),
        decoration: const BoxDecoration(
          color: Colors.white,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const SizedBox(height: AppSize.s10),
            productName(),
            const SizedBox(height: AppSize.s10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                productImage(),
                Column(
                  children: [
                    const Text(
                      'Cartons à commander :',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: AppSize.s5),
                    //stepperWidget(),
                    StepperWidget(
                      qtyStepController: qtyStepController,
                      stepActionRemove: () {
                        setState(
                          () {
                            if (_cartonACommander <= 1) {
                              _cartonACommander = 1;
                            } else {
                              _cartonACommander--;
                            }
                            qtyStepController.text =
                                _cartonACommander.toString();
                            widget.data.qty = _cartonACommander * _productStep;
                            _montant = _cartonACommander *
                                _productStep *
                                _productPrice;
                          },
                        );
                      },
                      stepActionAdd: () {
                        setState(
                          () {
                            if (_cartonACommander == _productMaxQty) {
                              _cartonACommander = _productMaxQty;
                            } else {
                              _cartonACommander++;
                            }
                            qtyStepController.text =
                                _cartonACommander.toString();
                            widget.data.qty = _cartonACommander * _productStep;
                            _montant = _cartonACommander *
                                _productStep *
                                _productPrice;
                          },
                        );
                      },
                      stepActionOnSubmitedValue: (String value) {
                        if (int.parse(value) > _productMaxQty) {
                          value = _productMaxQty.toString();
                        } else if (int.parse(value) < 1) {
                          value = '1';
                        }
                        setState(
                          () {
                            qtyStepController.text = value;
                            _cartonACommander = int.parse(value);
                            widget.data.qty = _cartonACommander * _productStep;
                            _montant = _cartonACommander *
                                _productStep *
                                _productPrice;
                          },
                        );
                      },
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: AppSize.s10),
            MontantWidget(
              value: widget.data.lineSubtotal!,
            ),
            const SizedBox(height: AppSize.s10),
            buttonSupprimer(context),
          ],
        ),
      ),
    );
  }

  Widget stepperWidget() {
    final int _qty = widget.data.qty!;
    final int _step = int.parse(widget.data.productStep!);
    final int _cartonACommander = _qty ~/ _step;
    return Container(
      decoration: const BoxDecoration(color: Colors.black),
      child: Row(
        children: [
          IconButton(
            icon: const Icon(
              Icons.remove,
              color: Colors.white,
            ),
            onPressed: () {
              //setState(() {
              // if (widget.data.qty ==
              //     int.parse(
              //         widget.data.lowerLimitStepper)) {
              //   _qty = int.parse(
              //       widget.data.lowerLimitStepper);
              // } else {
              //   _qty -=
              //       int.parse(widget.data.conditionnement);
              // }
              //});
            },
          ),
          Container(
            padding: const EdgeInsets.all(AppPadding.p10),
            decoration:
                BoxDecoration(color: Colors.white, border: Border.all()),
            child: Text(
              _cartonACommander < 10
                  ? '0$_cartonACommander'
                  : '$_cartonACommander',
              style: const TextStyle(
                fontSize: 18.0,
              ),
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.add, color: Colors.white),
          ),
        ],
      ),
    );
  }

  Widget buttonSupprimer(BuildContext context) {
    return TextButton(
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
                .removeItem(widget.data.productId!);
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
          vertical: AppPadding.p10,
          horizontal: AppPadding.p20,
        ),
        color: ColorManager.red,
        child: const Text(
          'SUPPRIMER',
          textAlign: TextAlign.center,
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }

  Widget productImage() {
    return Container(
      width: AppSize.s75,
      height: AppSize.s75,
      decoration: BoxDecoration(border: Border.all()),
      alignment: Alignment.center,
      child: Image.network(
        widget.data.thumbnail!,
        fit: BoxFit.cover,
      ),
    );
  }

  Widget productName() {
    return Container(
      color: ColorManager.yellow,
      padding: const EdgeInsets.symmetric(
        vertical: AppPadding.p5,
        horizontal: AppPadding.p10,
      ),
      child: Text(
        widget.data.variationId == 0
            ? widget.data.productName!
            : '${widget.data.productName} ${widget.data.attributeValue} ${widget.data.attribute})',
        style: const TextStyle(
          color: Colors.black,
          fontWeight: FontWeight.bold,
          fontSize: 16.0,
        ),
      ),
    );
  }
}
