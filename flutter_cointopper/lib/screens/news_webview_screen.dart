import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_cointopper/bloc/news_details_bloc/news_details_bloc.dart';
import 'package:flutter_cointopper/bloc/news_details_bloc/news_details_event.dart';
import 'package:flutter_cointopper/bloc/news_details_bloc/news_details_state.dart';
import 'package:flutter_cointopper/widgets/custom_safearea_widget.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';
import 'package:flutter_widget_from_html_core/flutter_widget_from_html_core.dart';

class NewsWebview extends StatefulWidget {
  final int id;

  NewsWebview({
    @required this.id,
  });

  @override
  _NewsWebviewState createState() => _NewsWebviewState(id: id);
}

class _NewsWebviewState extends State<NewsWebview> {
  final int id;
  _NewsWebviewState({
    @required this.id,
  });

  final globalKey = GlobalKey<ScaffoldState>();
  final flutterWebviewPlugin = new FlutterWebviewPlugin();

  @override
  Widget build(BuildContext context) {
    BlocProvider.of<NewsDetailsBloc>(context).add(LoadNewsDetails(id));

    return CustomSafeAreaWidget(
      color1: Color(0xFFdb1ec9),
      color2: Color(0xFFff005a),
      child: Scaffold(
        body: BlocBuilder<NewsDetailsBloc, NewsDetailsState>(
          builder: (context, state) {
            if (state is NewsDetailsLoadSuccess) {
              var data = state.newsDetailsList[0]; 
              return Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    height: MediaQuery.of(context).size.height * 0.10,
                    padding: EdgeInsets.only(left: 10, right: 10),
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.centerLeft,
                        end: Alignment.centerRight,
                        colors: [Color(0xFFdb1ec9), Color(0xFFff005a)],
                      ),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "News",
                              style: TextStyle(
                                fontSize: 20,
                                color: Colors.white60,
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                Navigator.of(context).pop(); 
                              },
                              child: Container(
                                padding: EdgeInsets.all(4),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(30),
                                  color: Colors.white30,
                                ),
                                child: Icon(
                                  Icons.close,
                                  color: Colors.white,
                                ),
                              ),
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Column(
                      children: [
                        Container(
                          padding: EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              begin: Alignment.centerLeft,
                              end: Alignment.centerRight,
                              colors: [Color(0xFFdb1ec9), Color(0xFFff005a)],
                            ),
                          ),
                          child: Text(
                            data.titleEn.toString(),
                            style: TextStyle(
                                fontSize: 24,
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        Container(
                          child: Image(
                            width: MediaQuery.of(context).size.width,
                            height: 160,
                            fit: BoxFit.fill,
                            image: NetworkImage(data.photoFile.toString()),
                          ),
                        ),
                        Expanded(
                          child: Container(
                              padding: EdgeInsets.all(10),
                              child: SingleChildScrollView(
                                  child: HtmlWidget(data.detailsEn))), 
                        ),
                      ],
                    ),
                  )
                ],
              );
            } else {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
          },
        ),
        // body: _buildWebView(data),
      ),
    );
  }
}
 