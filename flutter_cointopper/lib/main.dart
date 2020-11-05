import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_cointopper/bloc/top_coin_bloc/top_coin_bloc.dart';
import 'package:flutter_cointopper/repository/coin_topper_repository.dart';
import 'package:flutter_cointopper/screens/dashboard.dart';

import 'bloc/currency_bloc/dashboard_bloc.dart';
import 'bloc/currency_bloc/dashboard_event.dart';
import 'bloc/top_coin_bloc/top_coin_event.dart';

void main() {
  runApp(
      // MultiBlocProvider(
      // providers: [
      //   BlocProvider<CurrencyBloc>(
      //     create: (context) {
      //       return CurrencyBloc(
      //         coinRepository: CoinTopperRepository(),
      //       )..add(LoadCurrencyList());
      //     },
      //   ),
      //   BlocProvider<TopCoinsBloc>(
      //     create: (context) {
      //       return TopCoinsBloc(
      //         coinRepository: CoinTopperRepository(),
      //       )..add(LoadTopCoins());
      //     },
      //   ),
      MultiBlocProvider(
    providers: [
      BlocProvider<CurrencyBloc>(
          create: (BuildContext context) =>
              CurrencyBloc(coinRepository: CoinTopperRepository())
                ..add(LoadCurrencyList())),
      BlocProvider<TopCoinsBloc>(
        create: (BuildContext context) => TopCoinsBloc(
          coinRepository: CoinTopperRepository(),
        )..add(LoadTopCoins()),
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
