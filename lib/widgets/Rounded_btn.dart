import 'package:flutter/material.dart';

class RoundedButton extends StatelessWidget{

  final String btnName;
  final Icon? icon;
  final Color? color;
  final TextStyle? textStyle;
  final VoidCallback? callBack;


  RoundedButton({ required this.btnName,
    this.icon,
    this.color,
    this.textStyle,
    this.callBack}
      );

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: (){
          callBack!();
        },
        child: icon!=null?Row(
          children: [
            icon!,
            Container(width: 6,height: 40,),
            Text("$btnName", style: textStyle)


          ],

        ) :Text("$btnName", style: textStyle),
        style: ElevatedButton.styleFrom(
          backgroundColor: color,
          shadowColor: color,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
              topRight: Radius.circular(21),
              bottomLeft: Radius.circular(21)
              )
          )
        ),

    );

  }
  
}