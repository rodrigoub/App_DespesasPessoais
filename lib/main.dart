import 'package:flutter/material.dart';

void main () {
  runApp(ExpensesApp());
} 
  
class ExpensesApp extends StatelessWidget{

@override
  Widget build(BuildContext Context)  {
    
    return MaterialApp(
   home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text('Despesas Pessoais'),
        ),
        backgroundColor: const Color.fromARGB(255, 154, 14, 179),
      ),
      body: Column(
        children: [
          Container(
            width: double.infinity,
            child: Card(
              child: Text('Gráfico'),
              elevation: 5,
            ),
          ),
          Card(
            child: Text('Lista de Transações'),   
          )
        ],
      )
    );
  }
}