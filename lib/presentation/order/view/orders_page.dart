import 'package:cartanawc_app/data/models/models.dart';
import 'package:cartanawc_app/presentation/order/view/widget_orders_item.dart';
import 'package:cartanawc_app/presentation/ressources/appsize_manager.dart';
import 'package:cartanawc_app/presentation/ressources/size_config.dart';
import 'package:cartanawc_app/providers/order_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class OrdersPage extends StatefulWidget {
  const OrdersPage({Key? key}) : super(key: key);

  static const String routeName = '/orders';

  static Route route() {
    return MaterialPageRoute(
      settings: const RouteSettings(name: routeName),
      builder: (context) => const OrdersPage(),
    );
  }

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
    return Consumer<OrderProvider>(
      builder: (context, ordersModel, child) {
        if (ordersModel.allOrders != null && ordersModel.allOrders.isNotEmpty) {
          return _listOfOrders(context, ordersModel.allOrders);
        }
        return const Center(
          child: CircularProgressIndicator(),
        );
      },
    );
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
            getProportionateScreenHeight(AppPadding.p8),
          ),
          shrinkWrap: true,
          itemBuilder: (context, index) {
            return Card(
              elevation: 0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(AppSize.s16),
              ),
              child: WidgetOrderItem(
                orderModel: orders[index],
              ),
            );
          },
        ),
      ],
    );
  }
}
