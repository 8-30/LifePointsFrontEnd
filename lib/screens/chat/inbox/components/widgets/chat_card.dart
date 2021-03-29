import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:life_point/models/mensaje_model.dart';
import 'package:life_point/models/person_model.dart';
import 'package:life_point/provider/mensaje/mensaje_repository.dart';

class ChatCard extends StatefulWidget {
  final PersonaModel persona;
  final int cliente;
  final int idInbox;
  final List<MensajeModel> mensajes;
  ChatCard({
    Key key,
    this.persona,
    this.cliente,
    this.idInbox,
    this.mensajes,
  }) : super(key: key);
  @override
  State createState() =>
      new ChatWindow(this.mensajes, this.idInbox, this.cliente, this.persona);
}

class ChatWindow extends State<ChatCard> with TickerProviderStateMixin {
  MensajeRepository _mensajeRepository = MensajeRepository();
  List<MensajeModel> mensajes;
  PersonaModel persona;
  int idInbox, cliente;

  List<Msg> _messages = <Msg>[];
  final TextEditingController _textController = new TextEditingController();
  bool _isWriting = false;
  ChatWindow(this.mensajes, this.idInbox, this.cliente, this.persona);

  @override
  Widget build(BuildContext ctx) {
    _cargarMsg(idInbox);
    return new Scaffold(
      body: new Column(children: <Widget>[
        new Flexible(
            child: new ListView.builder(
          itemBuilder: (_, int index) => _messages[index],
          itemCount: _messages.length,
          reverse: true,
          padding: new EdgeInsets.all(6.0),
        )),
        new Divider(height: 1.0),
        new Container(
          child: _buildComposer(),
          decoration: new BoxDecoration(color: Theme.of(ctx).cardColor),
        ),
      ]),
    );
  }

  Widget _buildComposer() {
    return new IconTheme(
      data: new IconThemeData(color: Theme.of(context).accentColor),
      child: new Container(
          margin: const EdgeInsets.symmetric(horizontal: 9.0),
          child: new Row(
            children: <Widget>[
              new Flexible(
                child: new TextField(
                  controller: _textController,
                  onChanged: (String txt) {
                    setState(() {
                      _isWriting = txt.length > 0;
                    });
                  },
                  onSubmitted: _submitMsg,
                  decoration: new InputDecoration.collapsed(
                      hintText: "Escribe algo..."),
                ),
              ),
              new Container(
                  margin: new EdgeInsets.symmetric(horizontal: 3.0),
                  child: Theme.of(context).platform == TargetPlatform.iOS
                      ? new CupertinoButton(
                          child: new Text("Submit"),
                          onPressed: _isWriting
                              ? () => _submitMsg(_textController.text)
                              : null)
                      : new IconButton(
                          icon: new Icon(Icons.message),
                          onPressed: _isWriting
                              ? () => _submitMsg(_textController.text)
                              : null,
                        )),
            ],
          ),
          decoration: Theme.of(context).platform == TargetPlatform.iOS
              ? new BoxDecoration(
                  border: new Border(top: new BorderSide(color: Colors.brown)))
              : null),
    );
  }

  void _submitMsg(String txt) {
    _textController.clear();
    setState(() {
      _isWriting = false;
    });
    Msg msg = new Msg(
      emisor: "Usuario",
      enviado: true,
      txt: txt,
      animationController: new AnimationController(
          vsync: this, duration: new Duration(milliseconds: 800)),
    );
    setState(() {
      _messages.insert(0, msg);
    });
    msg.animationController.forward();
    _mensajeRepository.postMensaje(txt, idInbox, cliente);
  }

  _cargarMsg(int id) {
    String emisor = "Usuario";
    bool enviado = true;
    if (_messages.length == 0) {
      mensajes.forEach((element) {
        if (element.idEmisor == persona.idPersona) {
          emisor = persona.nombre;
          enviado = false;
        } else {
          emisor = "Usuario";
          enviado = true;
        }
        print(emisor);
        print(element.texto);
        Msg msg = new Msg(
          enviado: enviado,
          emisor: emisor,
          txt: element.texto,
          animationController: new AnimationController(
              vsync: this, duration: new Duration(milliseconds: 800)),
        );
        setState(() {
          _messages.insert(0, msg);
        });
        msg.animationController.forward();
      });
    }
  }

  @override
  void dispose() {
    for (Msg msg in _messages) {
      msg.animationController.dispose();
    }
    super.dispose();
  }
}

class Msg extends StatelessWidget {
  Msg({this.txt, this.animationController, this.emisor, this.enviado});
  final String txt;
  final AnimationController animationController;
  final String emisor;
  final bool enviado;

  @override
  Widget build(BuildContext ctx) {
    var color = Colors.red;
    if (enviado) {
      color = Colors.green;
    }
    return new SizeTransition(
      sizeFactor: new CurvedAnimation(
          parent: animationController, curve: Curves.easeOut),
      axisAlignment: 0.0,
      child: new Container(
        margin: const EdgeInsets.symmetric(vertical: 8.0),
        child: new Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            if (!enviado)
              new Container(
                margin: const EdgeInsets.only(right: 18.0),
                child: new CircleAvatar(
                  child: new Text(emisor[0]),
                  backgroundColor: color,
                ),
              ),
            if (!enviado)
              new Expanded(
                child: new Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    // ignore: deprecated_member_use
                    new Text(emisor, style: Theme.of(ctx).textTheme.subhead),
                    new Container(
                      margin: const EdgeInsets.only(top: 6.0),
                      child: new Text(txt),
                    ),
                  ],
                ),
              ),
            if (enviado)
              new Expanded(
                child: new Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: <Widget>[
                    // ignore: deprecated_member_use
                    new Text(emisor, style: Theme.of(ctx).textTheme.subhead),
                    new Container(
                      margin: const EdgeInsets.only(top: 6.0),
                      child: new Text(txt),
                    ),
                  ],
                ),
              ),
            if (enviado)
              new Container(
                margin: const EdgeInsets.only(left: 18.0),
                child: new CircleAvatar(
                  child: new Text(emisor[0]),
                  backgroundColor: color,
                ),
              ),
          ],
        ),
      ),
    );
  }
}
