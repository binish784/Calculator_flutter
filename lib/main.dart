import 'package:flutter/material.dart';
import './pages/calculator.dart';

void main(){
  return runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    title: "Calculator App",
    home: new Calculator(),
  ));
}