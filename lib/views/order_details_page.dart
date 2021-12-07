import 'package:cartanawc_app/services/api_service.dart';
import 'package:cartanawc_app/models/order_detail_model.dart';
import 'package:cartanawc_app/views/base_page.dart';
import 'package:cartanawc_app/utils/theme_config.dart';
import 'package:cartanawc_app/views/widgets/checkpoint_widget.dart';
import 'package:flutter/material.dart';

class OrderDetailsPage extends BasePage {
  const OrderDetailsPage({Key key, this.orderId}) : super(key: key);
  final int orderId;
  @override
  _OrderDetailsPageState createState() => _OrderDetailsPageState();
}

class _OrderDetailsPageState extends BasePageState<OrderDetailsPage> {
  APIService apiService;
  @override
  void initState() {
    super.initState();
    apiService = APIService();
  }

  @override
  Widget pageUI() {
    return FutureBuilder(
      future: apiService.getOrderDetails(widget.orderId),
      builder: (
        BuildContext context,
        AsyncSnapshot<OrderDetailModel> orderDetailsModel,
      ) {
        if (orderDetailsModel.hasData) {
          return orderDetailUI(orderDetailsModel.data);
        }
        return const Center(
          child: CircularProgressIndicator(),
        );
      },
    );
  }

  Widget orderDetailUI(OrderDetailModel model) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('#${model.orderId}'),
          Text('${model.orderDate}'),
          const SizedBox(
            height: 20.0,
          ),
          const Text('Livrer à :'),
          Text(model.shipping.address1),
          Text(model.shipping.address2),
          Text('${model.shipping.city}, ${model.shipping.state}'),
          const SizedBox(
            height: 20.0,
          ),
          const Text('Methode de paiement :'),
          Text(model.paymentMethod),
          Divider(color: ThemeConfig.cartanaColorGrey),
          const SizedBox(
            height: 5.0,
          ),
          CheckPoints(
            checkedTill: 0,
            checkPoints: const ['En traitement', 'Expédition', 'Livrée'],
            checkPointFilledColor: ThemeConfig.cartanaColorGreen,
          ),
          Divider(color: ThemeConfig.cartanaColorGrey),
          _listOrderItems(model),
          Divider(color: ThemeConfig.cartanaColorGrey),
          _itemTotal('Sous-Total', '${model.itemTotalAmount}'),
          _itemTotal("Frais d'Expédition", '${model.shippingTotal}'),
          _itemTotal('Total', '${model.totalAmount}'),
        ],
      ),
    );
  }

  Widget _listOrderItems(OrderDetailModel model) {
    return ListView.builder(
        itemCount: model.lineItems.length,
        physics: const ScrollPhysics(),
        shrinkWrap: true,
        itemBuilder: (context, index) {
          return _productItems(model.lineItems[index]);
        });
  }

  Widget _productItems(LineItems product) {
    return ListTile(
      dense: true,
      contentPadding: const EdgeInsets.all(2.0),
      onTap: () {},
      title: Text(product.productName),
      subtitle: Padding(
        padding: const EdgeInsets.all(1.0),
        child: Text('Qte: ${product.quantity}'),
      ),
      trailing: Text('${product.totalAmount} DA'),
    );
  }

  Widget _itemTotal(String label, String value, {TextStyle textStyle}) {
    return ListTile(
      dense: true,
      visualDensity: const VisualDensity(vertical: -4),
      contentPadding: const EdgeInsets.fromLTRB(2.0, -10, 2, -10),
      title: Text(
        label,
        style: textStyle,
      ),
    );
  }
}
