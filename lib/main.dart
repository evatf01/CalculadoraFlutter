import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Calculadora',
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
    return Scaffold(
        backgroundColor: const Color.fromARGB(250, 100, 100, 100),
        appBar: AppBar(title: const Text("Calculadora")),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: TextField(
                decoration: const InputDecoration.collapsed(
                    hintText: "0.0",
                    focusColor: Colors.white,
                    hintStyle:
                        TextStyle(fontSize: 40.0, fontWeight: FontWeight.bold),
                    fillColor: Colors.white),
                style: const TextStyle(
                    fontSize: 40.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
                textAlign: TextAlign.right,
                controller: txtEntrada,
                onTap: () => FocusScope.of(context).requestFocus(FocusNode()),
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
            Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                btnAC('AC', const Color.fromARGB(250, 100, 100, 100)),
                btnBorrar(),
                boton('%'),
                boton('/'),
              ],
            ),
            Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                boton('7'),
                boton('8'),
                boton('9'),
                boton('*')
              ],
            ),
            Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                boton('4'),
                boton('5'),
                boton('6'),
                boton('-'),
              ],
            ),
            Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                boton('1'),
                boton('2'),
                boton('3'),
                boton('+'),
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
                const Color.fromARGB(250, 100, 100, 100)),
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30.0),
                  side: const BorderSide(
                      width: 3.5, color: Color.fromARGB(200, 108, 207, 235))),
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
                color: Colors.white),
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
                const Color.fromARGB(250, 100, 100, 100)),
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30.0),
                  side: const BorderSide(
                      width: 3.5, color: Color.fromARGB(200, 108, 207, 235))),
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
          child: const Icon(Icons.backspace, size: 30, color: Colors.white),
          onPressed: () {
            txtEntrada.text = (txtEntrada.text.isNotEmpty)
                ? (txtEntrada.text.substring(0, txtEntrada.text.length - 1))
                : "";
          },
          style: ButtonStyle(
            minimumSize: MaterialStateProperty.all(const Size(85.0, 85.0)),
            backgroundColor: MaterialStateProperty.all<Color>(
                const Color.fromARGB(250, 100, 100, 100)),
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30.0),
                  side: const BorderSide(
                      width: 3.5, color: Color.fromARGB(200, 108, 207, 235))),
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
        child: ElevatedButton(
          child: const Text(
            '=',
            style: TextStyle(
                fontSize: 35.0,
                color: Colors.white,
                fontWeight: FontWeight.bold),
          ),
          onPressed: () {
            setState(() {
              txtResultado.text = txtEntrada.text;
            });
          },
          style: ButtonStyle(
            minimumSize: MaterialStateProperty.all(const Size(155.0, 85.0)),
            backgroundColor: MaterialStateProperty.all<Color>(
                const Color.fromARGB(250, 100, 100, 100)),
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(25.0),
                  side: const BorderSide(
                      width: 3.5, color: Color.fromARGB(200, 108, 207, 235))),
            ),
          ),
        ),
      ),
    );
  }
}
