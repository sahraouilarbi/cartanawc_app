import 'package:cartanawc_app/presentation/ressources/appsize_manager.dart';
import 'package:cartanawc_app/presentation/ressources/color_manager.dart';
import 'package:cartanawc_app/data/api/api_service.dart';
import 'package:cartanawc_app/data/models/order_detail_model.dart';
import 'package:cartanawc_app/presentation/common/base_page.dart';
import 'package:cartanawc_app/presentation/common/checkpoint_widget.dart';
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
      padding: const EdgeInsets.all(AppPadding.p10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('#${model.orderId}'),
          Text('${model.orderDate}'),
          const SizedBox(
            height: AppSize.s20,
          ),
          const Text('Livrer à :'),
          Text(model.shipping.address1),
          Text(model.shipping.address2),
          Text('${model.shipping.city}, ${model.shipping.state}'),
          const SizedBox(
            height: AppSize.s20,
          ),
          const Text('Methode de paiement :'),
          Text(model.paymentMethod),
          Divider(color: ColorManager.grey),
          const SizedBox(
            height: AppSize.s5,
          ),
          CheckPoints(
            checkedTill: 0,
            checkPoints: const ['En traitement', 'Expédition', 'Livrée'],
            checkPointFilledColor: ColorManager.greenAccent,
          ),
          Divider(color: ColorManager.grey),
          _listOrderItems(model),
          Divider(color: ColorManager.grey),
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

  Widget _productItems(LineItemsModel product) {
    return ListTile(
      dense: true,
      contentPadding: const EdgeInsets.all(AppPadding.p2),
      onTap: () {},
      title: Text(product.productName),
      subtitle: Padding(
        padding: const EdgeInsets.all(AppPadding.p1),
        child: Text('Qte: ${product.quantity}'),
      ),
      trailing: Text('${product.totalAmount} DA'),
    );
  }

  Widget _itemTotal(String label, String value, {TextStyle textStyle}) {
    return ListTile(
      dense: true,
      // s_4 = -4.0;
      visualDensity: const VisualDensity(vertical: AppSize.s_4),
      // p_10 = -10.0;
      contentPadding: const EdgeInsets.fromLTRB(
          AppPadding.p2, AppPadding.p_10, AppPadding.p2, AppPadding.p_10),
      title: Text(
        label,
        style: textStyle,
      ),
    );
  }
}
