import 'package:flutter/material.dart';
import 'quiz_brain.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

QuizBrain quizBrain = QuizBrain();

void main() {
  runApp(Quizzler());
}

class Quizzler extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home:Scaffold(
        backgroundColor: Colors.black,
        body:SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.0),
            child:QuizPage()
          ),
        )
      )
    );
  }
}

class QuizPage extends StatefulWidget {

  @override
  _QuizPageState createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {

  List <Widget> scoreKeeper = [];

  void checkAnswer(bool userPickedAnswer){
    bool correctAnswer = quizBrain.getAnswer();

        if(correctAnswer == userPickedAnswer){
          if(scoreKeeper.length - 1 <= quizBrain.getQuestionBank().length - 1){
            scoreKeeper.add(
              Icon(Icons.check,
              color: Colors.green,)
            );
          }else{
          Alert(context: context, title: "Completed", desc: "Questions Completed.").show();
            setState(() {
            quizBrain.goToFirstQuestion();
            scoreKeeper.removeRange(0, 13);
            });
          }
        }else{
            if(scoreKeeper.length <= quizBrain.getQuestionBank().length - 1){
            scoreKeeper.add(
              Icon(Icons.close,
              color: Colors.red,)
            );
          }else{
          Alert(context: context, title: "Completed", desc: "Questions Completed.").show();
            setState(() {
            quizBrain.goToFirstQuestion();
            scoreKeeper.removeRange(0,13);
            });
            
          }
        }

        setState(() {
            quizBrain.nextQuestion();
              });

  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget> [
        Expanded(
          flex: 5,
          child:Padding(
            padding: EdgeInsets.all(10.0),
            child: Center(
              child:Text(quizBrain.getQuestionText(),
              textAlign: TextAlign.center,
              style: TextStyle(color:Colors.white, fontSize: 30.0),
              )
            ),
          )
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.all(15.0),
              child:Center(
                child: TextButton(
                  style:ButtonStyle(backgroundColor: MaterialStateProperty.all(Colors.green)),
                  onPressed: (){
                    checkAnswer(true);
                  },
                  child: Text('True',
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.white, fontSize: 20.0),
                  )
                )
                )
              )
            ),
            Expanded(
            child: Padding(
              padding: EdgeInsets.all(15.0),
              child:Center(
                child: TextButton(
                  style:ButtonStyle(backgroundColor: MaterialStateProperty.all(Colors.red)),
                  onPressed: (){
                    checkAnswer(false);
                  },
                  child: Text('False',
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.white, fontSize: 20.0),
                  )
                )
                )
              )
            ),
            Row(
              children: scoreKeeper,
              )
      ],
    );
  }
}

