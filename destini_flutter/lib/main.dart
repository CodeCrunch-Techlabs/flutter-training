import 'package:flutter/material.dart';
import 'story_brain.dart';


void main() => runApp(Destini());

class Destini extends StatelessWidget {
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(),
      home: StoryPage(),
    );
  }
}

StoryBrain storyBrain = StoryBrain();//It's created object to access properties and methods of StoryBrain class.

class StoryPage extends StatefulWidget {
  _StoryPageState createState() => _StoryPageState();
}

class _StoryPageState extends State<StoryPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('images/background.png'),
            fit: BoxFit.cover,
          )
        ),
        padding: EdgeInsets.symmetric(vertical: 50.0, horizontal: 15.0),
        constraints: BoxConstraints.expand(),
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Expanded(
                flex: 12,
                child: Center(
                  child: Text(
                    storyBrain.getStory(),//It's shows story title check getStory() in story_brain.dart file.
                    style: TextStyle(
                      fontSize: 18.0,
                    ),
                  ),
                ),
              ),
              Expanded(
                flex: 2,
                child: FlatButton(
                  onPressed: () {
                    //Choice 1 made by user.
                    setState(() {
                      storyBrain.nextStory(1);//change story check nextStory(1) in story_brain.dart file.
                    });
                  },
                  color: Colors.red,
                  child: Text(
                    storyBrain.getChoice1(),//It's shows choice 1 text check getChoice1() in story_brain.dart file.
                    style: TextStyle(
                      fontSize: 20.0,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 20.0,
              ),
              Expanded(
                flex: 2,
                child: Visibility(
                  visible: storyBrain.buttonShouldBeVisible(),//Show and hide check buttonShouldBeVisible() in story_brain.dart file.
                  child: FlatButton(
                    onPressed: () {
                      //Choice 2 made by user.
                     setState(() {
                       storyBrain.nextStory(2);//It's shows choice 2 text check getChoice1() in story_brain.dart file.
                     });
                    },
                    color: Colors.blue,
                    child: Text(
                     storyBrain.getChoice2(), //change story check nextStory(2) in story_brain.dart file.
                      style: TextStyle(
                        fontSize: 20.0,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

//finished app.




