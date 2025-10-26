class MineSweeperBox {
  bool isOpened;
  int _value; // -1 for mine, 0–8 for number of adjacent mines

  MineSweeperBox(this._value, {this.isOpened = false});

  bool get isMine => _value < 0;

  int? get value => isOpened ? _value : null;
}
