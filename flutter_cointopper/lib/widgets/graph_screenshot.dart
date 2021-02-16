import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_cointopper/bloc/graph_week_bloc/graph_week_bloc.dart';
import 'package:flutter_cointopper/bloc/graph_week_bloc/graph_week_event.dart';
import 'package:flutter_cointopper/bloc/graph_week_bloc/graph_week_state.dart';
import 'package:hexcolor/hexcolor.dart'; 
import 'package:flutter_sparkline/flutter_sparkline.dart';

class GraphScreenshot extends StatefulWidget {
  final int marketId;
  final String color1;
  final String color2;  

  GraphScreenshot(this.marketId, this.color1, this.color2);
  @override
  _GraphScreenshotState createState() => _GraphScreenshotState();
}

class _GraphScreenshotState extends State<GraphScreenshot> { 

  @override
  Widget build(BuildContext context) {
    BlocProvider.of<GraphWeekBloc>(context).add(LoadGraphWeek(widget.marketId));
    return BlocBuilder<GraphWeekBloc, GraphWeekState>(
      builder: (context, state) {
        if (state is GraphWeekLoadSuccess) {
          var data = state.graphWeekList; 
          return Container(
            height: MediaQuery.of(context).size.height * 0.3,
            width: MediaQuery.of(context).size.width, 
            child: Sparkline(
              data: data.map((e)=>e.price).toList(),
              lineColor: HexColor(widget.color2),  
              fillMode: FillMode.below,
              fillColor: HexColor(widget.color1).withOpacity(0.3) ,
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
