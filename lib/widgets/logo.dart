import 'package:flutter/material.dart';

class Logo extends StatelessWidget {
  final String title;

  const Logo({
    Key key,
    @required this.title
    }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
          width: 200,
          child: Column(
            children: [
              Image(
                image: AssetImage('assets/logo.png'),
              ),
              SizedBox(height: 20),
              Text(
                this.title,
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.w900),
              ),
            ],
          )),
    );
  }
}