import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());

}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.lightBlue
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage  extends StatefulWidget {
  const MyHomePage ({ Key? key}) : super(key: key);

  @override
  _State createState() => _State();
}
   String strInput = "";
  final txtEntrada = TextEditingController();
  final txtResultado = TextEditingController();
class _State extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
 
    return  Scaffold(
      backgroundColor: const Color.fromRGBO(79, 79, 79, 0.5),
      appBar: AppBar(title: const Text("Calculadora")),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children:  <Widget>[
          Padding(padding: const EdgeInsets.symmetric(horizontal: 10.0),
          child: TextField(
            decoration: const InputDecoration.collapsed(hintText: "0", focusColor: Colors.white,
              hintStyle: 
                  TextStyle(fontSize: 40.0, fontWeight: FontWeight.bold),fillColor: Colors.white),
              style: 
                const TextStyle(fontSize: 40.0, fontWeight: FontWeight.bold, color: Colors.white),
                textAlign: TextAlign.right,
                controller: txtEntrada,
                onTap: () => FocusScope.of(context).requestFocus(FocusNode()),
            ),
          ),Padding(
           padding: const EdgeInsets.symmetric(horizontal: 10),
              child: TextField(
                decoration:  const InputDecoration.collapsed(
                    hintText: "",
                    fillColor: Colors.white,
                    hintStyle:  
                      TextStyle(fontSize: 40.0, fontWeight: FontWeight.bold), focusColor: Colors.white),
                textInputAction: TextInputAction.none,
                keyboardType: TextInputType.number,
                style: const TextStyle(
                    fontSize: 40.0,
                    color: Colors.white,
                    fontWeight: FontWeight.bold
                ),
                textAlign: TextAlign.right,
                controller: txtResultado,
                )),
               Container(
                  height: 40.0),
                     Row(
                         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                         children: <Widget>[
                            btnAC('AC', const Color.fromARGB(122, 217, 245 ,2)),
                            btnBorrar(),
                            boton('%',const Color.fromARGB(122, 217, 245 ,2)),
                            boton('/',const Color.fromARGB(122, 217, 245 ,2)),
                          ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget> [
                            boton('7',  const Color.fromARGB(122, 217, 245 ,2)),
                            boton('8',  const Color.fromARGB(122, 217, 245 ,2)),
                            boton('9', const Color.fromARGB(122, 217, 245 ,2)),
                            boton('*', const Color.fromARGB(122, 217, 245 ,2))
                          ],
                        ),
                        Row(
                             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: <Widget>[
                              boton('4',  const Color.fromARGB(122, 217, 245 ,2)),
                              boton('5',  const Color.fromARGB(122, 217, 245 ,2)),
                              boton('6', const Color.fromARGB(122, 217, 245 ,2)),
                              boton('-', const Color.fromARGB(122, 217, 245 ,2)),
                           ],),
                         Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                          boton('1',  const Color.fromARGB(122, 217, 245 ,2)),
                          boton('2',  const Color.fromARGB(122, 217, 245 ,2)),
                          boton('3',  const Color.fromARGB(122, 217, 245 ,2)),
                          boton('+',  const Color.fromARGB(122, 217, 245 ,2)),
                        ],),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: <Widget>[
                            boton('0', const Color.fromARGB(122, 217, 245 ,2)),
                            boton('.', const Color.fromARGB(122, 217, 245 ,2)),
                            btnIgual(),
                          ],),
                 ],
               )
          );
       }
       Widget boton(texto, Color boton){
         return Container(
           padding: const EdgeInsets.only(bottom: 20.0),
           child: Padding(
             padding: const EdgeInsets.all(15.0),
             child: ElevatedButton(
               child: Text(texto,
                      style: const  TextStyle(
                        fontSize: 25.0, color: Colors.white
                      ),),
               onPressed: () { 
                 setState(() {
                   txtEntrada.text = txtEntrada.text + texto;
                 });
                 
                },
                style: ElevatedButton.styleFrom(
                  primary: boton,
                  shape: const CircleBorder()
                  
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
               
               child: Text(texto,
                      style: const  TextStyle(
                        fontSize: 25.0, color: Colors.white
                      ),),
               onPressed: () { 
                 setState(() {
                   txtEntrada.text = "";
                   txtResultado.text = "";
                 });     
                },   
                style: ElevatedButton.styleFrom(
                  
                  primary: boton,
                  shape: const CircleBorder()
                  
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
                    child: const Icon(Icons.backspace, size: 35, color: Colors.white),
                    onPressed: () { 
                        txtEntrada.text = (txtEntrada.text.isNotEmpty)? 
                        (txtEntrada.text.substring(0, txtEntrada.text.length - 1)): "";   
                      },   
                      style: ElevatedButton.styleFrom(
                        primary: const Color.fromARGB(145, 180, 249, 1),
                        shape: const CircleBorder()
                        
                      ),               
                  ),         
                ),
              );
    }
     Widget btnIgual() {
        return Container(
          padding: const EdgeInsets.only(bottom: 10.0),
          child: ElevatedButton(
            child: const Text( '=',
              style: TextStyle(
                  fontSize: 28.0, color: Colors.white, fontWeight: FontWeight.bold),
            ),
            onPressed: () {
              
              setState(() {
               
              });
            },
            style:  ElevatedButton.styleFrom(
                        primary: const Color.fromARGB(145, 180, 249, 1),
                        shape: const CircleBorder()
            ),
          ),
        );
  }
}

