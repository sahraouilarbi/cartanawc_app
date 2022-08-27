import 'package:flutter/material.dart';

import '/core/extensions.dart';
import '/domain/entities/entities.dart';
import '/presentation/common/image_network_loading_progress.dart';
import '/presentation/common/no_image_placeholder.dart';
import '/presentation/pages.dart';
import '/presentation/ressources/appsize_manager.dart';

class ProductTile extends StatelessWidget {
  const ProductTile({Key? key, required this.data}) : super(key: key);
  final ProductEntity data;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {
        Navigator.pushNamed(
          context,
          ProductDetailsPage.routeName,
          arguments: data,
        );
      },
      leading: data.images[0].woocommerceGalleryThumbnail != kEMPTY
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
      trailing: Text(
        data.price != kEMPTY ? '${data.price.replaceAll('.', ',')} DA' : kEMPTY,
      ),
    );
  }
}
