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

  BigInt _bigInt(dynamic value) {
    if (value is UInt32) {
      return value._value;
    } else if (value is BigInt) {
      return value;
    } else if (value is int) {
      return BigInt.from(value);
    } else {
      throw ArgumentError('Value must be of type UInt32, BigInt or int');
    }
  }

  BigInt get value => _value;

  int get intValue => _value.toInt();

  UInt32 operator +(dynamic other) {
    var result = _value + _bigInt(other);
    return UInt32.fromBigInt(result);
  }

  UInt32 operator -(dynamic other) {
    var result = _value - _bigInt(other);
    return UInt32.fromBigInt(result);
  }

  UInt32 operator *(dynamic other) {
    var result = _value * _bigInt(other);
    return UInt32.fromBigInt(result);
  }

  UInt32 operator /(dynamic other) {
    var result = _value ~/ _bigInt(other);
    return UInt32.fromBigInt(result);
  }

  UInt32 operator %(dynamic other) {
    var result = _value % _bigInt(other);
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

  bool operator <(UInt32 other) => _value < other._value;

  bool operator <=(UInt32 other) => _value <= other._value;

  bool operator >(UInt32 other) => _value > other._value;

  bool operator >=(UInt32 other) => _value >= other._value;

  @override
  bool operator ==(Object other) {
    if (other is UInt32) {
      return _value == other._value;
    }
    return false;
  }

  @override
  String toString() => _value.toString();

  @override
  int get hashCode => _value.hashCode;
}
