import 'package:flutter/material.dart';

class ListHeaderWidget extends StatefulWidget {
  final String headerName; 

  ListHeaderWidget({
    Key key,
    this.headerName, 
  }) : super(key: key);

  @override
  _ListHeaderWidgetState createState() => _ListHeaderWidgetState();
}

class _ListHeaderWidgetState extends State<ListHeaderWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: [
          Text(
            widget.headerName,
            style: TextStyle(
              fontSize: MediaQuery.of(context).size.width * 0.03,
              fontWeight: FontWeight.w600,
              color: Color(0xFF005580),
            ),
          ), 
        ],
      ),
    );
  }
}
