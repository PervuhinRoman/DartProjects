import 'dart:io';

import "src/Number.dart";

void main() {
  bool isDot = false;
  String inNumber;
  int inNotation, outNotation;

  print("Enter the number: ");
  inNumber = stdin.readLineSync()!;

  for(int i = 0; i < inNumber.length; i++){
    if(inNumber[i] == "."){
      isDot = true;
    }
  }

  if(!isDot){
    inNumber += ".0";
    print(inNumber);
  }

  print("Enter the notation: ");
  inNotation = int.parse(stdin.readLineSync()!);

  if(Number.isAvailable(inNumber, inNotation)){
    Number num = new Number(inNumber, inNotation);
    num.setAccuracy(8);
    num.display();

    print("Enter the new (out) notation: ");
    outNotation = int.parse(stdin.readLineSync()!);

    num.toNotation(outNotation).display();
  } else {
    print("Incorrect input!");
  }
}