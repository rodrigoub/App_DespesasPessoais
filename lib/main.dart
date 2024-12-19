import 'dart:math';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'components/chart.dart';
import '/components/transaction_form.dart';
import '/components/transaction_list.dart';
import '../models/transaction.dart';

void main() {
  runApp(ExpensesApp());
}

class ExpensesApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(),
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
            seedColor: Colors.purple,
            primary: Colors.purple,
            secondary: Colors.white,
            error: Colors.red),
        useMaterial3: true,
        fontFamily: 'Quicksand',
        textTheme: ThemeData.light().textTheme.copyWith(
              titleLarge: TextStyle(
                fontFamily: 'OpenSans',
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
        appBarTheme: AppBarTheme(
          titleTextStyle: TextStyle(
            fontFamily: 'OpenSans',
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.purple,
          ),
          backgroundColor: Colors.black,
        ),
        floatingActionButtonTheme: FloatingActionButtonThemeData(
          backgroundColor: Colors.purple,
        ),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> with WidgetsBindingObserver {
  final List<Transaction> _transaction = [];
  bool _showChart = false;

  @override
 void initState () {
  WidgetsBinding.instance.addObserver(this);
    return super.initState();
  }

  @override
  void didChangeAppLifecycleState (AppLifecycleState State) {
    print(State);
    
  }

@override
 void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    return super.dispose();
  }  

  List<Transaction> get _recentTransactions {
    return _transaction.where((tr) {
      return tr.date.isAfter(DateTime.now().subtract(
        Duration(days: 7),
      ));
    }).toList();
  }

  _addNewTransaction(String title, double value, DateTime date) {
    final newTransaction = Transaction(
        id: Random().nextDouble().toString(),
        title: title,
        value: value,
        date: date);
    setState(() {
      _transaction.add(newTransaction);
    });
    Navigator.of(context).pop();
  }

  _removeTransaction(String id) {
    setState(() {
      _transaction.removeWhere(
        (tr) => tr.id == id,
      );
    });
  }

  abrirtransactionFormModal(BuildContext context) {
    showModalBottomSheet(
        context: context,
        isScrollControlled: true,
        builder: (_) {
          return TransactionForm(_addNewTransaction);
        });
  }

  Widget _getIconButton(IconData icon, Function() fnc, {Color? color}) {
    return Platform.isIOS
        ? GestureDetector(
            child: Icon(
              icon,
              color: color,
            ),
            onTap: fnc,
          )
        : IconButton(
            icon: Icon(
              icon,
              color: color,
            ),
            onPressed: fnc,
          );
  }

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    bool isLandscape = mediaQuery.orientation == Orientation.landscape;

    final iconList = Platform.isIOS ? CupertinoIcons.refresh : Icons.list;
    final iconChart = Platform.isIOS ? CupertinoIcons.refresh : Icons.pie_chart;

    final actions = [
      if (isLandscape)
        _getIconButton(
          _showChart ? iconList : iconChart,
          color: Theme.of(context).colorScheme.primary,
          () {
            setState(() {
              _showChart = !_showChart;
            });
          },
        ),
      _getIconButton(
        Platform.isIOS ? CupertinoIcons.add : Icons.add,
        color: Theme.of(context).colorScheme.primary,
        () => abrirtransactionFormModal(context),
      ),
    ];

    final appBar = AppBar(
      centerTitle: true,
      title: Text('Despesas Pessoais'),
      backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
      actions: actions,
    );

    final availableHeight = mediaQuery.size.height -
        appBar.preferredSize.height -
        mediaQuery.padding.top;

    final bodyPage = SafeArea(
      child: SingleChildScrollView(
        child: Column(
          children: [
            // if (isLandscape)
            //   Row(
            //     mainAxisAlignment: MainAxisAlignment.center,
            //     children: [
            //       Text('Exibir Gráfico'),
            //       Switch.adaptive(
            //         activeColor: Theme.of(context).colorScheme.primary,
            //         value: _showChart,
            //         onChanged: (value) {
            //           setState(() {
            //             _showChart = value;
            //           });
            //         },
            //       ),
            //     ],
            //   ),
            if (!isLandscape || _showChart)
              Container(
                height: availableHeight * (isLandscape ? 0.7 : 0.25),
                child: Chart(_recentTransactions),
              ),
            if (!_showChart || !isLandscape)
              Container(
                height: availableHeight * (isLandscape ? 1 : 0.6),
                child: TransactionList(_transaction, _removeTransaction),
              ),
          ],
        ),
      ),
    );

    return Platform.isIOS
        ? CupertinoPageScaffold(
            navigationBar: CupertinoNavigationBar(
              middle: Text('Despesas Pessoais'),
              trailing: Row(mainAxisSize: MainAxisSize.min, children: actions),
            ),
            child: bodyPage,
          )
        : Scaffold(
            appBar: appBar,
            body: bodyPage,
            floatingActionButton: FloatingActionButton(
              child: Icon(Icons.add),
              onPressed: () => abrirtransactionFormModal(context),
              backgroundColor:
                  Theme.of(context).floatingActionButtonTheme.backgroundColor,
            ),
            floatingActionButtonLocation:
                FloatingActionButtonLocation.centerFloat,
          );
  }
}
