import 'package:cartanawc_app/presentation/ressources/appsize_manager.dart';
import 'package:flutter/material.dart';

class StepperActionsWidget extends StatelessWidget {
  const StepperActionsWidget({
    Key key,
    @required this.iconSign,
    @required this.onPressed,
  }) : super(key: key);
  final IconData iconSign;
  final Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: AppSize.s50,
      color: Colors.black,
      child: IconButton(
        icon: Icon(iconSign),
        color: Colors.white,
        onPressed: onPressed,
      ),
    );
  }
}
