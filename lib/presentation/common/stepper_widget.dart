import 'package:flutter/material.dart';

import '/presentation/ressources/appsize_manager.dart';
import 'stepper_actions_widget.dart';

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
