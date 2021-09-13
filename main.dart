import 'dart:math';
import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
/*
  Stateless -> Widgets que não podem ser alterados (Constantes)
  Stateful -> Widgets que podem ser alterados (Variáveis)
*/

void main() {
  runApp(
      MaterialApp(
          debugShowCheckedModeBanner: true,
          home: HomeStateful(),
      )
  ); // runApp
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
  static List <String> frases = [
    "Gratidão não é pagamento... ",
    "Aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
    "Bbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbb",
    "Cccccccccccccccccccccccccccccccccccccccccccc",
    "D d d d d d d d d d d d d d",
    "E e e e e e e e e e e e e e"
  ];
  static Map msgs = {
    "titulo":"Frases do Dia v1.0.0",
    "btnNovaFrase":"Nova Frase",
    "rodaPe1":"Conteúdo Roda Pé 2",
    "rodaPe2":"Conteúdo Roda Pé 1",
  };
  static int indice = 0;
  @override
  Widget build(BuildContext context) {
    return
      Scaffold(
        appBar: AppBar(
          title: Text(
            msgs["titulo"],
            style: TextStyle(
              color: Colors.black
            ) ,
          ),
          backgroundColor: Colors.cyanAccent,
        ),
        body: Container(
            width: double.infinity,
            decoration: BoxDecoration(
              border: Border.all()
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.all(3),
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border.all(
                        width: 3,
                        color: Colors.deepPurple
                      ),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Image.asset(
                      'images/logo.png',
                      fit: BoxFit.contain,
                      alignment: Alignment.center,
                    ),
                  ),
                ),
                Text(
                  frases[indice],
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    decorationThickness: 11
                  )
                ),
                ElevatedButton(
                  onPressed: () =>
                  setState( () =>
                    indice = Random().nextInt(frases.length)
                  ),
                  style: ButtonStyle(
                    backgroundColor:MaterialStateProperty.all<Color>(
                      Colors.deepPurpleAccent
                    ),
                    visualDensity: VisualDensity(horizontal: 3,vertical:4 ),
                    shadowColor: MaterialStateProperty.all<Color>(
                      Colors.black12
                    ),
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
                  )
                ),
              ]
            )
        ),
        bottomNavigationBar:BottomAppBar(
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
              )
          ),
        ),
      );
  }
}

/*
    //debugShowCheckedModeBanner: false,
    title: "Frases do dia",
    //home: Container(color: Colors.blue,),
    home: Container(
      padding: EdgeInsets.fromLTRB(10, 20, 30, 40),
        margin: EdgeInsets.only(top:20,bottom:20),
        decoration: BoxDecoration(
            border: Border.all( width: 1,
                                color: Colors.white
            )
      ),
      //color: Colors.white,
      child: Column(
        children:<Widget> [
          Text("Etiam venenatis odio ut lorem ullamcorper, ",
            textAlign: TextAlign.center,
            style: TextStyle(
               fontSize: 16,
               fontStyle: FontStyle.italic,
               decoration: TextDecoration.none,
               decorationColor: Colors.white,
               color: Colors.blue,
               backgroundColor: Colors.white,
               height: 1.2
            ),
          ),
          Padding(
            padding: EdgeInsets.all(30),
            child: Text(
              "Sub texto do Parágrafo 2",
              style: TextStyle(
                fontSize: 12,
                decoration: TextDecoration.none
              ),
            ),
          ),
          Text("Quisque ultricies erat risus, eu cursus nunc tempor nec. Aenean justo nibh, mollis at consequat non, semper sed neque.",
             textAlign:TextAlign.justify ,
              style: TextStyle(
               fontSize: 16,
               fontStyle: FontStyle.italic,
               decoration: TextDecoration.underline,
               decorationStyle: TextDecorationStyle.solid,
               decorationColor: Colors.teal,
               color: Colors.blue,
               backgroundColor: Colors.white,
               height: 1.2,
               fontWeight: FontWeight.normal
               )
          ),
          Image.asset(
            'images/coffe.jpg',
            fit: BoxFit.fill,

          ),
          ElevatedButton(
              onPressed: () => {
              },
              child: Text(
                "Clique Aqui",
                style: TextStyle(
                  color: Colors.red,
                  decoration: TextDecoration.none
                ),
              ),
              style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color>(Colors.green)
              )
          )
        ],
        mainAxisAlignment: MainAxisAlignment.spaceAround
        //crossAxisAlignment: CrossAxisAlignment.baseline
      )
    ),
  )
  );
}
*/
