import 'package:flutter/material.dart';
import 'package:readmore/readmore.dart'; 
import 'coin_details_card_header_text.dart';
import 'details_youtube_player.dart';

class CoindetailsIntro extends StatelessWidget {
   
  final String intro;
  final String youtube;
  CoindetailsIntro(this.intro,this.youtube);

   String removeAllHtmlTags(String htmlText) {
    RegExp exp = RegExp(r"<[^>]*>", multiLine: true, caseSensitive: true);
    return htmlText.replaceAll(exp, '');
  } 

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 10),
      child: Card(
        elevation: 3,
        child: Container(
          padding: EdgeInsets.all(15),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CoindetailsCardHeaderText(title:"About",color: Colors.black54,fontSize: 16),
              SizedBox(
                height: 10,
              ),
              ReadMoreText(
                removeAllHtmlTags(intro),
                trimLines: 1,
                colorClickableText: Colors.blue,
                trimCollapsedText: '...Show more',
                trimExpandedText: ' show less',
              ),
              SizedBox(
                height: 10,
              ),
             DetailsYoutubePlayer(youtube),
            ],
          ),
        ),
      ),
    );
  }
}
