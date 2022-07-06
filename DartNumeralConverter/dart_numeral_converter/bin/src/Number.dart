import "dart:math";

class Number {
  String _value = "0.0";
  String? _wholePart;
  String? _fractionalPart;
  int _notation = 0;
  int _accuracy = 8;

  Number(String value, int notation) {
    this._value = value;
    this._notation = notation;
    this._wholePart = _value.split(".")[0];
    this._fractionalPart = _value.split(".")[1];
  }

  String getValue() => _value;
  int getNotation() => _notation;
  String? getWholePart() => _wholePart;
  String? getFractionalPart() => _fractionalPart;

  void setAccuracy(int accuracy) => this._accuracy = accuracy;

  Number toNotation(int outNotation){
    num inWholePart = _toDecimalNotation();
    num inFractionalPart = _fractionalPartToDecimalNotation();
    String outNumber = "";

    if(inWholePart == 0){
      outNumber  += "0";
    }

    while(inWholePart > 0){
      if(inWholePart % outNotation >= 10){
        outNumber += String.fromCharCode((inWholePart % outNotation + 55).toInt());
      } else {
        outNumber += (inWholePart % outNotation).toString();
      }

      inWholePart = inWholePart ~/ outNotation;
    }

    outNumber = String.fromCharCodes(outNumber.codeUnits.reversed);
    outNumber += ".";

    for(int i = 0; i < _accuracy && inFractionalPart % 1 != 0; i++){
      if((inFractionalPart * outNotation) ~/ 1 >= 10){
        outNumber += String.fromCharCode((inFractionalPart * outNotation) ~/ 1 + 55);
      } else {
        outNumber += ((inFractionalPart * outNotation) ~/ 1).toString();
      }

      inFractionalPart = (inFractionalPart * outNotation) % 1;
    }

    return new Number(outNumber, outNotation);
  }

  num _toDecimalNotation(){
    num _decimalNumber = 0;

    for(int i = 0; i < _wholePart!.length; i++){
      _decimalNumber += (_getItemElement(_value[i]) * pow(_notation, _wholePart!.length - (i + 1)));
    }

    return _decimalNumber;
  }

  num _fractionalPartToDecimalNotation(){
    double _decimalNumber = 0;

    for(int i = 0, e = -1; i < _fractionalPart!.length; i++, e--){
      _decimalNumber += (_getItemElement(_fractionalPart![i]) * pow(_notation, e));
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

  void display(){
    print("$_value ($_notation)");
  }

  static bool isAvailable(String value, int notation){
    bool answer = false;
    if(notation <= 1 || notation > 36){
      answer = false;
    } else {
      answer = true;
    }

    return answer;
  }
}