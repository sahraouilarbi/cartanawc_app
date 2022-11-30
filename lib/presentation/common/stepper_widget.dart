import 'package:cartanawc_app/presentation/ressources/appsize_manager.dart';
import 'package:flutter/material.dart';

class StepperWidget extends StatelessWidget {
  const StepperWidget({
    Key? key,
    required this.qtyStepController,
    required this.stepActionRemove,
    required this.stepActionAdd,
    required this.stepActionOnSubmitedValue,
  }) : super(key: key);
  final TextEditingController qtyStepController;
  final Function() stepActionRemove;
  final Function() stepActionAdd;
  final Function(String) stepActionOnSubmitedValue;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        // Icon -
        StepperActionsWidget(
          iconSign: Icons.remove,
          onPressed: stepActionRemove,
        ),
        // TextField
        SizedBox(
          width: AppSize.s75,
          child: TextField(
            controller: qtyStepController,
            keyboardType: TextInputType.number,
            decoration: const InputDecoration(
              border: InputBorder.none,
              filled: true,
              fillColor: Colors.white,
            ),
            textAlign: TextAlign.center,
            onSubmitted: stepActionOnSubmitedValue,
          ),
        ),
        // Icon +
        StepperActionsWidget(
          iconSign: Icons.add,
          onPressed: stepActionAdd,
        ),
      ],
    );
  }
}

class StepperActionsWidget extends StatelessWidget {
  const StepperActionsWidget({
    Key? key,
    required this.iconSign,
    required this.onPressed,
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
