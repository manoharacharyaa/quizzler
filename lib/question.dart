class Question {
  String questionText = 'q'; //provides some random (q & true) values
  bool questionAnswer = true; //because they can't have null values

  Question(String q, bool a) {
    //it helps in grouping question & answer
    questionText = q;
    questionAnswer = a;
  }
}

