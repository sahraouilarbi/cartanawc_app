import 'package:cartanawc_app/presentation/ressources/size_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';

class ExpandedText extends StatefulWidget {
  const ExpandedText({
    Key key,
    @required this.labelHeader,
    @required this.description,
    @required this.shortDescription,
  }) : super(key: key);

  final String labelHeader;
  final String description;
  final String shortDescription;

  @override
  _ExpandedTextState createState() => _ExpandedTextState();
}

class _ExpandedTextState extends State<ExpandedText> {
  bool lireLaSuiteFlag = false;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(getProportionateScreenWidth(5.0)),
      child: Column(
        children: [
          Text(
            widget.labelHeader,
            style: const TextStyle(
              fontSize: 15.0,
              color: Colors.black,
            ),
          ),
          Html(
            data:
                lireLaSuiteFlag ? widget.description : widget.shortDescription,
            padding: EdgeInsets.symmetric(
              vertical: getProportionateScreenHeight(5.0),
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
