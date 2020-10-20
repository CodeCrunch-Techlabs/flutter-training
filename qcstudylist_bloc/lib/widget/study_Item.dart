import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class StudyItem extends StatelessWidget {
  final study;

  StudyItem(this.study);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          child: Row(
            children: <Widget>[
              Container(
                  child: study.logo.contains("html")
                      ? Image.asset(
                    "images/Placeholder.png",
                    height: 90.0,
                    width: 90.0,
                    fit: BoxFit.cover,
                  ) :Image.network(
                    study.logo,
                    height: 90.0,
                    width: 90.0,
                    fit: BoxFit.cover,
                  )
              ),
              SizedBox(
                width: 10,
              ),
              Flexible(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                              color: Colors.purple, shape: BoxShape.circle),
                          child: Icon(
                            Icons.arrow_forward,
                            color: Colors.white,
                            size: 12,
                          ),
                        ),
                        SizedBox(
                          width: 4,
                        ),
                        Text(
                          "Yet To Join",
                          style: Theme.of(context).textTheme.bodyText2,
                        )
                      ],
                    ),
                    Text(
                      study.title,
                      style: Theme.of(context).textTheme.bodyText1,
                    ),
                    Text(
                      study.tagline,
                      style: TextStyle(color: Colors.black),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      children: [
                        Text(
                          "COMPLETION:",
                          style: TextStyle(color: Colors.black),
                        ),
                        SizedBox(
                          width: 4,
                        ),
                        Text("0%")
                      ],
                    )
                  ],
                ),
              )
            ],
          ),
        ),
        Padding(padding: EdgeInsets.all(14.0), child: Divider())
      ],
    );
  }
}
