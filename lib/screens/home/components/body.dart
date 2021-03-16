import 'package:flutter/material.dart';
import 'package:life_point/models/person_model.dart';
import 'package:life_point/provider/administrado_bloc.dart';
import 'package:life_point/screens/home/components/widgets/card_presentatio.dart';

class HomeBody extends StatefulWidget {
  const HomeBody({Key key}) : super(key: key);

  @override
  _HomeBodyState createState() => _HomeBodyState();
}

class _HomeBodyState extends State<HomeBody> {
  AdministradorBloc administradorBloc = AdministradorBloc();
  @override
  void initState() {
    super.initState();
    administradorBloc.getUser();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 15),
        child: StreamBuilder<PersonaModel>(
            stream: administradorBloc.subject.stream,
            builder: (context, AsyncSnapshot<PersonaModel> snapshot) {
              return snapshot.hasData
                  ? CardPresentation(
                      persona: snapshot.data,
                    )
                  : CircularProgressIndicator();
            }),
      ),
    );
  }
}
