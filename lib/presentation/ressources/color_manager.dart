import 'package:flutter/material.dart';

import '/core/extensions.dart';

class ColorManager {
  final String hashTag = '#';
  static Color primary = Colors.black;
  static Color blue = HexColor.fromHex('#2699FB');
  static Color green = HexColor.fromHex('#148843');
  static Color greenAccent = HexColor.fromHex('#00AE0C');
  static Color grey = HexColor.fromHex('#7E7E7E');
  static Color orangeAccent = HexColor.fromHex('#DB9F5A');
  static Color purple = HexColor.fromHex('#60009F');
  static Color red = HexColor.fromHex('#C22222');
  static Color yellow = HexColor.fromHex('#FFF700');
  // Woocommerce Commande Status - Cancelled
  static Color commandeStatusCancelled = HexColor.fromHex('#777777');
  static Color commandeStatusCancelledBg = HexColor.fromHex('#E5E5E5');
  // Woocommerce Commande Status - Checkout Draft
  static Color commandeStatusCheckoutDraft = HexColor.fromHex('#777777');
  static Color commandeStatusCheckoutDraftBg = HexColor.fromHex('#E5E5E5');
  // Woocommerce Commande Status - Completed
  static Color commandeStatusCompleted = HexColor.fromHex('#2E4453');
  static Color commandeStatusCompletedBg = HexColor.fromHex('#C8D7E1');
  // Woocommerce Commande Status - Failed
  static Color commandeStatusFailed = HexColor.fromHex('#761919');
  static Color commandeStatusFailedBg = HexColor.fromHex('#EBA3A3');
  // Woocommerce Commande Status - On Hold
  static Color commandeStatusOnHold = HexColor.fromHex('#94660C');
  static Color commandeStatusOnHoldBg = HexColor.fromHex('#F8DDA7');
  // Woocommerce Commande Status - Pending
  static Color commandeStatusPending = HexColor.fromHex('#777777');
  static Color commandeStatusPendingBg = HexColor.fromHex('#E5E5E5');
  // Woocommerce Commande Status - Processing
  static Color commandeStatusProcessing = HexColor.fromHex('#5B841B');
  static Color commandeStatusProcessingBg = HexColor.fromHex('#C6E1C6');
  // Woocommerce Commande Status - Refunded
  static Color commandeStatusRefunded = HexColor.fromHex('#777777');
  static Color commandeStatusRefundedBg = HexColor.fromHex('#E5E5E5');
}

extension HexColor on Color {
  static Color fromHex(String hexColorString) {
    String _hexColorString = hexColorString.replaceAll('#', kEMPTY);
    if (_hexColorString.length == 6) {
      _hexColorString = 'FF$_hexColorString';
    }
    return Color(int.parse(_hexColorString, radix: 16));
  }
}
