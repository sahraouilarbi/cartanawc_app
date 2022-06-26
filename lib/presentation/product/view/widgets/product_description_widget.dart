import 'package:flutter/material.dart';

import '/presentation/common/expanded_text.dart';
import '/presentation/common/image_network_loading_progress.dart';
import '/presentation/common/no_image_placeholder.dart';
import '/presentation/ressources/appsize_manager.dart';
import '/presentation/ressources/size_config.dart';

class ProductDescriptionWidget extends StatelessWidget {
  const ProductDescriptionWidget({
    Key key,
    @required this.productImageUrl,
    @required this.productDescription,
    @required this.productShortDescription,
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
          if (productImageUrl != null)
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
            visible: productDescription != '',
            child: ExpandedText(
              labelHeader: 'Détails du produit',
              description: productDescription ?? '',
              shortDescription: productShortDescription ?? '',
            ),
          ),
        ],
      ),
    );
  }
}
