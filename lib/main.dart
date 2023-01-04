import 'package:flutter/material.dart';
import 'WebSocket.dart';

void main() {
  // WidgetsFlutterBinding.ensureInitialized();
  // await Firebase.initializeApp(
  //  options: DefaultFirebaseOptions.currentPlatform,
  // );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false, home: Home());
  }
}

class Home extends StatefulWidget {
  @override
  HomeStart createState() => HomeStart();
}

class HomeStart extends State<Home> {
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Remote control app',
      home: Scaffold(
          appBar: AppBar(
            title: Text('Control App'),
            backgroundColor: Color(0xFFFF01350b),
          ),
          body: SingleChildScrollView(
            child: Center(
              child: Column(
                children: [
                  Container(
                    width: 300,
                    height: 300,

                  ),
                  Padding(padding: EdgeInsets.only(top: 20),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Color(0xFFFF01350b), minimumSize: Size(400, 50)),
                    onPressed: (){
                      Navigator.push(
                          context, MaterialPageRoute(builder: (_) => WebSocket()));
                    },
                    child: Text('Entrar', style: TextStyle(color: Colors.white, fontSize: 20),),
                  ),)
                ],
              ),
            ),
          )),
    );
  }
}
