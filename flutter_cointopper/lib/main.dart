import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_cointopper/bloc/coin_details_bloc/coin_details_bloc.dart';
import 'package:flutter_cointopper/bloc/coin_details_bloc/coin_details_event.dart';
import 'package:flutter_cointopper/bloc/coin_list_bloc/coin_list_bloc.dart';
import 'package:flutter_cointopper/bloc/coin_list_bloc/coin_list_event.dart';
import 'package:flutter_cointopper/bloc/global_data_bloc/global_data_bloc.dart';
import 'package:flutter_cointopper/bloc/global_data_bloc/global_data_event.dart';
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
      BlocProvider<CoinListBloc>(
        create: (BuildContext context) => CoinListBloc(
          coinRepository: CoinTopperRepository(),
        )..add(LoadCoinList()),
      ),
      BlocProvider<GlobalDataBloc>(
        create: (BuildContext context) => GlobalDataBloc(
          coinRepository: CoinTopperRepository(),
        )..add(LoadGlobalData()),
      ),
      BlocProvider<CoinDetailsBloc>(
        create: (BuildContext context) => CoinDetailsBloc(
          coinRepository: CoinTopperRepository(),
        )..add(LoadCoinDetails("")),
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
