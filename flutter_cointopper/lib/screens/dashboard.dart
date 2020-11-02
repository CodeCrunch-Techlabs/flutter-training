import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_cointopper/bloc/dashboard_bloc.dart';
import 'package:flutter_cointopper/bloc/dashboard_event.dart';
import 'package:flutter_cointopper/bloc/dashboard_state.dart';
import 'package:flutter_cointopper/bottom_bar.dart';
import 'package:flutter_cointopper/widgets/coin_list.dart';
import 'package:flutter_cointopper/widgets/coincard.dart';

class Dashboard extends StatefulWidget {
  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  String dropdownValue = 'One';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            // height: MediaQuery.of(context).size.height * 0.2,
            height: 180,
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
                                  MediaQuery.of(context).size.width * 0.08,
                              color: Colors.white,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text("CRYPTO M.CAP",
                            style: TextStyle(
                                fontSize:
                                    MediaQuery.of(context).size.width * 0.03,
                                color: Colors.white60)),
                        Text("\$207.00 B",
                            style: TextStyle(
                                fontSize:
                                    MediaQuery.of(context).size.width * 0.04,
                                color: Colors.white)),
                      ],
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
                        Container(
                          height: 40,
                          width: MediaQuery.of(context).size.width * 0.4,
                          child: TextField(
                            style: TextStyle(
                                fontSize: 18.0, color: Colors.white60),
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                  borderSide: BorderSide.none,
                                  borderRadius: BorderRadius.circular(12)),
                              filled: true,
                              hintText: 'Search',
                              hintStyle: TextStyle(
                                color: Colors.white60,
                                fontSize: 18,
                              ),
                              contentPadding: EdgeInsets.only(
                                left: 14.0,
                              ),
                            ),
                          ),
                        ),
                        DropdownButton<String>(
                          value: dropdownValue,
                          iconSize: 24,
                          elevation: 16,
                          style: TextStyle(color: Colors.deepPurple),
                          onChanged: (String newValue) {
                            setState(() {
                              dropdownValue = newValue;
                            });
                          },
                          items: <String>['One', 'Two', 'Free', 'Four']
                              .map<DropdownMenuItem<String>>((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value),
                            );
                          }).toList(),
                        ),
                        BlocBuilder<CurrencyBloc, CurrencyState>(
                            builder: (context, state) {
                          if (state is CurrencyListLoadSuccess) {
                            print("callled---1");
                            print("${state.currencyList.map((e) => e.name)}");
                          }
                          return CircularProgressIndicator();
                        }),

                        // Container(
                        //   height: 40,
                        //   width: MediaQuery.of(context).size.width * 0.2,
                        //   padding: EdgeInsets.all(13),
                        //   decoration: BoxDecoration(
                        //     color: Color(0xFF00e00),
                        //     borderRadius: BorderRadius.circular(12),
                        //   ),
                        //   child: Text(
                        //     'USD',
                        //     style: TextStyle(fontSize: 16, color: Colors.white),
                        //   ),
                        // ),
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
          Expanded(
            child: CoinList(),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigation(),
    );
  }
}
