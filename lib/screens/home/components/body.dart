import 'package:flutter/material.dart';
import 'package:life_point/models/person_model.dart';
import 'package:life_point/screens/home/components/widgets/card_presentatio.dart';

class HomeBody extends StatelessWidget {
  const HomeBody({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 15),
        child: ListView.builder(
          itemCount: 8,
          itemBuilder: (context, index) {
            return CardPresentation(
              persona: Persona(
                  name: "Daniel",
                  direction: "Juagador de LOL",
                  email: "danielpro@gmail.com"),
            );
          },
        ),
      ),
    );
  }
}
