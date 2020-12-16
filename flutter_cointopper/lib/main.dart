import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_cointopper/bloc/coin_details_bloc/coin_details_bloc.dart';
import 'package:flutter_cointopper/bloc/coin_details_bloc/coin_details_event.dart';
import 'package:flutter_cointopper/bloc/coin_list_bloc/coin_list_bloc.dart';
import 'package:flutter_cointopper/bloc/coin_list_bloc/coin_list_event.dart';
import 'package:flutter_cointopper/bloc/featured_news_bloc/featured_news_bloc.dart';
import 'package:flutter_cointopper/bloc/featured_news_bloc/featured_news_event.dart';
import 'package:flutter_cointopper/bloc/global_data_bloc/global_data_bloc.dart';
import 'package:flutter_cointopper/bloc/global_data_bloc/global_data_event.dart';
import 'package:flutter_cointopper/bloc/news_search_bloc/news_search_bloc.dart';
import 'package:flutter_cointopper/bloc/news_search_bloc/news_search_event.dart';
import 'package:flutter_cointopper/bloc/search_coin_bloc/search_coin_bloc.dart';
import 'package:flutter_cointopper/bloc/search_coin_bloc/search_coin_event.dart';
import 'package:flutter_cointopper/bloc/top_coin_bloc/top_coin_bloc.dart';
import 'package:flutter_cointopper/repository/coin_topper_repository.dart';
import 'bloc/currency_bloc/dashboard_bloc.dart';
import 'bloc/currency_bloc/dashboard_event.dart';
import 'bloc/news_list_bloc/news_list_bloc.dart';
import 'bloc/news_list_bloc/news_list_event.dart';
import 'bloc/top_coin_bloc/top_coin_event.dart';
import 'bottom_bar.dart';

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
        )..add(LoadCoinList("", "")),
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
      BlocProvider<SearchCoinBloc>(
        create: (BuildContext context) => SearchCoinBloc(
          coinRepository: CoinTopperRepository(),
        )..add(LoadSearchCoin()),
      ),
      BlocProvider<FeaturedNewsBloc>(
        create: (BuildContext context) => FeaturedNewsBloc(
          coinRepository: CoinTopperRepository(),
        )..add(LoadFeaturedNewsList()),
      ),
      BlocProvider<NewsListBloc>(
        create: (BuildContext context) => NewsListBloc(
          coinRepository: CoinTopperRepository(),
        )..add(LoadNewsList()),
      ),
      BlocProvider<NewsSearchBloc>(
        create: (BuildContext context) => NewsSearchBloc(
          coinRepository: CoinTopperRepository(),
        )..add(LoadNewsSearch("")),
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
      home: BottomNavigation(),
    );
  }
}
