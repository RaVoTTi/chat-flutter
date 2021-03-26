import 'package:flutter/material.dart';

class Labels extends StatelessWidget {
  final String ruta;
  final String title;
  final String subtitle;

  const Labels({
    Key key,
    @required this.ruta,
    @required this.title,
    this.subtitle = '',
    
    }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(children: <Widget>[
        Text(
          this.subtitle,
          style: TextStyle(
              color: Colors.black54, fontSize: 15, fontWeight: FontWeight.w300),
        ),
        GestureDetector(
          onTap: (){
            Navigator.pushReplacementNamed(context, this.ruta);
          },
          child: Text(this.title,
              style: TextStyle(
                  color: Colors.orange[600],
                  fontSize: 18,
                  fontWeight: FontWeight.bold)),
        ),
      ]),
    );
  }
}
class Conditions extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        child: Text(
      'Terminos y condiciones',
      style: TextStyle(
          color: Colors.black54, fontSize: 15, fontWeight: FontWeight.w300),
    ));
  }
}