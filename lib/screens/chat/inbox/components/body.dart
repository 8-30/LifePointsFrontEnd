import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:life_point/models/inbox_model.dart';
import 'package:life_point/models/mensaje_model.dart';
import 'package:life_point/models/person_model.dart';
import 'package:life_point/provider/Inbox/inbox_repository.dart';
import 'package:life_point/provider/mensaje/mensaje_repository.dart';
import 'package:life_point/screens/chat/inbox/components/widgets/chat_card.dart';

class ChatBody extends StatefulWidget {
  final PersonaModel persona;

  ChatBody({Key key, this.persona}) : super(key: key);

  @override
  _ChatBodyState createState() => _ChatBodyState(persona);
}

class _ChatBodyState extends State<ChatBody> {
  final PersonaModel persona;
  final usuarioIDStorage = GetStorage();
  int idCliente;
  List<MensajeModel> mensajes;
  _ChatBodyState(this.persona);
  MensajeRepository _mensajeRepository = MensajeRepository();
  InboxRepository _inboxRepository = InboxRepository();

  @override
  void initState() {
    idCliente = usuarioIDStorage.read("usuarioID");
    super.initState();
  }

  Future<void> cargarmensajes() async {
    final inbox = await _inboxRepository.getInboxParticipantes(
        persona.idPersona, idCliente);
    mensajes = await _mensajeRepository.getAllMensajeInbox(inbox.idInbox);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 15),
            child: FutureBuilder(
              future: _inboxRepository.getInboxParticipantes(
                  persona.idPersona, idCliente),
              builder: (context, AsyncSnapshot<InboxModel> snapshot1) {
                return snapshot1.hasData
                    ? FutureBuilder(
                        future: _mensajeRepository
                            .getAllMensajeInbox(snapshot1.data.idInbox),
                        builder: (context,
                            AsyncSnapshot<List<MensajeModel>> snapshot2) {
                          return snapshot2.hasData
                              ? ChatCard(
                                  cliente: idCliente,
                                  persona: persona,
                                  mensajes: snapshot2.data,
                                  idInbox: snapshot1.data.idInbox,
                                )
                              : CircularProgressIndicator();
                        },
                      )
                    : CircularProgressIndicator();
              },
            )));
  }
}
