import 'package:flutter/material.dart';
import '../coin_close_icon_button.dart';
import 'coin_details_card_header_text.dart';

class CoinLogoAndNameWidget extends StatelessWidget {
  const CoinLogoAndNameWidget({
    Key key,
    @required this.widget,
    @required this.context,
    @required this.closeBtn,
  }) : super(key: key);

  final dynamic widget;
  final BuildContext context;
  final bool closeBtn;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Row(
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
                image: NetworkImage(widget.logo),
              ),
            ),
            SizedBox(
              width: 6,
            ),
            CoindetailsCardHeaderText(
              title: "${widget.name} / ${widget.symbol}",
              fontSize: MediaQuery.of(context).size.width * 0.04,
              color: Colors.white60,
            ),
          ],
        ),
        closeBtn == true
            ? CloseButtonWidget(
                context: context,
              )
            : Container(),
      ],
    );
  }
}
