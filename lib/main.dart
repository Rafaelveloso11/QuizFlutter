import 'package:flutter/material.dart';
import './questionario.dart';
import './resultado.dart';

main() => runApp(PerguntaApp());

class _PerguntaAppState extends State<PerguntaApp> {
  var _perguntaSelecionada = 0;
  var _pontuacaoTotal = 0;
  final _perguntas = const [
    {
      'texto': 'Onde fica o estado de Goiás?',
      'respostas': [
        {'texto': 'Norte', 'pontuacao': 0},
        {'texto': 'Sul', 'pontuacao': 0},
        {'texto': 'Centro-Oeste', 'pontuacao': 10},
        {'texto': 'Sudeste', 'pontuacao': 0},
      ],
    },
    {
      'texto': 'O que pesa mais 1kg de chumbo ou 1kg de algodão?',
      'respostas': [
        {'texto': 'chumbo', 'pontuacao': 0},
        {'texto': 'algodão', 'pontuacao': 0},
        {'texto': 'ambos pesam iguais', 'pontuacao': 10},
        {'texto': 'nenhuma das anteriores', 'pontuacao': 0},
      ],
    },
    {
      'texto': 'Quem é o(a) mais engraçado?',
      'respostas': [
        {'texto': 'Hermes e Renato', 'pontuacao': 10},
        {'texto': 'Tom cavalcante', 'pontuacao': 5},
        {'texto': 'Danilo Gentilli', 'pontuacao': 7},
        {'texto': 'Paulinho Gogó', 'pontuacao': 10},
      ],
    },
    {
      'texto': 'Quem é o rei do futebol?',
      'respostas': [
        {'texto': 'Pelé', 'pontuacao': 10},
        {'texto': 'Maradona', 'pontuacao': 0},
        {'texto': 'Romário', 'pontuacao': 0},
        {'texto': 'Ribamar', 'pontuacao': 10},
      ],
    },
    {
      'texto': 'Quem são os clubes do Rio?',
      'respostas': [
        {'texto': 'Botafogo,Flamengo,Fluminense,Vasco', 'pontuacao': 10},
        {'texto': 'Corinthians,Palmeiras,Santos,São Paulo', 'pontuacao': 0},
        {'texto': 'Grêmio e Internacional', 'pontuacao': 0},
        {'texto': 'Cruzeiro e Atlético MG', 'pontuacao': 0},
      ],
    },
    {
      'texto': 'Quanto é a raíz cúbica de 64?',
      'respostas': [
        {'texto': '4', 'pontuacao': 10},
        {'texto': '8', 'pontuacao': 0},
        {'texto': '16', 'pontuacao': 0},
        {'texto': '32', 'pontuacao': 0},
      ],
    },
    {
      'texto': 'Quem fez a música "Billie jean"?',
      'respostas': [
        {'texto': 'Alexandre Pires', 'pontuacao': 0},
        {'texto': 'Djavan', 'pontuacao': 0},
        {'texto': 'Bruno Mars', 'pontuacao': 0},
        {'texto': 'Michael Jackson', 'pontuacao': 10},
      ],
    },
    {
      'texto': 'Onde fica a Austrália?',
      'respostas': [
        {'texto': 'Asia', 'pontuacao': 0},
        {'texto': 'Europa', 'pontuacao': 0},
        {'texto': 'Oceania', 'pontuacao': 10},
        {'texto': 'América do sul', 'pontuacao': 0},
      ],
    },
    {
      'texto': 'Capital do Egito?',
      'respostas': [
        {'texto': 'Luanda', 'pontuacao': 0},
        {'texto': 'Cairo', 'pontuacao': 10},
        {'texto': 'Bagda', 'pontuacao': 0},
        {'texto': 'Madrid', 'pontuacao': 0},
      ],
    },
    {
      'texto': 'Quem é a rainha do futebol?',
      'respostas': [
        {'texto': 'Andressinha', 'pontuacao': 0},
        {'texto': 'Marta', 'pontuacao': 10},
        {'texto': 'Formiga', 'pontuacao': 0},
        {'texto': 'Hope Solo', 'pontuacao': 0},
      ],
    }
  ];

  void _responder(int pontuacao) {
    if (temPerguntaSelecionada) {
      setState(() {
        _perguntaSelecionada++;
        _pontuacaoTotal += pontuacao;
      });
    }
  }

  void _reiniciarQuestionario() {
    setState(() {
      _perguntaSelecionada = 0;
      _pontuacaoTotal = 0;
    });
  }

  bool get temPerguntaSelecionada {
    return _perguntaSelecionada < _perguntas.length;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Perguntas'),
        ),
        body: temPerguntaSelecionada
            ? Questionario(
                perguntas: _perguntas,
                perguntaSelecionada: _perguntaSelecionada,
                quantoResponder: _responder,
              )
            : Resultado(_pontuacaoTotal, _reiniciarQuestionario),
      ),
    );
  }
}

class PerguntaApp extends StatefulWidget {
  _PerguntaAppState createState() {
    return _PerguntaAppState();
  }
}
