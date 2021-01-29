// import 'package:fl_chart/fl_chart.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:flutter_cointopper/bloc/graph_week_bloc/graph_week_bloc.dart';
// import 'package:flutter_cointopper/bloc/graph_week_bloc/graph_week_event.dart';
// import 'package:flutter_cointopper/bloc/graph_week_bloc/graph_week_state.dart';
// import 'package:hexcolor/hexcolor.dart';

// class CoinGraph extends StatefulWidget {
//   final int market_id;
//   final String color1;
//   final String color2;
//   CoinGraph(this.market_id, this.color1, this.color2);
//   @override
//   _CoinGraphState createState() =>
//       _CoinGraphState(this.market_id, this.color1, this.color2);
// }

// class _CoinGraphState extends State<CoinGraph> {
//   final int market_id;
//   final String color1;
//   final String color2;
//   _CoinGraphState(this.market_id, this.color1, this.color2);

//   bool showAvg = false;

//   @override
//   void initState() {
//     super.initState();
//     BlocProvider.of<GraphWeekBloc>(context).add(LoadGraphWeek(market_id));
//   }

//   @override
//   Widget build(BuildContext context) {
//     return BlocBuilder<GraphWeekBloc, GraphWeekState>(
//       builder: (context, state) {
//         if (state is GraphWeekLoadSuccess) {
//           var data = state.graphWeekList;
//           var mapData=data.map((e) => e);
//           return Stack(
//             children: <Widget>[
//               AspectRatio(
//                 aspectRatio: 1.70,
//                 child: Container(
//                   decoration: const BoxDecoration(
//                       borderRadius: BorderRadius.all(
//                         Radius.circular(4),
//                       ),
//                       color: Colors.white),
//                   child: Padding(
//                     padding: const EdgeInsets.all(5),
//                     child: LineChart(
//                       showAvg ? avgData() : mainData(mapData),
//                     ),
//                   ),
//                 ),
//               ),
//               SizedBox(
//                 width: 60,
//                 height: 34,
//                 child: FlatButton(
//                   onPressed: () {
//                     setState(() {
//                       showAvg = !showAvg;
//                     });
//                   },
//                   child: Text(
//                     'avg',
//                     style: TextStyle(
//                         fontSize: 12,
//                         color: showAvg
//                             ? Colors.white.withOpacity(0.5)
//                             : Colors.white),
//                   ),
//                 ),
//               ),
//             ],
//           );
//         } else {
//           return Center(
//             child: CircularProgressIndicator(),
//           );
//         }
//       },
//     );
//   }

//   LineChartData mainData(var mapData) {
//     List<Color> gradientColors = [
//       HexColor(color1),
//       HexColor(color2),
//     ];
//     return LineChartData(
//       gridData: FlGridData(
//         show: true,
//         drawVerticalLine: false,
//         getDrawingHorizontalLine: (value) {
//           return FlLine(
//             color: Colors.grey[400],
//             strokeWidth: 0.5,
//           );
//         },
//         getDrawingVerticalLine: (value) {
//           return FlLine(
//             color: Colors.grey[400],
//             strokeWidth: 0.5,
//           );
//         },
//       ),
//       titlesData: FlTitlesData(
//         show: true,
//         bottomTitles: SideTitles(
//           showTitles: true,
//           reservedSize: mapData.lenght,
//           getTextStyles: (value) => const TextStyle(
//               color: Color(0xff68737d),
//               fontWeight: FontWeight.normal,
//               fontSize: 8),
//           getTitles: (value) {
//             switch (value.toInt()) {
//               case 0:
//                 return '1 dec';
//               case 1:
//                 return '10 jan';
//               case 2:
//                 return '2 feb';
//               case 3:
//                 return '5 mar';
//               case 4:
//                 return '2 apr';
//               case 5:
//                 return '10 jun';
//               case 6:
//                 return '3 dec';
//               case 7:
//                 return '5 july';
//             }
//             return '';
//           },
//           margin: 8,
//         ),
//         leftTitles: SideTitles(
//           showTitles: true,
//           getTextStyles: (value) => const TextStyle(
//             color: Color(0xff67727d),
//             fontWeight: FontWeight.normal,
//             fontSize: 10,
//           ),
//           getTitles: (value) {
//             switch (value.toInt()) {
//               case 1:
//                 return '10k';
//               case 2:
//                 return '20k';
//               case 3:
//                 return '30k';
//               case 4:
//                 return '40k';
//               case 5:
//                 return '50k';
//               case 6:
//                 return '60k';
//               case 7:
//                 return '70k';
//             }
//             return '';
//           },
//           reservedSize: 10,
//           margin: 12,
//         ),
//       ),
//       borderData: FlBorderData(
//           show: true, border: Border.all(color: Colors.grey[600], width: 1)),
//       minX: 0,
//       maxX: 6,
//       minY: 0,
//       maxY: 6,
//       lineBarsData: [
//         LineChartBarData(
//           spots: [
//             FlSpot(0, 3),
//             FlSpot(1.6, 2),
//             FlSpot(2.9, 5),
//             FlSpot(3.8, 3.1),
//             FlSpot(4, 2),
//             FlSpot(5, 3),
//             FlSpot(6, 4),
//           ],
//           isCurved: true,
//           colors: gradientColors,
//           barWidth: 2,
//           isStrokeCapRound: true,
//           dotData: FlDotData(
//             show: false,
//           ),
//           belowBarData: BarAreaData(
//             show: true,
//             colors:
//                 gradientColors.map((color) => color.withOpacity(0.3)).toList(),
//           ),
//         ),
//       ],
//     );
//   }

//   LineChartData avgData() {
//     List<Color> gradientColors = [
//       HexColor(color1),
//       HexColor(color2),
//     ];
//     return LineChartData(
//       lineTouchData: LineTouchData(enabled: false),
//       gridData: FlGridData(
//         show: true,
//         drawHorizontalLine: true,
//         getDrawingVerticalLine: (value) {
//           return FlLine(
//             color: const Color(0xff37434d),
//             strokeWidth: 1,
//           );
//         },
//         getDrawingHorizontalLine: (value) {
//           return FlLine(
//             color: const Color(0xff37434d),
//             strokeWidth: 1,
//           );
//         },
//       ),
//       titlesData: FlTitlesData(
//         show: true,
//         bottomTitles: SideTitles(
//           showTitles: true,
//           reservedSize: 22,
//           getTextStyles: (value) => const TextStyle(
//               color: Color(0xff68737d),
//               fontWeight: FontWeight.bold,
//               fontSize: 16),
//           getTitles: (value) {
//             switch (value.toInt()) {
//               case 2:
//                 return 'MAR';
//               case 5:
//                 return 'JUN';
//               case 8:
//                 return 'SEP';
//             }
//             return '';
//           },
//           margin: 8,
//         ),
//         leftTitles: SideTitles(
//           showTitles: true,
//           getTextStyles: (value) => const TextStyle(
//             color: Color(0xff67727d),
//             fontWeight: FontWeight.bold,
//             fontSize: 15,
//           ),
//           getTitles: (value) {
//             switch (value.toInt()) {
//               case 1:
//                 return '10k';
//               case 3:
//                 return '30k';
//               case 5:
//                 return '50k';
//             }
//             return '';
//           },
//           reservedSize: 28,
//           margin: 12,
//         ),
//       ),
//       borderData: FlBorderData(
//           show: true,
//           border: Border.all(color: const Color(0xff37434d), width: 1)),
//       minX: 0,
//       maxX: 11,
//       minY: 0,
//       maxY: 6,
//       lineBarsData: [
//         LineChartBarData(
//           spots: [
//             FlSpot(0, 3.44),
//             FlSpot(2.6, 3.44),
//             FlSpot(4.9, 3.44),
//             FlSpot(6.8, 3.44),
//             FlSpot(8, 3.44),
//             FlSpot(9.5, 3.44),
//             FlSpot(11, 3.44),
//           ],
//           isCurved: true,
//           colors: [
//             ColorTween(begin: gradientColors[0], end: gradientColors[1])
//                 .lerp(0.2),
//             ColorTween(begin: gradientColors[0], end: gradientColors[1])
//                 .lerp(0.2),
//           ],
//           barWidth: 5,
//           isStrokeCapRound: true,
//           dotData: FlDotData(
//             show: false,
//           ),
//           belowBarData: BarAreaData(show: true, colors: [
//             ColorTween(begin: gradientColors[0], end: gradientColors[1])
//                 .lerp(0.2)
//                 .withOpacity(0.1),
//             ColorTween(begin: gradientColors[0], end: gradientColors[1])
//                 .lerp(0.2)
//                 .withOpacity(0.1),
//           ]),
//         ),
//       ],
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_cointopper/bloc/graph_week_bloc/graph_week_bloc.dart';
import 'package:flutter_cointopper/bloc/graph_week_bloc/graph_week_event.dart';
import 'package:flutter_cointopper/bloc/graph_week_bloc/graph_week_state.dart';
import 'package:hexcolor/hexcolor.dart';

import 'package:intl/intl.dart';

import 'package:fl_chart/fl_chart.dart';
// import 'package:fluttersafari/datum.dart';
// import 'package:fluttersafari/data_loader.dart';

class CoinGraph extends StatefulWidget {
  final int market_id;
  final String color1;
  final String color2;
  CoinGraph(this.market_id, this.color1, this.color2);
  @override
  _CoinGraphState createState() =>
      _CoinGraphState(this.market_id, this.color1, this.color2);
}

class _CoinGraphState extends State<CoinGraph> {
  final int market_id;
  final String color1;
  final String color2;
  _CoinGraphState(this.market_id, this.color1, this.color2);

  // final List<Color> _gradientColors = [
  //   const Color(0xFF6FFF7C),
  //   const Color(0xFF0087FF),
  //   const Color(0xFF5620FF),
  // ];

  final int _divider = 18241000;
  final int _leftLabelsCount = 7;

  List<FlSpot> _values = const [];

  double _minX = 0;
  double _maxX = 0;
  double _minY = 0;
  double _maxY = 0;
  double _leftTitlesInterval = 0;
  final data = [];

  @override
  void initState() {
    super.initState();
    BlocProvider.of<GraphWeekBloc>(context).add(LoadGraphWeek(market_id));
    // _prepareStockData();
  }

  @override
  void dispose() {
     _mainData(); 
     _gridData();
     _bottomTitles();
     _leftTitles();
     _lineBarData();
    super.dispose();

    // _values.clear();
  }

  // void _prepareStockData() async {
  // final List<Datum> data = await loadStockData();
  double minY = double.maxFinite;
  double maxY = double.minPositive;

  //   setState(() {});
  // }

  LineChartData _mainData() {
    return LineChartData(
      gridData: _gridData(),
      titlesData: FlTitlesData(
        bottomTitles: _bottomTitles(),
        leftTitles: _leftTitles(),
      ),
      borderData: FlBorderData(
        border: Border.all(color: Colors.white12, width: 1),
      ),
      minX: _minX,
      maxX: _maxX,
      minY: _minY,
      maxY: _maxY,
      lineBarsData: [_lineBarData()],
    );
  }

  LineChartBarData _lineBarData() {
    List<Color> _gradientColors = [
      HexColor(color1),
      HexColor(color1),
      HexColor(color2),
    ];
    return LineChartBarData(
      spots: _values,
      colors: _gradientColors,
      colorStops: const [0.25, 0.5, 0.75],
      gradientFrom: const Offset(0.5, 0),
      gradientTo: const Offset(0.5, 1),
      barWidth: 2,
      isStrokeCapRound: true,
      dotData: FlDotData(show: false),
      belowBarData: BarAreaData(
        show: true,
        colors: _gradientColors.map((color) => color.withOpacity(0.3)).toList(),
        gradientColorStops: const [0.25, 0.5, 0.75],
        gradientFrom: const Offset(0.5, 0),
        gradientTo: const Offset(0.5, 1),
      ),
    );
  }

  SideTitles _leftTitles() {
    return SideTitles(
      showTitles: true,

      // textStyle: TextStyle(
      //   color: Colors.white54,
      //   fontSize: 14,
      // ),
      getTitles: (value) =>
          NumberFormat.compactCurrency(symbol: '\$').format(value),
      reservedSize: 20,
      margin: 12,
      interval: _leftTitlesInterval,
    );
  }

  SideTitles _bottomTitles() {
    return SideTitles(
      showTitles: true,
      // textStyle: TextStyle(
      //   color: Colors.white54,
      //   fontSize: 14,
      // ),
      getTitles: (value) {
        final DateTime date =
            DateTime.fromMillisecondsSinceEpoch(value.toInt());
        return DateFormat.MMM().format(date);
      },
      margin: 8,
      interval: (_maxX - _minX) / 7,
    );
  }

  FlGridData _gridData() {
    return FlGridData(
      show: true,
      drawVerticalLine: false,
      getDrawingHorizontalLine: (value) {
        return FlLine(
          color: Colors.grey[200],
          strokeWidth: 1,
        );
      },
      checkToShowHorizontalLine: (value) {
        return (value - _minY) % _leftTitlesInterval != 0;
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GraphWeekBloc, GraphWeekState>(
      builder: (context, state) {
        if (state is GraphWeekLoadSuccess) {
          var data = state.graphWeekList;
          print("Graph data jjj====>${data.map((e) => e.price)}");
          _values = data.map((datum) {
            if (minY > datum.price.toDouble()) minY = datum.price.toDouble();
            if (maxY < datum.price.toDouble()) maxY = datum.price.toDouble();
            return FlSpot(
              datum.time.toDouble(),
              datum.price.toDouble(),
            );
          }).toList();

          _minX = _values.first.x;
          _maxX = _values.last.x;
          _minY = (minY).floorToDouble();
          _maxY = (maxY).ceilToDouble();
          _leftTitlesInterval =
              ((_maxY - _minY) / (_leftLabelsCount - 1)).floorToDouble();
          return AspectRatio(
            aspectRatio: 1.70,
            child: Padding(
              padding: const EdgeInsets.only(
                  right: 5.0, left: 5.0, top: 24, bottom: 12),
              child: _values.isEmpty ? Placeholder() : LineChart(_mainData()),
            ),
          );
        } else {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }
}
