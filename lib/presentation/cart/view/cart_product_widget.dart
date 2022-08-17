import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '/data/models/models.dart';
import '/presentation/common/row_montant.dart';
import '/presentation/common/utils.dart';
import '/presentation/ressources/appsize_manager.dart';
import '/presentation/ressources/color_manager.dart';
import '/providers/cart_provider.dart';
import '/providers/loader_provider.dart';

class CartProduct extends StatefulWidget {
  const CartProduct({Key? key, required this.data}) : super(key: key);
  final CartItemModel data;

  @override
  _CartProductState createState() => _CartProductState();
}

class _CartProductState extends State<CartProduct> {
  int? qty;
  double? montant;
  TextEditingController myController = TextEditingController();
  @override
  void dispose() {
    myController.dispose();
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
                    stepper(),
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

  Container stepper() {
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
              widget.data.qty! < 10
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
            onPressed: () {},
            icon: const Icon(Icons.add, color: Colors.white),
          ),
        ],
      ),
    );
  }

  TextButton buttonSupprimer(BuildContext context) {
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

  Container productImage() {
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

  Container productName() {
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
