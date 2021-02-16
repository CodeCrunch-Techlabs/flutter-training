import 'package:flutter/material.dart'; 
import 'details_img_carousel.dart';


class CoindetailsImportantarticles extends StatelessWidget {

  final title;
  CoindetailsImportantarticles(this.title);
   
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 10, left: 10, right: 10),
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
              Text(
                "Important Articles",
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.black54,
                ),
              ),
              SizedBox(
                height: 10,
              ),
              DetailsImageCarousel(title),
            ],
          ),
        ),
      ),
    );
  }
}
