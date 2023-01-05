import 'package:colorviu/models/ishihara_questions.dart';
import 'package:colorviu/models/user.dart';
import 'package:colorviu/services/auth.dart';
import 'package:colorviu/services/database.dart';
import 'package:colorviu/tests/ishihara/question_widget.dart';
import 'package:colorviu/tests/ishihara/result_box.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Ishihara extends StatefulWidget {
  const Ishihara({super.key});
  @override
  State<Ishihara> createState() => _IshiharaState();
}

class _IshiharaState extends State<Ishihara> {
  final List<Question> _questions = [
    Question(
      id: 1,
      question: 'assets/i_1.png',
      answer: 7,
    ),
    Question(
      id: 2,
      question: 'assets/i_2.png',
      answer: 0,
    ),
    Question(
      id: 3,
      question: 'assets/i_3.png',
      answer: 1,
    ),
    Question(
      id: 4,
      question: 'assets/i_4.png',
      answer: 4,
    ),
    Question(
      id: 5,
      question: 'assets/i_5.png',
      answer: 2,
    ),
    Question(
      id: 6,
      question: 'assets/i_6.png',
      answer: 3,
    ),
    Question(
      id: 7,
      question: 'assets/i_7.png',
      answer: 5,
    ),
    Question(
      id: 8,
      question: 'assets/i_8.png',
      answer: 9,
    ),
    Question(
      id: 9,
      question: 'assets/i_9.png',
      answer: 2,
    ),
    Question(
      id: 10,
      question: 'assets/i_10.png',
      answer: 8,
    ),
    Question(
      id: 11,
      question: 'assets/i_11.png',
      answer: 7,
    ),
    Question(
      id: 12,
      question: 'assets/i_12.png',
      answer: 4,
    ),
    Question(
      id: 13,
      question: 'assets/i_13.png',
      answer: 6,
    ),
    Question(
      id: 14,
      question: 'assets/i_14.png',
      answer: 1,
    ),
    Question(
      id: 15,
      question: 'assets/i_15.png',
      answer: 8,
    ),
    Question(
      id: 16,
      question: 'assets/i_6.png',
      answer: 5,
    ),
  ]..shuffle();

  List wrong = [];

  double progress = 0.0;
  int index = 0;
  int score = 0;
  bool isPressed = false;
  bool isAlreadySelected = false;
  int _currentOption = 0;

  String deficiency = '';
  String statement = '';

  List wrongDeu = [1, 2, 3, 4];
  List wrongProtanomaly = [5, 6];
  List wrongProtanopia = [7, 8];
  List wrongTri = [9, 10, 11, 12];

  late String userid;

  void nextQuestion() {
    if (index == _questions.length - 1) {
      findStatement();;
      showDialog(
          context: context,
          barrierDismissible: false,
          builder: (ctx) => ResultBox(
                result: score,
                questionLength: _questions.length,
                onPressed: () => startOver(),
                deficiency: deficiency,
                statement: statement,
              ));
    } else {
      if (isPressed == true) {
        setState(() {
          index++;
          isPressed = false;
          isAlreadySelected = false;
          _currentOption = 0;
          progress += 0.067;
        });
      } else {
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text('Please select an Answer'),
          behavior: SnackBarBehavior.floating,
          margin: EdgeInsets.symmetric(vertical: 20),
        ));
      }
    }
  }

  void findStatement() {
    final deutan = wrong.toSet().intersection(wrongDeu.toSet());
    final protanomaly = wrong.toSet().intersection(wrongProtanomaly.toSet());
    final protanopia = wrong.toSet().intersection(wrongProtanopia.toSet());
    final tritan = wrong.toSet().intersection(wrongTri.toSet());

    if (wrong.length >= 3) {
      if (protanomaly.length > protanopia.length &&
          protanomaly.length > deutan.length) {
        deficiency = 'Protanomaly';
        statement = 'Partially Severe Color Deficiency';
      } else if (tritan.length >= 3 || wrong.length >= 12) {
        deficiency = 'Tritanopia';
        statement = 'Severe Color Deficiency';
      } else if (deutan.length < 3 &&
          deutan.length > protanomaly.length &&
          deutan.length > protanopia.length) {
        deficiency = 'Deuteranomaly';
        statement = 'Partially Severe Color Deficiency';
      } else if (deutan.length < protanopia.length &&
          protanopia.length > protanomaly.length) {
        deficiency = 'Protanopia';
        statement = 'Severe Color Deficiency';
      } else if (deutan.length > protanopia.length &&
          deutan.length > protanomaly.length &&
          deutan.length >= 3) {
        deficiency = 'Deuteranopia';
        statement = 'Severe Color Deficiency';
      } else if (tritan.length < 2 || wrong.length >= 8 && wrong.length < 12) {
        deficiency = 'Tritanomaly';
        statement = 'Partially Severe Color Deficiency';
      }
    } else {
      deficiency = 'Trichromacy';
      statement = 'Normal Color Vision';
    }
  }

  void checkAnswerAndUpdate(int value) {
    if (value == _questions[index].answer) {
      score++;
      // ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
      //   content: Text('Correct!'),
      //   behavior: SnackBarBehavior.floating,
      //   margin: EdgeInsets.symmetric(vertical: 20),
      // ));
    } else {
      wrong.add(_questions[index].id);
      //print(wrong);
      // ScaffoldMessenger.of(context).showSnackBar(
      //   const SnackBar(
      //   content: Text('Wrong!'),
      //   behavior: SnackBarBehavior.floating,
      //   margin: EdgeInsets.symmetric(vertical: 20),
      // ));
    }
    setState(() {
      isPressed = true;
      isAlreadySelected = true;
      nextQuestion();
    });
  }

  void startOver() {
    DatabaseService(uid: userid).createResult(
          userid, 'Ishihara Test', deficiency, statement, DateTime.now());
    Navigator.pushNamed(context, '/results');
  }

  final AuthService _auth = AuthService();

  @override
  Widget build(BuildContext context) {
    final uid = Provider.of<MyUser>(context);
    userid = uid.uid;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.brown[50],
      appBar: AppBar(
        title: const Text('Ishihara Test'),
        backgroundColor: Colors.brown[400],
        elevation: 0,
        shadowColor: Colors.transparent,
        actions: [
          // Padding(
          //   padding: const EdgeInsets.all(18),
          //   child: Text(
          //     'Score: $score',
          //     style: const TextStyle(fontSize: 18),
          //   ),
          // ),
          ElevatedButton.icon(
              icon: const Icon(Icons.person),
              label: const Text('logout'),
              onPressed: () async {
                await _auth.signOut();
              }),
        ],
      ),
      body: SingleChildScrollView(
          child: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(children: [
          const SizedBox(height: 10),
          QuestionWidget(indexAction: index, totalQuestions: _questions.length),
          Align(
            alignment: Alignment.topLeft,
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: ClipRRect(
                borderRadius: const BorderRadius.all(Radius.circular(10)),
                child: LinearProgressIndicator(
                  backgroundColor: Colors.red,
                  valueColor: const AlwaysStoppedAnimation(Colors.green),
                  value: progress,
                  minHeight: 25,
                ),
              ),
            ),
          ),
          const Divider(color: null),
          Image(
            image: AssetImage(_questions[index].question),
          ),
          const Divider(color: null),
          const SizedBox(height: 20),
          Slider(
            value: (_currentOption).toDouble(),
            min: 0,
            max: 9,
            divisions: 9,
            label: _currentOption.round().toString(),
            onChanged: (val) => setState(() => _currentOption = val.round()),
          ),
          const SizedBox(height: 30),
          SizedBox(
            height: 70,
            width: 150,
            child: ElevatedButton(
              style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all<Color>(Colors.pink[400]!),
                  textStyle: MaterialStateProperty.all(
                      const TextStyle(color: Colors.white, fontSize: 35))),
              onPressed: () async {
                setState(() {
                  checkAnswerAndUpdate(_currentOption);
                });
              },
              child: const Text('Next'),
            ),
          ),
        ]),
      )),
    );
  }
}
