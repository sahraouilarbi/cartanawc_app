import 'package:cartanawc_app/core/extensions.dart';
import 'package:cartanawc_app/domain/entities/entities.dart';
import 'package:cartanawc_app/presentation/common/image_network_loading_progress.dart';
import 'package:cartanawc_app/presentation/common/no_image_placeholder.dart';
import 'package:cartanawc_app/presentation/pages.dart';
import 'package:cartanawc_app/presentation/ressources/appsize_manager.dart';
import 'package:flutter/material.dart';

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
