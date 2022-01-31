import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';
import 'package:flutter/services.dart';
import 'dart:math';
import 'dart:math' show pi;

void main() {
  runApp(MyApp(txtEntrada2.text.toString()));
}

class MyApp extends StatelessWidget {
  const MyApp(String string, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Calculadora',
      debugShowCheckedModeBanner: false,
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  _State createState() => _State();
}

final txtEntrada = TextEditingController();
final txtResultado = TextEditingController();

class _State extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
        overlays: [SystemUiOverlay.bottom]);
    return Scaffold(
        backgroundColor: const Color.fromARGB(250, 30, 30, 30),
        appBar: AppBar(
          backgroundColor: const Color.fromARGB(250, 30, 30, 30),
          title: const Text(
            "",
            style: TextStyle(
              color: Colors.white,
              fontSize: 24.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          actions: <Widget>[
            Padding(
              padding: const EdgeInsets.all(5.0),
              child: IconButton(
                icon: const Icon(
                  Icons.calculate,
                  color: Colors.white,
                  size: 40.0,
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const CalculadoraAvanzada()),
                  );
                },
              ),
            )
          ],
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: TextField(
                decoration: const InputDecoration.collapsed(
                    hintText: "0.0",
                    focusColor: Colors.white,
                    hintStyle: TextStyle(
                        fontSize: 40.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                    fillColor: Colors.white),
                style: const TextStyle(
                    fontSize: 40.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
                textAlign: TextAlign.right,
                controller: txtEntrada,
              ),
            ),
            Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: TextField(
                  decoration: const InputDecoration.collapsed(
                      hintText: "",
                      fillColor: Colors.white,
                      hintStyle: TextStyle(
                          fontSize: 40.0, fontWeight: FontWeight.bold),
                      focusColor: Colors.white),
                  style: const TextStyle(
                      fontSize: 40.0,
                      color: Colors.white,
                      fontWeight: FontWeight.bold),
                  textAlign: TextAlign.right,
                  controller: txtResultado,
                )),
            Container(height: 70.0),
            Padding(
              padding: const EdgeInsets.only(left: 90.0),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  btnAC('AC', const Color.fromARGB(250, 100, 100, 100)),
                  btnBorrar(),
                  botonOperdaor('/'),
                ],
              ),
            ),
            Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                boton('7'),
                boton('8'),
                boton('9'),
                botonOperdaor('*')
              ],
            ),
            Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                boton('4'),
                boton('5'),
                boton('6'),
                botonOperdaor('-'),
              ],
            ),
            Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                boton('1'),
                boton('2'),
                boton('3'),
                botonOperdaor('+'),
              ],
            ),
            Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                boton('0'),
                boton('.'),
                btnIgual(),
              ],
            ),
          ],
        ));
  }

  Widget boton(texto) {
    return Container(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Padding(
        padding: const EdgeInsets.all(3.0),
        child: ElevatedButton(
          child: Text(
            texto,
            style: const TextStyle(
                fontSize: 27.0,
                fontWeight: FontWeight.bold,
                color: Colors.white),
          ),
          onPressed: () {
            setState(() {
              txtEntrada.text = txtEntrada.text + texto;
            });
          },
          style: ButtonStyle(
            minimumSize: MaterialStateProperty.all(const Size(85.0, 85.0)),
            backgroundColor: MaterialStateProperty.all<Color>(
                const Color.fromARGB(250, 30, 30, 30)),
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30.0),
                  side: const BorderSide(
                      width: 3.5, color: Color.fromARGB(250, 229, 197, 139))),
            ),
          ),
        ),
      ),
    );
  }

  Widget botonOperdaor(texto) {
    return Container(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Padding(
        padding: const EdgeInsets.all(3.0),
        child: ElevatedButton(
          child: Text(
            texto,
            style: const TextStyle(
                fontSize: 27.0,
                fontWeight: FontWeight.bold,
                color: Colors.black),
          ),
          onPressed: () {
            setState(() {
              txtEntrada.text = txtEntrada.text + texto;
            });
          },
          style: ButtonStyle(
            minimumSize: MaterialStateProperty.all(const Size(85.0, 85.0)),
            backgroundColor: MaterialStateProperty.all<Color>(
                const Color.fromARGB(250, 244, 217, 168)),
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30.0),
                  side: const BorderSide(width: 3.5, color: Colors.black)),
            ),
          ),
        ),
      ),
    );
  }

  Widget btnAC(texto, Color boton) {
    return Container(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Padding(
        padding: const EdgeInsets.all(3.0),
        child: ElevatedButton(
          child: Text(
            texto,
            style: const TextStyle(
                fontSize: 25.0,
                fontWeight: FontWeight.bold,
                color: Colors.black),
          ),
          onPressed: () {
            setState(() {
              txtEntrada.text = "";
              txtResultado.text = "";
            });
          },
          style: ButtonStyle(
            minimumSize: MaterialStateProperty.all(const Size(85.0, 85.0)),
            backgroundColor: MaterialStateProperty.all<Color>(
                const Color.fromARGB(250, 244, 217, 168)),
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30.0),
                  side: const BorderSide(width: 3.5, color: Colors.black)),
            ),
          ),
        ),
      ),
    );
  }

  Widget btnBorrar() {
    return Container(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Padding(
        padding: const EdgeInsets.all(3.0),
        child: ElevatedButton(
          child: const Icon(Icons.backspace, size: 30, color: Colors.black),
          onPressed: () {
            txtEntrada.text = (txtEntrada.text.isNotEmpty)
                ? (txtEntrada.text.substring(0, txtEntrada.text.length - 1))
                : "";
          },
          style: ButtonStyle(
            minimumSize: MaterialStateProperty.all(const Size(85.0, 85.0)),
            backgroundColor: MaterialStateProperty.all<Color>(
                const Color.fromARGB(250, 244, 217, 168)),
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30.0),
                  side: const BorderSide(width: 3.5, color: Colors.black)),
            ),
          ),
        ),
      ),
    );
  }

  Widget btnIgual() {
    return Container(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Padding(
        padding: const EdgeInsets.all(5.0),
        child: Padding(
          padding: const EdgeInsets.only(left: 1.0),
          child: ElevatedButton(
            child: const Text(
              '=',
              style: TextStyle(
                  fontSize: 35.0,
                  color: Colors.black,
                  fontWeight: FontWeight.bold),
            ),
            onPressed: () {
              setState(() {
                calcular();
              });
            },
            style: ButtonStyle(
              minimumSize: MaterialStateProperty.all(const Size(165.0, 85.0)),
              backgroundColor: MaterialStateProperty.all<Color>(
                  const Color.fromARGB(250, 244, 217, 168)),
              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25.0),
                    side: const BorderSide(width: 3.5, color: Colors.black)),
              ),
            ),
          ),
        ),
      ),
    );
  }

  void calcular() {
    if (txtEntrada2.text.toString().isNotEmpty) {
      txtEntrada.text = txtEntrada2.text.toString();
    } else {
      txtEntrada.text = txtEntrada2.text.toString();
    }
    try {
      Parser p = Parser();
      ContextModel cm = ContextModel();
      Expression exp = p.parse(txtEntrada.text);
      setState(() {
        txtResultado.text =
            exp.evaluate(EvaluationType.REAL, cm).toStringAsPrecision(3);
      });
    } catch (e) {
      setState(() {
        txtResultado.text = "Error";
      });
    }
  }
}

/*----------------------------------------------*/

class CalculadoraAvanzada extends StatefulWidget {
  const CalculadoraAvanzada({Key? key}) : super(key: key);

  @override
  _State2 createState() => _State2();
}

final txtEntrada2 = TextEditingController();
final txtResultado2 = TextEditingController();

class _State2 extends State<CalculadoraAvanzada> {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
        overlays: [SystemUiOverlay.bottom]);
    return Scaffold(
        backgroundColor: const Color.fromARGB(250, 40, 40, 40),
        appBar: AppBar(
          backgroundColor: const Color.fromARGB(250, 40, 40, 40),
          title: const Text(
            "",
            style: TextStyle(
              color: Colors.black,
              fontSize: 24.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          actions: <Widget>[
            Padding(
              padding: const EdgeInsets.all(5.0),
              child: IconButton(
                icon: const Icon(
                  Icons.calculate,
                  color: Colors.white,
                  size: 40.0,
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            MyApp(txtEntrada2.text.toString())),
                  );
                },
              ),
            )
          ],
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: TextField(
                decoration: const InputDecoration.collapsed(
                    hintText: "0.0",
                    focusColor: Colors.white,
                    hintStyle: TextStyle(
                        fontSize: 40.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                    fillColor: Colors.white),
                style: const TextStyle(
                    fontSize: 40.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
                textAlign: TextAlign.right,
                controller: txtEntrada2,
              ),
            ),
            Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: TextField(
                  decoration: const InputDecoration.collapsed(
                      hintText: "",
                      fillColor: Colors.white,
                      hintStyle: TextStyle(
                          fontSize: 40.0, fontWeight: FontWeight.bold),
                      focusColor: Colors.white),
                  style: const TextStyle(
                      fontSize: 40.0,
                      color: Colors.white,
                      fontWeight: FontWeight.bold),
                  textAlign: TextAlign.right,
                  controller: txtResultado2,
                )),
            Container(height: 70.0),
            Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                btnAC('AC', const Color.fromARGB(250, 100, 100, 100)),
                btnBorrar(),
                botonOperdaor('('),
                botonOperdaor(')'),
              ],
            ),
            Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                boton('7'),
                boton('8'),
                boton('9'),
                botonRaiz('√')
              ],
            ),
            Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                boton('4'),
                boton('5'),
                boton('6'),
                botonPi('π'),
              ],
            ),
            Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                boton('1'),
                boton('2'),
                boton('3'),
                botonOperdaor('^'),
              ],
            ),
            Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                boton('0'),
                boton('.'),
                btnIgual(),
              ],
            ),
          ],
        ));
  }

  Widget boton(texto) {
    return Container(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Padding(
        padding: const EdgeInsets.all(3.0),
        child: ElevatedButton(
          child: Text(
            texto,
            style: const TextStyle(
                fontSize: 27.0,
                fontWeight: FontWeight.bold,
                color: Colors.white),
          ),
          onPressed: () {
            setState(() {
              txtEntrada2.text = txtEntrada2.text + texto;
            });
          },
          style: ButtonStyle(
            minimumSize: MaterialStateProperty.all(const Size(85.0, 85.0)),
            backgroundColor: MaterialStateProperty.all<Color>(
                const Color.fromARGB(250, 30, 30, 30)),
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30.0),
                  side: const BorderSide(
                      width: 3.5, color: Color.fromARGB(250, 229, 197, 139))),
            ),
          ),
        ),
      ),
    );
  }

  Widget botonOperdaor(texto) {
    return Container(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Padding(
        padding: const EdgeInsets.all(3.0),
        child: ElevatedButton(
          child: Text(
            texto,
            style: const TextStyle(
                fontSize: 27.0,
                fontWeight: FontWeight.bold,
                color: Colors.black),
          ),
          onPressed: () {
            setState(() {
              txtEntrada2.text = txtEntrada2.text + texto;
            });
          },
          style: ButtonStyle(
            minimumSize: MaterialStateProperty.all(const Size(85.0, 85.0)),
            backgroundColor: MaterialStateProperty.all<Color>(
                const Color.fromARGB(250, 244, 217, 168)),
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30.0),
                  side: const BorderSide(width: 3.5, color: Colors.black)),
            ),
          ),
        ),
      ),
    );
  }

  Widget btnAC(texto, Color boton) {
    return Container(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Padding(
        padding: const EdgeInsets.all(3.0),
        child: ElevatedButton(
          child: Text(
            texto,
            style: const TextStyle(
                fontSize: 25.0,
                fontWeight: FontWeight.bold,
                color: Colors.black),
          ),
          onPressed: () {
            setState(() {
              txtEntrada2.text = "";
              txtResultado2.text = "";
            });
          },
          style: ButtonStyle(
            minimumSize: MaterialStateProperty.all(const Size(85.0, 85.0)),
            backgroundColor: MaterialStateProperty.all<Color>(
                const Color.fromARGB(250, 244, 217, 168)),
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30.0),
                  side: const BorderSide(width: 3.5, color: Colors.black)),
            ),
          ),
        ),
      ),
    );
  }

  Widget btnBorrar() {
    return Container(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Padding(
        padding: const EdgeInsets.all(3.0),
        child: ElevatedButton(
          child: const Icon(Icons.backspace, size: 30, color: Colors.black),
          onPressed: () {
            txtEntrada2.text = (txtEntrada2.text.isNotEmpty)
                ? (txtEntrada2.text.substring(0, txtEntrada2.text.length - 1))
                : "";
          },
          style: ButtonStyle(
            minimumSize: MaterialStateProperty.all(const Size(85.0, 85.0)),
            backgroundColor: MaterialStateProperty.all<Color>(
                const Color.fromARGB(250, 244, 217, 168)),
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30.0),
                  side: const BorderSide(width: 3.5, color: Colors.black)),
            ),
          ),
        ),
      ),
    );
  }

  Widget btnIgual() {
    return Container(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Padding(
        padding: const EdgeInsets.all(5.0),
        child: Padding(
          padding: const EdgeInsets.only(left: 1.0),
          child: ElevatedButton(
            child: const Text(
              '=',
              style: TextStyle(
                  fontSize: 35.0,
                  color: Colors.black,
                  fontWeight: FontWeight.bold),
            ),
            onPressed: () {
              setState(() {
                calcular();
              });
            },
            style: ButtonStyle(
              minimumSize: MaterialStateProperty.all(const Size(165.0, 85.0)),
              backgroundColor: MaterialStateProperty.all<Color>(
                  const Color.fromARGB(250, 244, 217, 168)),
              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25.0),
                    side: const BorderSide(width: 3.5, color: Colors.black)),
              ),
            ),
          ),
        ),
      ),
    );
  }

  calcular() {
    try {
      Parser p2 = Parser();
      ContextModel cm2 = ContextModel();
      Expression exp = p2.parse(txtEntrada2.text);
      setState(() {
        txtResultado2.text =
            exp.evaluate(EvaluationType.REAL, cm2).toStringAsPrecision(3);
      });
    } catch (e) {
      setState(() {
        txtResultado2.text = "Error";
      });
    }
  }

  Widget botonPi(texto) {
    return Container(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Padding(
        padding: const EdgeInsets.all(3.0),
        child: ElevatedButton(
          child: Text(
            texto,
            style: const TextStyle(
                fontSize: 27.0,
                fontWeight: FontWeight.bold,
                color: Colors.black),
          ),
          onPressed: () {
            setState(() {
              txtEntrada2.text = pi.toStringAsPrecision(5);
            });
          },
          style: ButtonStyle(
            minimumSize: MaterialStateProperty.all(const Size(85.0, 85.0)),
            backgroundColor: MaterialStateProperty.all<Color>(
                const Color.fromARGB(250, 244, 217, 168)),
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30.0),
                  side: const BorderSide(width: 3.5, color: Colors.black)),
            ),
          ),
        ),
      ),
    );
  }

  botonRaiz(String texto) {
    return Container(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Padding(
        padding: const EdgeInsets.all(3.0),
        child: ElevatedButton(
          child: Text(
            texto,
            style: const TextStyle(
                fontSize: 25.0,
                fontWeight: FontWeight.bold,
                color: Colors.black),
          ),
          onPressed: () {
            setState(() {
              try {
                double num = double.parse(txtEntrada2.text);
                txtResultado2.text = sqrt(num).toStringAsPrecision(4);
              } catch (e) {
                setState(() {
                  txtResultado2.text = "Error";
                });
              }
            });
          },
          style: ButtonStyle(
            minimumSize: MaterialStateProperty.all(const Size(85.0, 85.0)),
            backgroundColor: MaterialStateProperty.all<Color>(
                const Color.fromARGB(250, 244, 217, 168)),
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30.0),
                  side: const BorderSide(width: 3.5, color: Colors.black)),
            ),
          ),
        ),
      ),
    );
  }
}
