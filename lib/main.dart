import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Calculator',
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  double firstnum = 0;
  double secondnum = 0;
  String texttodisplay = "";
  String history = "";
  String res = "";
  String operation = "";
  String tempText = "";
  void btnclicked(String btnval) {
    if (btnval == 'C') {
      setState(() {
        texttodisplay = "";
        firstnum = 0;
        secondnum = 0;
        res = "";
        tempText = "";
      });
    } else if (btnval == "+" ||
        btnval == "-" ||
        btnval == "x" ||
        btnval == "/") {
      if (texttodisplay.isNotEmpty) {
        firstnum = double.parse(texttodisplay);
        setState(() {
          texttodisplay = texttodisplay + btnval;
        });
        tempText = texttodisplay;
        operation = btnval;
      }
    } else if (btnval == "=") {
      texttodisplay = res;
      secondnum = double.parse(texttodisplay);
      print(secondnum);
      if (operation == "+") {
        setState(() {
          res = (firstnum + secondnum).toString();
          texttodisplay = res;
        });
      }
      if (operation == "-") {
        setState(() {
          res = (firstnum - secondnum).toString();
          texttodisplay = res;
        });
      }
      if (operation == "x") {
        setState(() {
          res = (firstnum * secondnum).toString();
          texttodisplay = res;
        });
      }
      if (operation == "/") {
        setState(() {
          res = (firstnum / secondnum).toString();
          texttodisplay = res;
        });
      }
      res = "";
    } else {
      if (tempText.isEmpty) {
        setState(() {
          texttodisplay = (texttodisplay + btnval).toString();
          res = int.parse(texttodisplay).toString();
        });
      } else {
        setState(() {
          texttodisplay = (texttodisplay + btnval).toString();
          res = int.parse(texttodisplay.substring(
                  tempText.length, texttodisplay.length))
              .toString();
        });
      }
    }
  }

  Widget custombutton(String btnval) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(25.0),
        child: OutlinedButton(
          onPressed: () => btnclicked(btnval),
          child: Text(
            "$btnval",
            style: TextStyle(fontSize: 25.0),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text(
        'Calculator',
      )),
      body: SizedBox(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            Expanded(
              child: Container(
                padding: EdgeInsets.all(10.0),
                alignment: Alignment.bottomRight,
                child: Text(
                  //"Hello",
                  "$texttodisplay",
                  style: TextStyle(
                    fontSize: 30.0,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
            Row(
              children: <Widget>[
                custombutton("9"),
                custombutton("8"),
                custombutton("7"),
                custombutton("+"),
              ],
            ),
            Row(
              children: <Widget>[
                custombutton("6"),
                custombutton("5"),
                custombutton("4"),
                custombutton("-"),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
