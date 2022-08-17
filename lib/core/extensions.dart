const String kEMPTY = '';
const int kZERO = 0;
const double kZeroDouble = 0.0;
DateTime kDateTimeEmpty = DateTime.parse("1970-01-01 00:00:00");

extension NonNullString on String? {
  String orEmpty() {
    if (this == null) {
      return kEMPTY;
    } else {
      return this!;
    }
  }
}

extension NonNullInteger on int? {
  int orZero() {
    if (this == null) {
      return kZERO;
    } else {
      return this!;
    }
  }
}

extension NonNullDouble on double? {
  double orZeroDouble() {
    if (this == null) {
      return kZeroDouble;
    } else {
      return this!;
    }
  }
}

extension NonNullBool on bool? {
  bool orFalseBool() {
    if (this == null) {
      return false;
    } else {
      return this!;
    }
  }
}

extension NonNullDate on DateTime? {
  DateTime orDateTime() {
    if (this == null) {
      return kDateTimeEmpty;
    } else {
      return this!;
    }
  }
}
