import 'package:cartanawc_app/data/models/order_model.dart';
import 'package:cartanawc_app/presentation/ressources/appsize_manager.dart';
import 'package:cartanawc_app/presentation/ressources/color_manager.dart';
import 'package:cartanawc_app/presentation/common/textbuttom_widget.dart';
import 'package:flutter/material.dart';

class WidgetOrderItem extends StatelessWidget {
  const WidgetOrderItem({Key key, this.orderModel}) : super(key: key);
  final OrderModel orderModel;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(AppMargin.m10),
      child: Column(
        children: [
          _orderStatus(orderModel.status),
          Divider(
            color: ColorManager.grey,
          ),
          const SizedBox(
            height: AppSize.s10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _iconText(
                const Icon(Icons.today, color: Colors.black),
                const Text(
                  'Date de commande',
                  style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
                ),
              ),
              Text(
                '', //'${orderModel.dateCreated}',
                style: const TextStyle(fontSize: 14.0),
              ),
            ],
          ),
          const SizedBox(
            height: AppSize.s10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              textButton(
                text: 'Details',
                iconRight: const Icon(Icons.chevron_right),
                textColor: Colors.white,
                backgroundColor: Colors.blueAccent,
                onPressed: () {
                  /*Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => OrderDetailsPage(
                        orderId: orderModel.id,
                      ),
                    ),
                  );*/
                },
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _orderStatus(String status) {
    Icon icon;
    Color color;
    if (status == 'pending' || status == 'processing' || status == 'on-hold') {
      icon = const Icon(
        Icons.timer,
        color: Colors.orange,
      );
      color = Colors.orange;
    } else if (status == 'completed') {
      icon = Icon(
        Icons.check,
        color: ColorManager.greenAccent,
      );
      color = ColorManager.greenAccent;
    } else if (status == 'cancelled') {
      icon = Icon(
        Icons.clear,
        color: ColorManager.red,
      );
      color = ColorManager.red;
    }
    return _iconText(
        icon,
        Text(
          'Commande $status',
          style: TextStyle(
            fontSize: 15.0,
            fontWeight: FontWeight.bold,
            color: color,
          ),
        ));
  }

  Widget _iconText(Icon icon, Text text) {
    return Row(
      children: [
        icon,
        const SizedBox(
          width: AppSize.s5,
        ),
        text
      ],
    );
  }
}
