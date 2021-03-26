import 'package:chat_flutter/widgets/labels_conditions.dart';
import 'package:chat_flutter/widgets/logo.dart';
import 'package:chat_flutter/widgets/orange_button.dart';
import 'package:flutter/material.dart';

import 'package:chat_flutter/widgets/custom_inputs.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFeeeeee),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Logo(title: 'MENSAJERIA',),
          _Form(),
          Labels(ruta: 'register', title: 'Crea una nueva!', subtitle: 'No tienes cuenta',),
          Conditions(),
        ],
      ),
    );
  }
}

// LOGO CON SU TITULO

// TEXT INPUTS
class _Form extends StatefulWidget {
  @override
  _FormState createState() => _FormState();
}

//
class _FormState extends State<_Form> {
  final emailCtrl = TextEditingController();
  final passCtrl = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Column(children: <Widget>[
        CustomInput(
          icon: Icons.email_outlined,
          placeHolder: 'Email',
          textController: emailCtrl,
          keyboardType: TextInputType.emailAddress,
        ),
        SizedBox(height: 15),
        CustomInput(
          icon: Icons.security,
          placeHolder: 'Password',
          textController: passCtrl,
          isPassword: true,
        ),
        SizedBox(height: 15),
        OrangeButton(
          onPressed: () {
            print(emailCtrl.text);
            print(passCtrl.text);
          },
          title: 'INICIAR SESION',
          color: Colors.orange[600],
          ),
        
      ]),
    );
  }
}

// LABELS
 