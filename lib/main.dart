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

String strInput = "";
final txtEntrada = TextEditingController();
final txtResultado = TextEditingController();

class _State extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color.fromARGB(250, 184, 183, 181),
        appBar: AppBar(title: const Text("Calculadora")),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: TextField(
                decoration: const InputDecoration.collapsed(
                    hintText: "0.0",
                    focusColor: Colors.black,
                    hintStyle:
                        TextStyle(fontSize: 40.0, fontWeight: FontWeight.bold),
                    fillColor: Colors.black),
                style: const TextStyle(
                    fontSize: 40.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.black),
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
                      fillColor: Colors.black,
                      hintStyle: TextStyle(
                          fontSize: 40.0, fontWeight: FontWeight.bold),
                      focusColor: Colors.black),
                  style: const TextStyle(
                      fontSize: 40.0,
                      color: Colors.black,
                      fontWeight: FontWeight.bold),
                  textAlign: TextAlign.right,
                  controller: txtResultado,
                )),
            Container(height: 60.0),
            Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                btnAC('AC', const Color.fromARGB(250, 169, 200, 250)),
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
      padding: const EdgeInsets.only(bottom: 10.0),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
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
              txtEntrada.text = txtEntrada.text + texto;
            });
          },
          style: ButtonStyle(
            minimumSize: MaterialStateProperty.all(const Size(78.0, 78.0)),
            backgroundColor: MaterialStateProperty.all<Color>(
                const Color.fromARGB(250, 167, 223, 251)),
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30.0),
                  side: const BorderSide(
                      width: 2.0, color: Color.fromARGB(200, 51, 91, 132))),
            ),
          ),
        ),
      ),
    );
  }

  Widget btnAC(texto, Color boton) {
    return Container(
      padding: const EdgeInsets.only(bottom: 10.0),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
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
            minimumSize: MaterialStateProperty.all(const Size(78.0, 78.0)),
            backgroundColor: MaterialStateProperty.all<Color>(
                const Color.fromARGB(250, 167, 223, 251)),
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30.0),
                  side: const BorderSide(
                      width: 2.0, color: Color.fromARGB(200, 51, 91, 132))),
            ),
          ),
        ),
      ),
    );
  }

  Widget btnBorrar() {
    return Container(
      padding: const EdgeInsets.only(bottom: 10.0),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ElevatedButton(
          child: const Icon(Icons.backspace, size: 30, color: Colors.black),
          onPressed: () {
            txtEntrada.text = (txtEntrada.text.isNotEmpty)
                ? (txtEntrada.text.substring(0, txtEntrada.text.length - 1))
                : "";
          },
          style: ButtonStyle(
            minimumSize: MaterialStateProperty.all(const Size(78.0, 78.0)),
            backgroundColor: MaterialStateProperty.all<Color>(
                const Color.fromARGB(250, 167, 223, 251)),
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30.0),
                  side: const BorderSide(
                      width: 2.0, color: Color.fromARGB(200, 51, 91, 132))),
            ),
          ),
        ),
      ),
    );
  }

  Widget btnIgual() {
    return Container(
      padding: const EdgeInsets.only(bottom: 10.0),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ElevatedButton(
          child: const Text(
            '=',
            style: TextStyle(
                fontSize: 28.0,
                color: Colors.black,
                fontWeight: FontWeight.bold),
          ),
          onPressed: () {
            setState(() {
              txtResultado.text = txtEntrada.text;
            });
          },
          style: ButtonStyle(
            minimumSize: MaterialStateProperty.all(const Size(100.0, 78.0)),
            backgroundColor: MaterialStateProperty.all<Color>(
                const Color.fromARGB(250, 167, 223, 251)),
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(25.0),
                  side: const BorderSide(
                      width: 2.0, color: Color.fromARGB(200, 51, 91, 132))),
            ),
          ),
        ),
      ),
    );
  }
}
