import 'dart:math';
import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
/*
  Stateless -> Widgets que não podem ser alterados (Constantes)
  Stateful -> Widgets que podem ser alterados (Variáveis)
*/

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: true,
    home: HomeStateful(),
  )); // runApp
} // Main

//
class HomeStateful extends StatefulWidget {
  const HomeStateful({Key? key}) : super(key: key);
  @override
  //_HomeStatefulState createState() => _HomeStatefulState();
  State<HomeStateful> createState() => _HomeStatefulState();
}

// Uma instância de Stateless
//class Home extends StatelessWidget {
class _HomeStatefulState extends State<HomeStateful> {
  static List<String> frases = [
    "A persistência é o caminho do êxito.",
    "A vantagem de ter péssima memória é divertir-se muitas vezes com as mesmas coisas boas como se fosse a primeira vez",
    "As convicções são inimigas mais perigosas da verdade do que as mentiras.",
    "Não há fatos eternos, como não há verdades absolutas.",
    "Logo que, numa inovação, nos mostram alguma coisa de antigo, ficamos sossegados.",
    "É pelas próprias virtudes que se é mais bem castigado."
  ];
  static Map msgs = {
    "titulo": "Frases do Dia v1.0.0",
    "btnNovaFrase": "Nova Frase",
    "rodaPe1": "CopyRigth '2021",
    "rodaPe2": "Vinicius Costa Pinto",
  };
  static int indice = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          msgs["titulo"],
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.cyanAccent,
      ),
      body: Container(
          width: double.infinity,
          decoration: BoxDecoration(border: Border.all()),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.all(3),
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border.all(width: 3, color: Colors.deepPurple),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Image.asset(
                      'images/logo.png',
                      fit: BoxFit.contain,
                      alignment: Alignment.center,
                    ),
                  ),
                ),
                Text(frases[indice],
                    textAlign: TextAlign.center,
                    style: TextStyle(decorationThickness: 11)),
                ElevatedButton(
                    onPressed: () => setState(
                        () => indice = Random().nextInt(frases.length)),
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all<Color>(
                          Colors.deepPurpleAccent),
                      visualDensity: VisualDensity(horizontal: 3, vertical: 4),
                      shadowColor:
                          MaterialStateProperty.all<Color>(Colors.black12),
                    ),
                    child: Text(
                      msgs["btnNovaFrase"],
                      textAlign: TextAlign.start,
                      textScaleFactor: 1.5,
                      style: TextStyle(
                        color: Colors.deepOrangeAccent,
                        height: 1.5,
                        fontSize: 19,
                      ),
                    )),
              ])),
      bottomNavigationBar: BottomAppBar(
        color: Colors.teal,
        child: Padding(
            padding: EdgeInsets.all(16),
            child: Row(
              children: <Widget>[
                Text(
                  msgs["rodaPe1"],
                  textAlign: TextAlign.center,
                ),
                Text(
                  msgs["rodaPe2"],
                  textAlign: TextAlign.center,
                )
              ],
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
            )),
      ),
    );
  }
}
