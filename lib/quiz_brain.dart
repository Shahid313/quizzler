import 'question.dart';

class QuizBrain {
  int _questionNumber = 0;
  List <Question>  _questionBank = [
    Question(q: 'You can lead a cow down stairs but not up stairs.', a: false),
    Question(q: 'Approximetly one quarter of human bones are in the feet.', a: true),
    Question(q: 'A slug\'s blood is green.', a: true),
    Question(q: 'A duck has four legs.', a: false),
    Question(q: 'A bed has four legs.', a: true),
    Question(q: 'Water formula is H3O.', a: false),
    Question(q: 'Dell laptop is the best laptop in the in the world.', a: false),
    Question(q: 'Tree color is red.', a: false),
    Question(q: 'A human being has 20 fingers.', a: true),
    Question(q: 'Fan is better than Air Condition.', a: false),
    Question(q: 'Health is wealth.', a: true),
    Question(q: 'Do good and have good.', a: true),
    Question(q: 'Do whatever you want.', a: false),
  ];

  void nextQuestion(){
    if(_questionNumber < _questionBank.length - 1){
      _questionNumber++;
    }
  }

  String getQuestionText(){
    return _questionBank[_questionNumber].questionText;
  }

  bool getAnswer(){
    return _questionBank[_questionNumber].questionAnswer;
  }

  List getQuestionBank(){
    return _questionBank;
  }

void goToFirstQuestion(){
  _questionNumber = -1;
}
}