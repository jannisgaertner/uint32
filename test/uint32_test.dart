import 'package:test/test.dart';
import 'package:uint32/uint32.dart';

void main() {
  group('UInt32 Overflow', () {
    test('Addition overflow wraps around', () {
      final maxUInt32 = UInt32(0xFFFFFFFF);
      final one = UInt32(1);
      final result = maxUInt32 + one; // This should cause an overflow

      expect(
        // Expecting overflow to wrap around to 0
        result.value,
        BigInt.zero,
      );
    });
  });
}
