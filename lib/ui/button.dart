import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  
  final String _text;
  final VoidCallback _ontap;
  final Color bgcolor;
  final Color txtcolor;
  final double fsize;
  Button(this._text,this._ontap,{this.fsize=25,this.bgcolor:Colors.white,this.txtcolor:Colors.black});

  @override
  Widget build(BuildContext context) {
    return Expanded(                        
      child: Container(
        decoration: BoxDecoration(
          color: bgcolor,
          border: Border(left: BorderSide(color: Colors.black,width: 2),bottom: BorderSide(color: Colors.black,width: 2)),
        ),
        child: InkWell(
          child: Center(
            child: Container(
                padding: EdgeInsets.symmetric(vertical: 18.5),
                child: Text(_text,style: TextStyle(fontSize: this.fsize,color: this.txtcolor),)),
          ),
          onTap: () {
            _ontap();
          },
        ),
      ),
    );
  }
}