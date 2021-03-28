import 'package:flutter/material.dart';

class ChatMessage extends StatelessWidget {
  final String text;
  final String uid;
  final AnimationController animationController;
  const ChatMessage({
    Key key,
    @required this.text,
    @required this.uid,
    @required this.animationController,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FadeTransition(
      
      opacity: this.animationController,
      child: SizeTransition(
        sizeFactor: CurvedAnimation(
          curve: Curves.easeOut,
          parent:this.animationController

        ),
        child: Container(
          child: this.uid == '123' ? _myMessage() : _notMyMessage(),
        ),
      ),
    );
  }

  Widget _myMessage() {
    return Align(
      alignment: Alignment.centerRight,
      child: Container(
        padding: EdgeInsets.only(
          right: 15,
          left: 15,
          top: 6,
          bottom: 6,
        ),
        margin: EdgeInsets.only(
          right: 8,
          left: 60,
          top: 6,
          bottom: 6,
        ),
        child: Text(this.text),
        decoration: BoxDecoration(
            color: Colors.green[400], borderRadius: BorderRadius.circular(20)),
      ),
    );
  }

  Widget _notMyMessage() {
    return Align(
      alignment: Alignment.centerLeft,
      child: Container(
        padding: EdgeInsets.only(
          right: 15,
          left: 15,
          top: 6,
          bottom: 6,
        ),
        margin: EdgeInsets.only(
          right: 60,
          left: 8,
          top: 6,
          bottom: 6,
        ),
        child: Text(this.text),
        decoration: BoxDecoration(
            color: Colors.grey, borderRadius: BorderRadius.circular(20)),
      ),
    );
  }
}
