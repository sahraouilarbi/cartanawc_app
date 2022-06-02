import 'package:cartanawc_app/presentation/common/image_network_loading_progress.dart';
import 'package:cartanawc_app/presentation/common/no_image_placeholder.dart';
import 'package:cartanawc_app/presentation/ressources/appsize_manager.dart';
import 'package:flutter/material.dart';

import '/data/models/models.dart';
import '/presentation/pages.dart';

class ProductTile extends StatelessWidget {
  const ProductTile({Key key, this.data}) : super(key: key);
  final ProductModel data;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (BuildContext context) => ProductDetailsPage(data: data),
          ),
        );
      },
      leading: data.images[0].woocommerceGalleryThumbnail != null
          ? Container(
              width: AppSize.s56,
              height: AppSize.s56,
              padding: const EdgeInsets.all(AppPadding.p4),
              child: Image.network(
                data.images[0].woocommerceGalleryThumbnail,
                fit: BoxFit.cover,
                loadingBuilder: imageNetworkLoadingProgress,
              ),
            )
          : const NoImagePlaceholder(),
      title: Text(data.name),
      trailing: Text(data.price != null && data.price != ''
          ? '${data.price.replaceAll('.', ',')} DA'
          : ''),
    );
  }
}
