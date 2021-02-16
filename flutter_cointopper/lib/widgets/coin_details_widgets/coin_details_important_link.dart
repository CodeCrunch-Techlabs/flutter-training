import 'package:flutter/material.dart';
import 'package:sticky_headers/sticky_headers/widget.dart'; 
import 'coin_important_links.dart';


class CoindetailsImpotantlink extends StatelessWidget {
  final String youtube;
  final String website;
  final String explorer;
  final String facebook;
  final String blog;
  final String forum;
  final String github;
  final String raddit;
  final String slack;
  final String paper;

  CoindetailsImpotantlink(
      this.youtube,
      this.website,
      this.explorer,
      this.facebook,
      this.blog,
      this.forum,
      this.github,
      this.raddit,
      this.slack,
      this.paper);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10),
      child: Card(
        elevation: 3,
        child: Container(
          padding: EdgeInsets.only(left: 15, right: 15, bottom: 15),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              StickyHeader(
                header: Container(
                  padding: EdgeInsets.symmetric(vertical: 10),
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.white,
                  ),
                  child: Text(
                    "Important Links",
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.black54,
                    ),
                  ),
                ),
                content: CoinImportantLinks(
                  youtube,
                  website,
                  explorer,
                  facebook,
                  blog,
                  forum,
                  github,
                  raddit,
                  slack,
                  paper,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
