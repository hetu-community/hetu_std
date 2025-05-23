class Bitwise {
  static int and(List<int> ints) {
    return ints.reduce((a, b) => a & b);
  }

  static int or(List<int> ints) {
    return ints.reduce((a, b) => a | b);
  }

  static int xor(List<int> ints) {
    return ints.reduce((a, b) => a ^ b);
  }

  static int not(int a) {
    return ~a;
  }

  static int leftShift(List<int> ints) {
    return ints.reduce((a, b) => a << b);
  }

  static int rightShift(List<int> ints) {
    return ints.reduce((a, b) => a >> b);
  }

  static int unsignedRightShift(List<int> ints) {
    return ints.reduce((a, b) => a >>> b);
  }
}
