import 'package:flutter/material.dart';
import 'Quiz_brain.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

void main() => runApp(Quizzler());

class Quizzler extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.grey.shade900,
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.0),
            child: QuizPage(),
          ),
        ),
      ),
    );
  }
}

class QuizPage extends StatefulWidget {
  @override
  _QuizPageState createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {


//  List<String> questions = [
//    'You can lead a cow down stairs but not up stairs.',
//    'Approximately one quarter of human bones are in the feet.',
//    'A slug\'s blood is green.'
//  ];
//
//
//  List<bool> answers = [
//    false,
//    true,
//    true
//  ];

 // Question q1 = Question(q: 'You can lead a cow down stairs but not up stairs.', a: false );

  QuizBrain  quizBrain = QuizBrain();//Created object and assign QuizBrain to access it's methods and properties.

  List<Icon> scoreKeeper = [];//For Icons score.

  void checkAnswer(bool ans){
    bool correctAns = quizBrain.getquestionAnswer();//chekck getquestionAnswer() method in Quiz_brain.dart file.
    setState(() {
      if(correctAns == ans){
        scoreKeeper.add(Icon(Icons.check,color: Colors.green,));
      }//If correctans and ans are same then it's add check green icon in scorekeeper array.
      else{
        scoreKeeper.add( Icon(Icons.close,color: Colors.red,));
      }//If correctans and ans are not same then it's add close red icon in scorekeeper array.
      quizBrain.nextQuestion();//check nextQuestion() method in Quiz_brain.dart file.
      if(quizBrain.isFinished == true){
        showAlert();
        scoreKeeper.clear();
        print(scoreKeeper);
      }//It's shows alertbox and make scoreKeeper empty when isFinished value is true, check nextQuestion() method in Quiz_brain.dart file.
    });
  }

   showAlert(){
     Alert(
      context: context,
      type: AlertType.error,
      title: "Finished!!",
      desc: "You've reached the end of the quiz",
      buttons: [
        DialogButton(
          child: Text(
            "Close",
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
          onPressed: () => Navigator.pop(context),
          width: 120,
        )
      ],
    ).show();
  }//Alert box widget...


  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Expanded(
          flex: 5,
          child: Padding(
            padding: EdgeInsets.all(10.0),
            child: Center(
              child: Text(
                quizBrain.getquestionText(),
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 25.0,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.all(15.0),
            child: FlatButton(
              textColor: Colors.white,
              color: Colors.green,
              child: Text(
                'True',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20.0,
                ),
              ),
              onPressed: () {
                checkAnswer(true);
              },
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.all(15.0),
            child: FlatButton(
              color: Colors.red,
              child: Text(
                'False',
                style: TextStyle(
                  fontSize: 20.0,
                  color: Colors.white,
                ),
              ),
              onPressed: (){
                checkAnswer(false);
              },
            ),
          ),
        ),
        Row(
          children: scoreKeeper
        )
      ],
    );
  }
}

/*
question1: 'You can lead a cow down stairs but not up stairs.', false,
question2: 'Approximately one quarter of human bones are in the feet.', true,
question3: 'A slug\'s blood is green.', true,
*/
