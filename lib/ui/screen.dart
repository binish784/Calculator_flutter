import 'package:flutter/material.dart';

class Screen extends StatelessWidget {
  

  String textDisplayed;
  String equation;
  Screen(this.textDisplayed,this.equation);
  
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.blueGrey,
      child:Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
              Container(
              padding: EdgeInsets.only(top: 20,right: 20),
              child: Text(this.equation,style: TextStyle(color: Colors.white,fontSize: 20),),
                ),
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              Container(
                padding: EdgeInsets.symmetric(horizontal: 30, vertical: 50),
                child: Text((textDisplayed).toString(),style: TextStyle(fontSize: 25,color: Colors.white),),
              ),
],
            ),
        ]),
    );
  }
}