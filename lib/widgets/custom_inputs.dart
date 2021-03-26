import 'package:flutter/material.dart';

class CustomInput extends StatelessWidget {
  final IconData icon;
  final String placeHolder;
  final TextEditingController textController;
  final TextInputType keyboardType;
  final bool isPassword;

  const CustomInput({
      Key key,
      @required this.icon,
      @required this.placeHolder,
      @required this.textController,
      this.keyboardType = TextInputType.text,
      this.isPassword = false,
      })
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.only(top: 5, bottom: 7, left: 30, right: 30),
        height: 50,
        decoration: BoxDecoration(
            color: Color(0xFFeeeeee),
            borderRadius: BorderRadius.all(Radius.circular(30)),
            boxShadow: <BoxShadow>[
              BoxShadow(
                  color: Colors.black87.withOpacity(0.5),
                  offset: Offset(2, 2),
                  blurRadius: 5)
            ]),
        child: TextField(
          controller: this.textController,
          style: TextStyle(fontSize: 20),
          autocorrect: false,
          keyboardType: this.keyboardType,
          obscureText: this.isPassword, // para contrasenas
          decoration: InputDecoration(
            prefixIcon: Icon(this.icon),
            // focusedBorder: InputBorder.none,
            // border: InputBorder.none,
            hintText: this.placeHolder
          ),
        ));
  }
}
