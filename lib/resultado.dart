import 'package:flutter/material.dart';

class Resultado extends StatelessWidget {
  final int pontuacao;
  final void Function() quandoReiniciarQuestionario;

  Resultado(this.pontuacao, this.quandoReiniciarQuestionario);

  String get fraseResultado {
    if (pontuacao < 50) {
      return '$pontuacao / 100 \n Que pena... precisa melhorar!';
    } else if (pontuacao < 70) {
      return '$pontuacao / 100 \n Não foi tão mal!';
    } else if (pontuacao < 80) {
      return '$pontuacao / 100 \n Muito bom!!!!';
    } else {
      return '$pontuacao / 100 \n Você Sabe tudo!!! parabéns!!!!!!!!!';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Center(
          child: Text(fraseResultado,
              style: TextStyle(fontSize: 28), textAlign: TextAlign.center),
        ),
        FlatButton(
          child: Text(
            'Reiniciar?',
            style: TextStyle(fontSize: 18),
          ),
          textColor: Colors.blue,
          onPressed: quandoReiniciarQuestionario,
        )
      ],
    );
  }
}
