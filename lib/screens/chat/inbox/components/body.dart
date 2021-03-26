import 'package:flutter/material.dart';
import 'package:life_point/models/empleado_model.dart';
import 'package:life_point/models/insumo_model.dart';
import 'package:life_point/provider/empleado/empleado_repository.dart';
import 'package:life_point/provider/insumo/insumo_repository.dart';
import 'package:life_point/screens/chat/inbox/components/widgets/chat_card.dart';

class ChatBody extends StatefulWidget {
  final int idPersona;

  ChatBody({Key key, this.idPersona}) : super(key: key);

  @override
  _ChatBodyState createState() => _ChatBodyState(idPersona);
}

class _ChatBodyState extends State<ChatBody> {
  final int idPersona;
  _ChatBodyState(this.idPersona);
  InsumoRepository _insumoRepository = InsumoRepository();
  EmpleadoRepository _empleadoRepository = EmpleadoRepository();

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 15),
          child: FutureBuilder(
            future: _empleadoRepository.getEmpleado(idPersona),
            builder: (context, AsyncSnapshot<EmpleadoModel> snapshot1) {
              return snapshot1.hasData
                  ? FutureBuilder(
                      future: _insumoRepository.getInsumoEmpleado(idPersona),
                      builder: (context,
                          AsyncSnapshot<List<InsumoModel>> snapshot2) {
                        return snapshot2.hasData
                            ? ChatCard(
                                persona: snapshot1.data.persona,
                                empleado: snapshot1.data,
                                insumos: snapshot2.data,
                              )
                            : CircularProgressIndicator();
                      },
                    )
                  : CircularProgressIndicator();
            },
          )),
    );
  }
}
