import 'dart:io';

import "src/Number.dart";

void main() {
  String inNumber;
  int inNotation, outNotation;

  print("Enter the number: ");
  inNumber = stdin.readLineSync()!;

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
