import "dart:math";

class Number {
  String _value;
  int _notation;

  Number(this._value, this._notation);

  Number toNotation(int outNotation){
    num inNumber = _toDecimalNotation();
    String outNumber = "";

    while(inNumber > 0){
      outNumber += (inNumber % outNotation).toString();
      inNumber = inNumber ~/ outNotation;
    }

    outNumber = String.fromCharCodes(outNumber.codeUnits.reversed);

    return new Number(outNumber, outNotation);
  }

  num _toDecimalNotation(){
    num _decimalNumber = 0;

    for(int i = 0; i < _value.length; i++){
      _decimalNumber += (_getItemElement(_value[i]) * pow(_notation, _value.length - (i + 1)));
    }

    return _decimalNumber;
  }

  int _getItemElement(String item){
    int itemElement = 0;

    if(item.codeUnitAt(0) >= 48 && item.codeUnitAt(0) <= 57){
      itemElement = item.codeUnitAt(0) - 48;
    } else if (item.codeUnitAt(0) >= 65 && item.codeUnitAt(0) <= (65 - 1 + (_notation - 10))) {
      itemElement = item.codeUnitAt(0) - 55;
    }

    return itemElement;
  }

  String getValue() => _value;
  int getNotation() => _notation;

  void display(){
    print("$_value ($_notation)");
  }

  static bool isAvailable(String value, int notation){
    bool answer = false;
    for(int i = 0; i < value.length; i++){
      if((value[i].codeUnitAt(0) >= 48 && value[i].codeUnitAt(0) <= 57) || (value[i].codeUnitAt(0) >= 65 && value[i].codeUnitAt(0) <= (65 - 1 + (notation - 10)))){
        answer = true;
      } else {
        answer = false;
      }
    }

    return answer;
  }
}