class MyObject {
  int _value;
  MyObject({
    required int value,
  }) : _value = value;

  void increase() {
    _value++;
  }

  void decrease() {
    _value--;
  }

  int get value => _value;

  set value(int newValue) {
    _value = newValue;
  }
}
