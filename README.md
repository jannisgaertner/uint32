# Uint32 Package

This Dart package provides a `UInt32` class that wraps around Dart's `BigInt` to offer a 32-bit unsigned integer with proper overflow behavior. It's useful for applications that require precise control over integer overflow, such as embedded systems programming, cryptography, and anywhere else 32-bit unsigned integers are needed.

## Features

- **32-bit Unsigned Integers**: Represent integers in the range 0 to 2^32 - 1.
- **Overflow Protection**: Automatically handles overflow using wrap-around behavior, mimicking the behavior of 32-bit unsigned integers in lower-level languages.
- **Bitwise Operations**: Supports common bitwise operations like shift-left (`<<`), shift-right (`>>`), and more, with overflow considerations.
- **Arithmetic Operations**: Supports addition, subtraction, and other arithmetic operations with overflow wrapping.

## Getting started

To start using the `UInt32` package, add it to your `pubspec.yaml` file:

```yaml
dependencies:
  uint32: ^1.0.0
```

Then, run `pub get` to install the package.

## Usage

Here's a simple example of how to use the `UInt32` class:

```dart
import 'package:uint32/uint32.dart';

void main() {
  final a = UInt32(4294967295); // Max value for UInt32
  final b = UInt32(1);
  final result = a + b; // This will overflow and wrap around to 0
  print(result); // Output: 0
}
```
