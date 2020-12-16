import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_cointopper/bloc/coin_list_bloc/coin_list_bloc.dart';
import 'package:flutter_cointopper/bloc/coin_list_bloc/coin_list_state.dart';
import 'package:flutter_cointopper/bloc/currency_bloc/dashboard_bloc.dart';
import 'package:flutter_cointopper/bloc/currency_bloc/dashboard_state.dart';
import 'package:flutter_cointopper/bloc/global_data_bloc/global_data_bloc.dart';
import 'package:flutter_cointopper/bloc/global_data_bloc/global_data_state.dart';
import 'package:flutter_cointopper/screens/search_screen.dart';
import 'package:flutter_cointopper/widgets/coin_list.dart';
import 'package:flutter_cointopper/widgets/coincard.dart'; 

class Dashboard extends StatefulWidget {
  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  String dropdownValue = 'USD';
  String dValue;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            height: MediaQuery.of(context).size.height * 0.25,
            // height: 180,
            padding: EdgeInsets.only(top: 20, left: 10, right: 10),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
                colors: [Colors.blue[800], Colors.blue[400]],
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Welcome to Cointopper",
                          style: TextStyle(
                              fontSize:
                                  MediaQuery.of(context).size.width * 0.04,
                              color: Colors.white60),
                        ),
                        Text(
                          "Cryptocurrencies",
                          style: TextStyle(
                              fontSize:
                                  MediaQuery.of(context).size.width * 0.06,
                              color: Colors.white,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    BlocBuilder<GlobalDataBloc, GlobalDataState>(
                      builder: (context, state) {
                        if (state is GlobalDataLoadSuccess) {
                          var data = state.globalDataList[0].total_market_cap;
                          return Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Text(
                                "CRYPTO M.CAP",
                                style: TextStyle(
                                    fontSize:
                                        MediaQuery.of(context).size.width *
                                            0.03,
                                    color: Colors.white60),
                              ),
                              Text(
                                (data >= 1000000 && data < (1000000 * 10 * 100))
                                    ? (data / 1000000).toStringAsFixed(2) + "M"
                                    : (data / (1000000 * 10 * 100))
                                            .toStringAsFixed(2) +
                                        "B",
                                style: TextStyle(
                                    fontSize:
                                        MediaQuery.of(context).size.width *
                                            0.04,
                                    color: Colors.white),
                              ),
                            ],
                          );
                        } else {
                          return Center(
                            child: CircularProgressIndicator(),
                          );
                        }
                      },
                    ),
                  ],
                ),
                // SizedBox(
                //   height: 10,
                // ),

                Padding(
                  padding: const EdgeInsets.all(0),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        GestureDetector(
                          onTap: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (_) => SearchScreen()));
                          },
                          child: Container(
                              padding: EdgeInsets.only(
                                  top: 10, bottom: 10, left: 10),
                              height: 40,
                              width: MediaQuery.of(context).size.width * 0.4,
                              decoration: BoxDecoration(
                                color: Color(0xFF00e00),
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: Text(
                                "Search",
                                style: TextStyle(
                                  color: Colors.white60,
                                  fontSize: 18,
                                ),
                              )),
                        ),
                        BlocBuilder<CurrencyBloc, CurrencyState>(
                            builder: (context, state) {
                          if (state is CurrencyListLoadSuccess) {
                            return Container(
                              height: 40,
                              padding: EdgeInsets.all(3),
                              decoration: BoxDecoration(
                                color: Color(0xFF00e00),
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: new DropdownButtonHideUnderline(
                                child: DropdownButton(
                                  icon: Icon(
                                    Icons.arrow_drop_down,
                                    color: Colors.white60,
                                    size: 24,
                                  ),
                                  iconSize: 24,
                                  style: TextStyle(color: Colors.white60),
                                  items: state.currencyList.map((value) {
                                    return DropdownMenuItem(
                                      value: value.symbol,
                                      child: Text(' ${value.symbol}',
                                          style:
                                              TextStyle(color: Colors.black)),
                                    );
                                  }).toList(),
                                  value: dropdownValue,
                                  onChanged: (String newValue) {
                                    setState(() {
                                      dropdownValue = newValue;
                                    });
                                  },
                                ),
                              ),
                            );
                          } else {
                            return CircularProgressIndicator();
                          }
                        }),
                        Container(
                          height: 40,
                          width: MediaQuery.of(context).size.width * 0.15,
                          decoration: BoxDecoration(
                            color: Color(0xFF00e00),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: IconButton(
                            onPressed: () {},
                            icon: Icon(
                              Icons.star_border,
                              color: Colors.white,
                            ),
                          ),
                        ),
                        Container(
                          height: 40,
                          width: MediaQuery.of(context).size.width * 0.15,
                          decoration: BoxDecoration(
                            color: Color(0xFF00e00),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: IconButton(
                            onPressed: () {},
                            icon: Icon(
                              Icons.notifications_active,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ]),
                ),
              ],
            ),
          ),
          CoinCard(),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 10),
            child: Divider(
              color: Colors.blue[800],
              thickness: 2,
            ),
          ),
          BlocBuilder<CoinListBloc, CoinListState>(builder: (context, state) {
            if (state is CoinListLoadSuccess) {
              return Expanded(
                child: CoinList(),
              );
            } else {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
          }),
        ],
      ),
    );
  }
}
