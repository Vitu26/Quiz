import 'package:flutter/material.dart';
import './main.dart';

class Resposta extends StatelessWidget {
  final String resposta;

  //função para responder 
  final void Function() onSelect;


  Resposta(this.resposta, this.onSelect, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.all(10),
      child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.blue,
          ),
          child: Text(
            resposta,
            style: TextStyle(color: Colors.white),
          ),
          onPressed: onSelect),
    );
  }
}
