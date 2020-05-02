import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  // Roda o app a partir de um widget
  runApp(MaterialApp(
    //Esse título é usado apenas Internamente
      title: "Contador de Pessoas",
      //O home é a tela inicial do app, no caso uma tela em branco
      //home: Container(color: Colors.white,)
      //Abaixo é o widget de coluna que permite um item
      //acima do outro com um texto como item filho
      home: Home() ,
  ), );
}


class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _people = 0;
  String _infoText = "Pode Entrar";

  void _changePeople(int delta){
    //Ele atualiza na tela o valor da variavel sem precisar recarregar a tela Inteira, lembra o Ajax
    setState(() {
      _people += delta;
      if(_people >= 20)
        _infoText = "Capacidade Maxima Atingida";
      else if (_people < 0)
        _infoText = "Oq c ta fazendo ? Tem menos que 0 pessoas ai";
      else
        _infoText = "Pode Entrar";
    });

  }
  @override
  Widget build(BuildContext context) {
    return Stack(
        children: <Widget>[
          Image.asset("images/original.jpg",fit: BoxFit.cover, height: 10000,),
          Column(
            //Alinhamento na coluna
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                "Pessoas: $_people",
                style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold,decoration: TextDecoration.none),
              ),
              Row(
                //Alinhamento da Linha
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.all(10),
                    child: FlatButton(
                      //O parametro Child permite apenas um widget no flatbutton
                      child: Text(
                        "+1",
                        style: TextStyle(fontSize: 40, color: Colors.white),
                      ),
                      onPressed: () {
                        _changePeople(1);
                      },
                    ),
                  ),
                  Padding(
                      padding: EdgeInsets.all(10),
                      child: FlatButton(
                        //O parametro Child permite apenas um widget no flatbutton
                        child: Text(
                          "-1",
                          style: TextStyle(fontSize: 40, color: Colors.white),
                        ),
                        onPressed: () {
                          _changePeople(-1);
                        },
                      )
                  ),

                ],
              ),
              Text(_infoText,
                  style: TextStyle(
                      color: Colors.white,
                      fontStyle: FontStyle.italic,
                      fontSize: 30, decoration: TextDecoration.none))
            ],
          )]
    );
  }
}
