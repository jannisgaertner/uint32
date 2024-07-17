const int _bits = 32;

class UInt32 {
  BigInt _value;

  static BigInt _maxValue = BigInt.from(2).pow(_bits);

  UInt32(int value) : _value = BigInt.from(value) {
    _overflow();
  }

  UInt32.fromBigInt(BigInt value) : _value = value {
    _overflow();
  }

  void _overflow() {
    while (_value < BigInt.zero) {
      _value += _maxValue;
    }
    _value = _value % _maxValue;
    _value.toUnsigned(_bits);
  }

  BigInt get value => _value;

  @override
  String toString() => _value.toString();

  UInt32 operator +(UInt32 other) {
    var result = _value + other._value;
    return UInt32.fromBigInt(result);
  }

  UInt32 operator -(UInt32 other) {
    var result = _value - other._value;
    return UInt32.fromBigInt(result);
  }

  UInt32 operator *(UInt32 other) {
    var result = _value * other._value;
    return UInt32.fromBigInt(result);
  }

  UInt32 operator /(UInt32 other) {
    var result = _value ~/ other._value;
    return UInt32.fromBigInt(result);
  }

  UInt32 operator %(UInt32 other) {
    var result = _value % other._value;
    return UInt32.fromBigInt(result);
  }

  UInt32 operator &(UInt32 other) {
    var result = _value & other._value;
    return UInt32.fromBigInt(result);
  }

  UInt32 operator |(UInt32 other) {
    var result = _value | other._value;
    return UInt32.fromBigInt(result);
  }

  UInt32 operator ^(UInt32 other) {
    var result = _value ^ other._value;
    return UInt32.fromBigInt(result);
  }

  UInt32 operator ~() {
    var result = ~_value;
    return UInt32.fromBigInt(result);
  }

  UInt32 operator <<(int shiftAmount) {
    var result = _value << shiftAmount;
    return UInt32.fromBigInt(result);
  }

  UInt32 operator >>(int shiftAmount) {
    var result = _value >> shiftAmount;
    return UInt32.fromBigInt(result);
  }

  // <<=
  UInt32 shiftLeftEquals(int shift) {
    var result = (_value << shift);
    return UInt32.fromBigInt(result);
  }

  // >>=
  UInt32 shiftRightEquals(int shift) {
    var result = _value >> shift;
    return UInt32.fromBigInt(result);
  }

  @override
  bool operator ==(Object other) {
    if (other is UInt32) {
      return _value == other._value;
    }
    return false;
  }

  bool operator <(UInt32 other) => _value < other._value;

  bool operator <=(UInt32 other) => _value <= other._value;

  bool operator >(UInt32 other) => _value > other._value;

  bool operator >=(UInt32 other) => _value >= other._value;

  @override
  int get hashCode => _value.hashCode;
}
