import 'package:cartanawc_app/models/product_model.dart';
import 'package:cartanawc_app/views/product_details_page.dart';
import 'package:cartanawc_app/views/widgets/image_network_loading_progress.dart';
import 'package:cartanawc_app/views/widgets/no_image_placeholder.dart';
import 'package:flutter/material.dart';

class ProductTile extends StatelessWidget {
  const ProductTile({Key key, this.data}) : super(key: key);
  final Product data;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (BuildContext context) => ProductDetails(data: data),
          ),
        );
      },
      leading: data.images[0].woocommerceGalleryThumbnail != null
          ? Container(
              width: 56.0,
              height: 56.0,
              padding: const EdgeInsets.all(4.0),
              child: Image.network(
                data.images[0].woocommerceGalleryThumbnail,
                fit: BoxFit.cover,
                loadingBuilder: imageNetworkLoadingProgress,
              ),
            )
          : noImagePlaceHolder(),
      title: Text(data.name),
      trailing: Text(data.price != null && data.price != ''
          ? '${data.price.replaceAll('.', ',')} DA'
          : ''),
    );
  }
}
