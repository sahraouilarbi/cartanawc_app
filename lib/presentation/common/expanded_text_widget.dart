import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';

import '/presentation/ressources/appsize_manager.dart';
import '/presentation/ressources/size_config.dart';

class ExpandedTextWidget extends StatefulWidget {
  const ExpandedTextWidget({
    Key? key,
    required this.description,
    required this.shortDescription,
  }) : super(key: key);

  final String description;
  final String shortDescription;

  @override
  _ExpandedTextWidgetState createState() => _ExpandedTextWidgetState();
}

class _ExpandedTextWidgetState extends State<ExpandedTextWidget> {
  bool lireLaSuiteFlag = false;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(getProportionateScreenWidth(5.0)),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(AppPadding.p10),
            child: Html(
              data: lireLaSuiteFlag
                  ? widget.description
                  : widget.shortDescription,
            ),
          ),
          Align(
            child: GestureDetector(
              onTap: () {
                setState(() {
                  lireLaSuiteFlag = !lireLaSuiteFlag;
                });
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    lireLaSuiteFlag ? 'Lire moins' : 'Lire la suite',
                    style: const TextStyle(
                        color: Colors.black, fontWeight: FontWeight.bold),
                  ),
                  Icon(lireLaSuiteFlag
                      ? Icons.keyboard_arrow_up
                      : Icons.keyboard_arrow_down),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
