import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Calculadora',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Calculadora(),
    );
  }
}

class Calculadora extends StatefulWidget {
  @override
  _CalculadoraState createState() => _CalculadoraState();
}

class _CalculadoraState extends State<Calculadora> {
  String display = '';

  String operador = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Calculadora'),
        backgroundColor: Colors.blue,
      ),
      body: Column(
        children: [
          _buildDisplay(),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Container(
              width: 280,
              height: 280,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  _buildButtons1(),
                  _buildButtons2(),
                  _buildButtons3(),
                  _buildButtons4(),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget _buildDisplay() {
    return Container(
      width: double.maxFinite,
      height: 80,
      margin: EdgeInsets.all(20),
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Color(0X8C1B5E20),
        borderRadius: BorderRadius.circular(10),
        border: Border.all(width: 2.0),
      ),
      child: Text(
        display,
        style: TextStyle(fontSize: 35, color: Colors.white),
        textAlign: TextAlign.end,
      ),
    );
  }

  Widget _buildButtons1() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Container(
          height: 55.0,
          width: 55.0,
          child: ElevatedButton(
            onPressed: () {
              addInDisplay('7');
            },
            child: Text("7"),
          ),
        ),
        Container(
            height: 55.0,
            width: 55.0,
            child: ElevatedButton(
                onPressed: () {
                  addInDisplay('8');
                },
                child: Text("8"))),
        Container(
            height: 55.0,
            width: 55.0,
            child: ElevatedButton(
                onPressed: () {
                  addInDisplay('9');
                },
                child: Text("9"))),
        Container(
            height: 55.0,
            width: 55.0,
            child: ElevatedButton(
                onPressed: () {
                  addInDisplay('/');
                  operador = "/";
                },
                child: Text("/"))),
      ],
    );
  }

  Widget _buildButtons2() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Container(
            height: 55.0,
            width: 55.0,
            child: ElevatedButton(
                onPressed: () {
                  addInDisplay('4');
                },
                child: Text("4"))),
        Container(
            height: 55.0,
            width: 55.0,
            child: ElevatedButton(
                onPressed: () {
                  addInDisplay('5');
                },
                child: Text("5"))),
        Container(
            height: 55.0,
            width: 55.0,
            child: ElevatedButton(
                onPressed: () {
                  addInDisplay('6');
                },
                child: Text("6"))),
        Container(
            height: 55.0,
            width: 55.0,
            child: ElevatedButton(
                onPressed: () {
                  addInDisplay('*');
                  operador = '*';
                },
                child: Text("*"))),
      ],
    );
  }

  Widget _buildButtons3() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Container(
          height: 55.0,
          width: 55.0,
          child: ElevatedButton(
              onPressed: () {
                addInDisplay('1');
              },
              child: Text("1")),
        ),
        Container(
          height: 55.0,
          width: 55.0,
          child: ElevatedButton(
              onPressed: () {
                addInDisplay('2');
              },
              child: Text("2")),
        ),
        Container(
          height: 55.0,
          width: 55.0,
          child: ElevatedButton(
              onPressed: () {
                addInDisplay('3');
              },
              child: Text("3")),
        ),
        Container(
          height: 55.0,
          width: 55.0,
          child: ElevatedButton(
              onPressed: () {
                addInDisplay('-');
                operador = '-';
              },
              child: Text("-")),
        ),
      ],
    );
  }

  Widget _buildButtons4() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Container(
          height: 55.0,
          width: 55.0,
          child: ElevatedButton(
              onPressed: () {
                clearDisplay();
              },
              child: Text("C")),
        ),
        Container(
            height: 55.0,
            width: 55.0,
            child: ElevatedButton(
                onPressed: () {
                  addInDisplay('0');
                },
                child: Text("0"))),
        Container(
          height: 55.0,
          width: 55.0,
          child: ElevatedButton(
              onPressed: () {
                calcular();
              },
              child: Text("=")),
        ),
        Container(
          height: 55.0,
          width: 55.0,
          child: ElevatedButton(
              onPressed: () {
                addInDisplay('+');
                operador = '+';
              },
              child: Text("+")),
        ),
      ],
    );
  }

  void calcular() {
    List<String> valores = display.split(operador);

    int valor1 = int.parse(valores[0]);
    int valor2 = int.parse(valores[1]);

    num resultado = 0;

    switch (operador) {
      case '-':
        resultado = valor1 - valor2;
        break;
      case '+':
        resultado = valor1 + valor2;
        break;
      case '*':
        resultado = valor1 * valor2;
        break;
      case '/':
        resultado = valor1 / valor2;
        break;
    }

    setState(() {
      display = resultado.toString();
    });
  }

  void addInDisplay(String text) {
    setState(() {
      display += text;
    });
  }

  void clearDisplay() {
    setState(() {
      display = '';
    });
  }
}
