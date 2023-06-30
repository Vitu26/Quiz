import 'package:flutter/material.dart';
import 'components/questionario.dart';
import 'components/resultado.dart';

main() => runApp(const PerguntaApp());

@override
class PerguntaApp extends StatefulWidget {
  const PerguntaApp({super.key});
  @override
  State<PerguntaApp> createState() => _PerguntaAppState();
}

class _PerguntaAppState extends State<PerguntaApp> {
  var _perguntaSelecionada = 0;
  var _pontuacaoTotal = 0;
  final _perguntas = const [
    {
      'texto': 'Qual é a sua cor favorita?',
      'respostas': [
        {'texto': 'Azul', 'pontuacao': 10},
        {'texto': 'Amarelo', 'pontuacao': 5},
        {'texto': 'Verde', 'pontuacao': 3},
        {'texto': 'Vermelho', 'pontuacao': 1},
      ],
    },
    {
      'teto': 'Qual é seu time de futebol?',
      'repostas': [
        {'texto': 'Vasco', 'pontuacao': 10},
        {'texto': 'Flamengo', 'pontuacao': 1},
        {'texto': 'Botafogo', 'pontuacao': 5},
        {'texto': 'Fluminense', 'pontuacao': 3},
      ],
    },
    {
      'texto': 'Qual seu animal favorito?',
      'respostas': [
        {'texto': 'Gato', 'pontuacao': 5},
        {'texto': 'Cachorro', 'pontuacao': 10},
        {'texto': 'Papagaio', 'pontuacao': 3},
        {'texto': 'Peixe', 'pontuacao': 1},
      ],
    },
  ];

  //criando o método pra o botão
  void _responder(int pontuacao) {
    if (temPerguntaSelecionada) {
      setState(() {
        _perguntaSelecionada++;
        _pontuacaoTotal += pontuacao;
      });
    }

    //precisa ter para mudar o estado com stf
  }

  void _reiniciarQuestionario() {
    setState(() {
      _perguntaSelecionada = 0;
      _pontuacaoTotal = 0;
    });
  }

  //método para caso esteja na ultima pergunta e não deixe ir para uma a mais e quebrar o código
  bool get temPerguntaSelecionada {
    return _perguntaSelecionada < _perguntas.length;
  }

  @override
  Widget build(BuildContext context) {
    //fazendo a conversão de lista de strings para lista de maps

    // for (String textoResp in respostas) {
    //   widgets.add(Resposta(textoResp, _responder));
    // }

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Perguntas"),
        ),
        body: temPerguntaSelecionada
            ? Questionario(
                perguntas: _perguntas,
                perguntaSelecionada: _perguntaSelecionada,
                quandoResponder: _responder,
              )
            : Resultado(_pontuacaoTotal, _reiniciarQuestionario),
      ),
    );
  }
}

// import 'package:flutter/material.dart';
// import './questao.dart';
// import './resposta.dart';

// void main() => runApp(const PerguntaApp());

// class _PerguntaAppState extends State<PerguntaApp> {
//   var _perguntaSelecionada = 0;

//   void _responder() {
//     setState(() {
//       _perguntaSelecionada++;
//     });
//   }

//   @override
  // Widget build(BuildContext context) {
    // final perguntas = [
    //   {
    //     'texto': 'Qual é a sua cor favorita?',
    //     'respostas': ['Preto', 'Vermelho', 'Verde', 'Branco'],
    //   },
    //   {
    //     'texto': 'Qual é o seu animal favorito?',
    //     'respostas': ['Coelho', 'Cobra', 'Elefante', 'Leão'],
    //   },
    //   {
    //     'texto': 'Qual é o seu instrutor favorito?',
    //     'respostas': ['Maria', 'João', 'Leo', 'Pedro'],
    //   },
    // ];

  //   List<Widget> respostas = [];

  //   for (String textoResp
  //       in perguntas[_perguntaSelecionada]['respostas'] as List) {
  //     respostas.add(Resposta(textoResp, _responder));
  //   }

//     return MaterialApp(
//       home: Scaffold(
//         appBar: AppBar(
//           title: const Text('Perguntas'),
//         ),
//         body: Column(
//           children: [
//             Questao(perguntas[_perguntaSelecionada]['texto'] as String),
//             ...respostas,
//           ],
//         ),
//       ),
//     );
//   }
// }

// class PerguntaApp extends StatefulWidget {
//   const PerguntaApp({super.key});

//   @override
//   _PerguntaAppState createState() {
//     return _PerguntaAppState();
//   }
// }
