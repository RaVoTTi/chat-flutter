import 'package:chat_flutter/widgets/chat_message.dart';
import 'package:flutter/material.dart';

class ChatPage extends StatefulWidget {
  @override
  _ChatPageState createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> with TickerProviderStateMixin { // permite las animaciones
  final _textController = TextEditingController();
  final _focusNode = FocusNode();

  bool _isWriting = false;
  List<ChatMessage> _messages = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            leading: Container(
              padding: EdgeInsets.only(left: 13, top: 5, bottom: 5),
              child: CircleAvatar(
                maxRadius: 10.0,
                child: Text('Te', style: TextStyle(fontSize: 16)),
              ),
            ),
            // SizedBox(width: 10),
            title: Container(child: Text('Kimberly'))),
        body: Container(
          child: Column(
            children: <Widget>[
              Flexible(
                  child: ListView.builder(
                physics: BouncingScrollPhysics(),
                itemCount: _messages.length,
                itemBuilder: (_, i) => _messages[i],
                reverse: true,
              )),
              Divider(height: 1),
              Container(
                color: Colors.white60,
                child: _inputChat(),
              )
            ],
          ),
        ));
  }

  Widget _inputChat() {
    return SafeArea(
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 8),
        child: Row(children: <Widget>[
          Flexible(
            child: TextField(
              controller: _textController,
              onSubmitted: (_) {},
              onChanged: (texto) {
                setState(() {
                  if (texto.trim().length > 0) {
                    _isWriting = true;
                  } else {
                    _isWriting = false;
                  }
                });
              },
              focusNode: _focusNode,
              decoration: InputDecoration.collapsed(hintText: 'Enviar mensaje'),
            ),
          ),
          Container(
              margin: EdgeInsets.symmetric(horizontal: 4),
              child: IconTheme(
                data: IconThemeData(color: Colors.green[300]),
                child: IconButton(
                  highlightColor: Colors.transparent, // le saca el circulo
                  splashColor: Colors.transparent, // le color del splash
                  icon: Icon(
                    Icons.send,
                  ),
                  onPressed: _isWriting
                      ? () => _handleSumit(_textController
                          .text) // si no le pones () => lo ejecuta de todas formasdssjk
                      : null,
                ),
              ))
        ]),
      ),
    );
  }

  _handleSumit(text) {
    final _newMessage = ChatMessage(uid: '123',text: text, animationController: AnimationController(vsync: this, duration: Duration(milliseconds: 400)),);
    _messages.insert(0, _newMessage);
    _newMessage.animationController.forward();
    print(text);
    _textController.clear();
    _focusNode.requestFocus();
    setState(() {
      _isWriting = false;
    });
  }
  @override
  void dispose() { 
  
  for (ChatMessage _message in _messages) {
    _message.animationController.dispose();
    
  }

  super.dispose();
}

}
