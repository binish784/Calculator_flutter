import 'package:flutter/material.dart';
import '../ui/button.dart';
import '../ui/screen.dart';

class Calculator extends StatefulWidget {
  @override
  _CalculatorState createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {
  // List<String > numbers= ['1','2','3','4','5','6','7','8','9','0'];
  String equation = '';
  String result = '';
  String operand1 = '';
  String prevOperand2='';
  String operand2 = '';
  String operate = '';

  setOperator(String text) {
    if (this.operand2 == ''){
      // print('-----------First Input : Requesting second operand--------');
      // print("Opertion : " + operand1 + text );
      if(this.equation.length==0){
        updateEquation(this.operand1, text);
      }else{
        changeEquation(this.prevOperand2, text);
      }
      // computeResult(text);
      nextOperation(this.result, text);
    }
    else{
      // print('----------------------------------------');
      // print("operand 2  : " + this.operand2);
      // print("operation : " + this.operate);
      computeResult(text);
      updateEquation(this.operand2, text);
      nextOperation(this.result, text);
      // print("Changed operand 2 : " + this.operand2);
      // print("Changed operand 1 :" + this.operand1);
      // print("Prev Operand 2 : "+ this.prevOperand2);
    }
    this.operate = text;
  }


  equalsOperation(String type){
    computeResult(type);
    nextOperation(this.result, type);
    this.setState((){
      equation='';
    });
  }

  nextOperation(String result,String operateType) {
    this.setState((){
      prevOperand2=operand2;
      operand1 = result;
      operand2 = '';
      operate = operateType;
    });
  }

  updateEquation(String operand, String operate) {
    this.setState(() {
      if(operate=='*' || operate=='/'){
        this.equation='('+this.equation+operand+')'+operate;
      }else{
        this.equation += operand;
        this.equation += operate;
      }
    });
  }

  changeEquation(String operand, String operate) {
    int len = this.equation.length;
    int opeLen=operand.length+1;
    this.setState(() {
      if(operate=='*' || operate=='/'){
        this.equation = '('+this.equation.substring(0, len - opeLen) + operand +')'+ operate;
      }else{
        this.equation = this.equation.substring(0, len - opeLen) + operand + operate;
      }
      this.operate=operate;
    });
  }

  computeResult(String type) {
    // print(this.operand1 + this.operate +  this.operand2 );
    this.setState(() {
      if (operate == '+') {
        try {
          result = (int.parse(operand1) + int.parse(operand2)).toString();
        } catch (e) {
          result = (double.parse(operand1) + double.parse(operand2)).toString();
        }
      }
      if (operate == '-') {
        try {
          result = (int.parse(operand1) - int.parse(operand2)).toString();
        } catch (e) {
          result = (double.parse(operand1) - double.parse(operand2)).toString();
        }
      }
      if (operate == '/') {
        result = (double.parse(operand1) / double.parse(operand2)).toString();
      }
      if (operate == '*') {
        try {
          result = (int.parse(operand1) * int.parse(operand2)).toString();
        } catch (e) {
          result = (double.parse(operand1) * double.parse(operand2)).toString();
        }
      }
    });
  }


  displayScreen(String text) {
    if (operate == '') {
      if(text=='.' && operand1.contains('.')){
        return;
      }
      operand1 = operand1 + text;
      this.setState(() {
        this.operand1 = operand1;
      });
      result = operand1;
    } else {
      if(text=='.' && operand2.contains('.')){
        return;
      }
      operand2 = operand2 + text;
      result = operand2;
      this.setState(() {
        this.operand2 = operand2;
      });
    }
    this.setState(() {
      result = result;
    });
  }

  clearScreen() {
    this.setState(() {
      this.result = '';
      this.operate = '';
      this.equation = '';
      this.operand1 = '';
      this.operand2 = '';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Calculator"),
      ),
      body: Container(
        child: ListView(
          children: <Widget>[
            Screen(this.result, this.equation),
            Container(
              child: Column(
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Button('7', () => {displayScreen('7')}),
                    Button('8', () => {displayScreen('8')}),
                    Button('9', () => {displayScreen('9')}),
                    Button('/', () => {setOperator('/')},bgcolor: Colors.limeAccent,),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Button('4', () => {displayScreen('4')}),
                    Button('5', () => {displayScreen('5')}),
                    Button('6', () => {displayScreen('6')}),
                    Button('+', () => {setOperator('+')},bgcolor: Colors.limeAccent,),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Button('1', () => {displayScreen('1')}),
                    Button('2', () => {displayScreen('2')}),
                    Button('3', () => {displayScreen('3')}),
                    Button('-', () => {setOperator('-')},bgcolor: Colors.limeAccent,),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Button('.', () => {displayScreen('.')}),
                    Button('0', () => {displayScreen('0')}),
                    Button('AC', () => {clearScreen()}),
                    Button('*', () => {setOperator('*')},bgcolor: Colors.limeAccent,),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Button('=', () => {equalsOperation('')},fsize:30,bgcolor: Colors.orangeAccent,),
                  ],
                ),
              ],
            ))
          ],
        ),
      ),
    );
  }
}
