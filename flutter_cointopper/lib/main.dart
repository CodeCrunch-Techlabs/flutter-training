import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_cointopper/bloc/dashboard_bloc.dart';
import 'package:flutter_cointopper/bloc/dashboard_event.dart';
import 'package:flutter_cointopper/repository/coin_topper_repository.dart'; 
import 'package:flutter_cointopper/screens/dashboard.dart'; 

void main() {
  runApp(MultiBlocProvider(
    providers: [
      BlocProvider<CurrencyBloc>(
        create: (context) {
          return CurrencyBloc(
            coinRepository: CoinTopperRepository(),
          )..add(LoadCurrencyList());
        },
      ),
    ],
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'CoinTopper',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: Dashboard(),
    );
  }
}
