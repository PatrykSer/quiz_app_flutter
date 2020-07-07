import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  final int resultScore;
  final Function resetHandler;

  Result(this.resultScore, this.resetHandler);

  String get resultPhrase {
    String resultText;
    if (resultScore == 3) {
      resultText = 'GodLike    3/3!';
    } else if (resultScore == 2) {
      resultText = 'Really nice  2/3!';
    } else if (resultScore == 1) {
      resultText = 'One more :D   1/3!';
    } else {
      resultText = 'Try again   0/3!';
    }
    return resultText;
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: <Widget>[
          Text(
            resultPhrase,
            style: TextStyle(fontSize: 36, fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
          FlatButton(
            child: Text(
              'Restart Quiz!',
            ),
            textColor: Colors.green,
            onPressed: resetHandler,
          ),
        ],
      ),
    );
  }
}
