import 'package:cartanawc_app/core/extensions.dart';
import 'package:cartanawc_app/presentation/common/expanded_text_widget.dart';
import 'package:cartanawc_app/presentation/common/image_network_loading_progress.dart';
import 'package:cartanawc_app/presentation/common/no_image_placeholder.dart';
import 'package:cartanawc_app/presentation/ressources/appsize_manager.dart';
import 'package:cartanawc_app/presentation/ressources/size_config.dart';
import 'package:flutter/material.dart';

class ProductDescriptionWidget extends StatelessWidget {
  const ProductDescriptionWidget({
    Key? key,
    required this.productImageUrl,
    required this.productDescription,
    required this.productShortDescription,
  }) : super(key: key);

  final String productImageUrl;
  final String productDescription;
  final String productShortDescription;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Column(
        children: [
          if (productImageUrl != kEMPTY)
            SizedBox(
              height: getProportionateScreenHeight(AppSize.s335),
              child: Image.network(
                productImageUrl,
                fit: BoxFit.cover,
                loadingBuilder: imageNetworkLoadingProgress,
              ),
            )
          else
            const NoImagePlaceholder(),
          Visibility(
            visible: productDescription != kEMPTY,
            child: ExpandedTextWidget(
              description: productDescription,
              shortDescription: productShortDescription,
            ),
          ),
        ],
      ),
    );
  }
}
