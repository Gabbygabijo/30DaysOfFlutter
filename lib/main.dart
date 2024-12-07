import 'package:aflutterapp/flashcard.dart';
import 'package:aflutterapp/flashcard_view.dart';
import 'package:flip_card/flip_card.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<StatefulWidget> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final List<Flashcard> _flashcards = [
    Flashcard(
        question: 'What programmimg language does flutter use?',
        answer: 'Dart'),
    Flashcard(
        question: 'Who is your go to person?',
        answer: 'Ghost'),
    Flashcard(
        question: 'Who thought you programming with flutter?',
        answer: 'Kilo Loco'),
  ];

  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                width: 250,
                height: 250,
                child: FlipCard(
                    front: FlashcardView(
                      text: _flashcards[_currentIndex].question,
                    ),
                    back: FlashcardView(
                      text: _flashcards[_currentIndex].answer,
                    )),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  OutlinedButton.icon(
                    onPressed: showPreviousCard,
                    label: Text('Prev'),
                    icon: Icon(Icons.chevron_left),
                  ),
                  OutlinedButton.icon(
                    onPressed: showNextCard,
                    label: Text('Next'),
                    icon: Icon(Icons.chevron_right),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  void showNextCard() {
    setState(() {
      _currentIndex = (_currentIndex + 1 < _flashcards.length) ? _currentIndex + 1 : 0;
    });
  }

  void showPreviousCard() {
    setState(() {
      _currentIndex = (_currentIndex -1 >= 0) ? _currentIndex -1 : _flashcards.length -1;
    });
  }

}
