import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_cointopper/bloc/currency_bloc/dashboard_bloc.dart';
import 'package:flutter_cointopper/bloc/currency_bloc/dashboard_state.dart';
import 'package:flutter_cointopper/bloc/global_data_bloc/global_data_bloc.dart';
import 'package:flutter_cointopper/bloc/global_data_bloc/global_data_state.dart';
import 'package:flutter_cointopper/screens/search_screen.dart';
import 'package:flutter_cointopper/widgets/coin_list.dart';
import 'package:flutter_cointopper/widgets/coin_card_widget.dart';
import 'package:flutter_cointopper/widgets/custom_safearea_widget.dart';
import 'package:flutter_cointopper/widgets/icon_button_widget.dart';
import 'package:intl/intl.dart';

class Dashboard extends StatefulWidget {
  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  String dropdownValue = 'USD';
  String dValue;
  dynamic currencySymbol = '\$';

  @override
  Widget build(BuildContext context) {
    return CustomSafeAreaWidget(
      color1: Colors.blue[800],
      color2: Colors.blue[400],
      child: Scaffold(
        body: Column(
          children: [
            Container(
              height: MediaQuery.of(context).size.height * 0.20,  
              padding: EdgeInsets.only(left: 10, right: 10),
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
                            var _formattedMarketCap =
                                NumberFormat.compactCurrency(
                              decimalDigits: 2,
                              symbol: '\$',
                            ).format(state.globalDataList[0].totalMarketCap);
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
                                  _formattedMarketCap,
                                  style: TextStyle(
                                    fontSize:
                                        MediaQuery.of(context).size.width *
                                            0.04,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                  ),
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
                                  builder: (_) => SearchScreen(
                                      dropdownValue, currencySymbol)));
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
                              dynamic currencySymbolData = state.currencyList
                                  .where(
                                      (value) => value.symbol == dropdownValue);
                              dynamic symbolData = currencySymbolData
                                  .map((value) => value.format);
                              return Container(
                                height: 40,
                                width: MediaQuery.of(context).size.width * 0.2,
                                decoration: BoxDecoration(
                                  color: Color(0xFF00e00),
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                child: DropdownButton(
                                  iconSize: 0.0,
                                  underline:
                                      Container(color: Colors.transparent),
                                  selectedItemBuilder: (BuildContext context) {
                                    return state.currencyList
                                        .map<Widget>((dynamic item) {
                                      return Container(
                                        alignment:
                                            AlignmentDirectional.centerStart,
                                        padding: EdgeInsets.all(8.0),
                                        child: Text(
                                          '${item.symbol}',
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                0.03,
                                          ),
                                        ),
                                      );
                                    }).toList();
                                  },
                                  items: state.currencyList.map((value) {
                                    return DropdownMenuItem(
                                      value: value.symbol,
                                      child: Container(
                                        padding: EdgeInsets.all(5.0),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text('${value.name}',
                                                style: TextStyle(
                                                    color: Colors.black)),
                                            Text('(${value.symbol})',
                                                style: TextStyle(
                                                    color: Colors.black)),
                                          ],
                                        ),
                                      ),
                                    );
                                  }).toList(),
                                  value: dropdownValue,
                                  onChanged: (String newValue) {
                                    setState(() {
                                      dropdownValue = newValue;
                                      currencySymbol = symbolData.single;
                                    });
                                  },
                                ),
                              );
                            } else {
                              return CircularProgressIndicator();
                            }
                          }),
                          IconButtonWidget(
                              iconName: Icons.star_border,
                              onPress: null,
                              iconColor: Colors.white,
                              iconBackgroundColor: Color(0xFF00e00)),
                          IconButtonWidget(
                              iconName: Icons.notifications_active,
                              onPress: null,
                              iconColor: Colors.white,
                              iconBackgroundColor: Color(0xFF00e00)),
                        ]),
                  ),
                ],
              ),
            ),
            CoinCard(dropdownValue, currencySymbol),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 10),
              child: Divider(
                color: Colors.blue[800],
                thickness: 2,
              ),
            ), 
            Expanded(
              child: CoinListScreen(dropdownValue, currencySymbol),
            ), 
          ],
        ),
      ),
    );
  }
}
