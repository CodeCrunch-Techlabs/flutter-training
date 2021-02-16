import 'package:flutter/material.dart';
import 'dart:ui' as ui;
import 'dart:typed_data';
import 'package:flutter/rendering.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:image_picker_saver/image_picker_saver.dart';
import 'package:intl/intl.dart';

import 'coin_graph.dart';

class ScreenShotWidget extends StatefulWidget {
  final data;
  final currencySymbol;
  ScreenShotWidget(this.data, this.currencySymbol);
  @override
  _ScreenShotWidgetState createState() => _ScreenShotWidgetState();
}

class _ScreenShotWidgetState extends State<ScreenShotWidget> {
  GlobalKey _globalKey = new GlobalKey();

  Future<void> _captureScreenshot(_globalKey, var data) async {
    try {
      RenderRepaintBoundary boundary =
          _globalKey.currentContext.findRenderObject();
      ui.Image image = await boundary.toImage();
      ByteData byteData =
          await image.toByteData(format: ui.ImageByteFormat.png);
      // var png = byteData.buffer.asUint8List();
      final snackBar = SnackBar(
        content: Text('Saved to Gallery'),
        backgroundColor: Colors.green,
        action: SnackBarAction(
          label: 'Ok',
          onPressed: () {
            // Some code
          },
        ),
      );

      var filePath = await ImagePickerSaver.saveFile(
          fileData: byteData.buffer.asUint8List());
      print(filePath);
      Scaffold.of(context).showSnackBar(snackBar);
      Navigator.of(context).pop();
    } catch (e) {
      print(e);
    }
  }

  Widget _openPopup(var data, String currencySymbol) {
    Widget share = FlatButton(
      child: Container(
          padding: EdgeInsets.all(10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
            color: Colors.white30,
          ),
          child: Icon(
            Icons.share,
            color: Colors.white,
          )),
      onPressed: () {},
    );
    Widget download = FlatButton(
      child: Container(
          padding: EdgeInsets.all(10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
            color: Colors.white30,
          ),
          child: Icon(
            Icons.arrow_downward,
            color: Colors.white,
          )),
      onPressed: () {
        FocusScope.of(context).requestFocus(FocusNode());
        _captureScreenshot(_globalKey, data);
      },
    );
    Widget close = FlatButton(
      child: Container(
          padding: EdgeInsets.all(10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
            color: Colors.white30,
          ),
          child: Icon(
            Icons.close,
            color: Colors.white,
          )),
      onPressed: () {
        Navigator.of(context).pop();
      }, 
    );

    var currDt = DateTime.now();
    String formattedDate = DateFormat('dd MMM yyyy \n kk:mm:ss').format(currDt);
    AlertDialog alert = AlertDialog(
      actionsOverflowDirection: VerticalDirection.up,
      actionsPadding: EdgeInsets.all(0),
      elevation: 0,
      titlePadding: EdgeInsets.all(0),
      backgroundColor: Colors.transparent,
      contentPadding: EdgeInsets.only(top: 30, left: 30, right: 30, bottom: 0),
      actionsOverflowButtonSpacing: 0,
      buttonPadding: EdgeInsets.all(0),
      insetPadding: EdgeInsets.all(0),
      content: Container(
          height: 240,
          child: new Column(
            children: <Widget>[
              RepaintBoundary(
                key: _globalKey,
                child: Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                  elevation: 3,
                  child: Container(
                    height: 220,
                    padding: EdgeInsets.all(8.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      gradient: LinearGradient(
                        begin: Alignment.centerLeft,
                        end: Alignment.centerRight,
                        colors: [
                          HexColor(widget.data.color1),
                          HexColor(widget.data.color2)
//                          HexColor('#000000'),
//                          HexColor('#000000')
                        ],
                      ),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              padding: EdgeInsets.all(4.0),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(30),
                                color: Colors.white30,
                              ),
                              child: Image(
                                width: 32,
                                height: 32,
                                image: NetworkImage(widget.data.logo),
                              ),
                            ),
                            SizedBox(
                              width: 6,
                            ),
                            Text(
                              "${data.name}/${data.symbol}",
                              style: TextStyle(
                                  fontSize:
                                      MediaQuery.of(context).size.width * 0.04,
                                  color: Colors.white60),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Text(
                                       data.price > 99999
                                ? NumberFormat.compactCurrency(
                                    decimalDigits: 2,
                                    symbol: '${widget.currencySymbol}',
                                  ).format(data.price)
                                : '${widget.currencySymbol}' +
                                    data.price.toStringAsFixed(2),
                                      style: TextStyle(
                                          fontSize: 24,
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Image(
                                      height: 12,
                                      width: 12,
                                      image: AssetImage(
                                           data.percentChange24h > 0
                                              ? "assets/images/up_arrow.png"
                                              : "assets/images/down_arrow.png"),
                                    ),
                                    SizedBox(
                                      width: 5,
                                    ),
                                    Text(
                                      "${data.percentChange24h.toStringAsFixed(2)}%",
                                      style: TextStyle(
                                          fontSize: 12,
                                          color: Colors.white60,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ],
                                ),
                                Row(
                                  children: [
                                    Icon(
                                      FontAwesomeIcons.btc,
                                      color: Colors.white60,
                                      size: 14,
                                    ),
                                    Text(
                                     "${data.priceBtc.toStringAsFixed(8)}",
                                      style: TextStyle(
                                          fontSize: 12,
                                          color: Colors.white60,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 12,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      padding:
                                          EdgeInsets.symmetric(vertical: 8.0),
                                      height: 80,
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Row(
                                            children: [
                                              Text(
                                                data.high24Usd > 99999
                                          ? NumberFormat.compactCurrency(
                                              decimalDigits: 2,
                                              symbol:
                                                  '${widget.currencySymbol}',
                                            ).format(data.high24Usd)
                                          : '${widget.currencySymbol}' +
                                              data.high24Usd
                                                  .toStringAsFixed(2),
                                                style: TextStyle(
                                                    fontSize: 14,
                                                    color: Colors.white,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                              SizedBox(
                                                width: 5,
                                              ),
                                              Text(
                                                "24 HRS HIGH",
                                                style: TextStyle(
                                                    fontSize: 8,
                                                    color: Colors.white60,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                            ],
                                          ),
                                          Row(
                                            children: [
                                              Text(
                                                data.low24Usd > 99999
                                          ? NumberFormat.compactCurrency(
                                              decimalDigits: 2,
                                              symbol:
                                                  '${widget.currencySymbol}',
                                            ).format(data.low24Usd)
                                          : '${widget.currencySymbol}' +
                                              data.low24Usd.toStringAsFixed(2),
                                                style: TextStyle(
                                                    fontSize: 14,
                                                    color: Colors.white,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                              SizedBox(
                                                width: 5,
                                              ),
                                              Text(
                                                "24 HRS LOW",
                                                style: TextStyle(
                                                    fontSize: 8,
                                                    color: Colors.white60,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                            ],
                                          ),
                                          Row(
                                            children: [
                                              Text(
                                                NumberFormat.compactCurrency(
                                        decimalDigits: 2,
                                        symbol: '$currencySymbol',
                                      ).format(data.marketCapUsd),
                                                style: TextStyle(
                                                    fontSize: 14,
                                                    color: Colors.white,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                              SizedBox(
                                                width: 5,
                                              ),
                                              Text(
                                                "Market Cap",
                                                style: TextStyle(
                                                    fontSize: 8,
                                                    color: Colors.white60,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            Column(
                              children: [
                                Container(
                                  width:
                                      MediaQuery.of(context).size.width * 0.2,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Container(
                                        height: 50,
                                        width: 70,
                                        color: Colors.transparent,
                                        padding: EdgeInsets.all(4.0),
                                        child: CoinGraph(
                                          widget.data.marketId, 
                                          '#FFFAFA', 
                                        '#F5F5F5',
                                          false,
                                          false,
                                        ),
                                      ),
                                      Text(
                                        "$formattedDate ISD",
                                        style: TextStyle(
                                            fontSize: 10,
                                            color: Colors.white60,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      SizedBox(
                                        height: 5,
                                      ),
                                      Image(
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.2,
                                        image: AssetImage(
                                            'assets/images/logo.png'),
                                        fit: BoxFit.cover,
                                      ),
                                      SizedBox(
                                  height: 5,
                                ),
                                Text(
                                  "CoinTopper.com",
                                  style: TextStyle(
                                      fontSize: 8,
                                      color: Colors.white60,
                                      fontWeight: FontWeight.bold),
                                ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      actions: [
        SizedBox(
          width: MediaQuery.of(context).size.width,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              share,
              download,
              close,
            ],
          ),
        )
      ],
    );
    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Center(child: alert);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        _openPopup(widget.data, widget.currencySymbol);
      },
      icon: Icon(
        Icons.pages,
        color: Colors.white,
      ),
    );
  }
}
