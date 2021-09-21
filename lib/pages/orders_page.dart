import 'package:cartanawc_app/models/order_model.dart';
import 'package:cartanawc_app/provider/order_provider.dart';
import 'package:cartanawc_app/utils/size_config.dart';
import 'package:cartanawc_app/widgets/widget_orders_item.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class OrdersPage extends StatefulWidget {
  const OrdersPage({Key key}) : super(key: key);

  @override
  _OrdersPageState createState() => _OrdersPageState();
}

class _OrdersPageState extends State<OrdersPage> {
  @override
  void initState() {
    super.initState();
    final ordersProvider = Provider.of<OrderProvider>(context, listen: false);
    ordersProvider.fetchOrders();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<OrderProvider>(builder: (context, ordersModel, child) {
      if (ordersModel.allOrders != null && ordersModel.allOrders.isNotEmpty) {
        return _listOfOrders(context, ordersModel.allOrders);
      }
      return const Center(
        child: CircularProgressIndicator(),
      );
    });
  }

  Widget _listOfOrders(
    BuildContext context,
    List<OrderModel> orders,
  ) {
    return ListView(
      children: [
        ListView.builder(
            itemCount: orders.length,
            physics: const ScrollPhysics(),
            padding: EdgeInsets.all(
              getProportionateScreenHeight(8.0),
            ),
            shrinkWrap: true,
            itemBuilder: (context, index) {
              return Card(
                elevation: 0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16.0),
                ),
                child: WidgetOrderItem(
                  orderModel: orders[index],
                ),
              );
            }),
      ],
    );
  }
}
