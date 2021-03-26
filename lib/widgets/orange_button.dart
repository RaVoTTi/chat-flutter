import 'package:flutter/material.dart';

class OrangeButton extends StatelessWidget {
  final String title;
  final Function onPressed;
  final Color color;

  const OrangeButton({
    Key key,
    @required this.title,
    @required this.onPressed(),
    @required this.color,
    }) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 50,
      child: ElevatedButton(
          onPressed: this.onPressed,
          child: Text(
            this.title,
            style: TextStyle(color: Color(0xFFeeeeee), fontSize: 20),
          ),
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all<Color>(this.color),
            // textStyle: MaterialStateProperty.all<TextStyle>(TextStyle(fontSize: 20, color:Colors.black87 ), ),
            shape: MaterialStateProperty.all<OutlinedBorder>(StadiumBorder()),
          )),
    );
  }
}
