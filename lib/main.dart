import 'package:flutter/material.dart';
import 'package:homecontroller/HomeControl.dart';
import 'Light/WebSocket.dart';
import 'HomeControl.dart';

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
        body: SingleChildScrollView(
          child: Container(
            //height: 800,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("img/back_2.png"),
                opacity: 0.95,
                fit: BoxFit.fitHeight,
              ),
            ),
            child: Center(
              child: Column(
                children: [
                  Container(
                    margin: EdgeInsets.only(top: 30, bottom: 10),
                    // color: Colors.white.withOpacity(0.7),
                    decoration: BoxDecoration(
                        // borderRadius: BorderRadius.all(Radius.circular(80)),
                        // color: Colors.white.withOpacity(0.7),
                        ),
                    alignment: Alignment.center,
                    width: 200,
                    height: 250,
                    child: Image.asset('img/User_3.png'),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 10),
                    child: TextField(
                      //controller: correo,
                      style: TextStyle(color: Colors.white, fontSize: 20),

                      decoration: InputDecoration(
                        icon: Container(
                          child: Icon(
                            Icons.account_circle_outlined,
                            color: Colors.black,
                            size: 40,
                          ),
                        ),
                        // filled: true,
                        // fillColor: Color(0xFFFF485CF0).withOpacity(0.6),
                        /*border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),*/
                        labelText: 'Usuario',
                        hintText: 'Usuario',
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 10),
                    child: TextField(
                      //controller: correo,
                      style: TextStyle(color: Colors.white, fontSize: 20),

                      decoration: InputDecoration(
                        icon: Container(
                          child: Icon(
                            Icons.key,
                            color: Colors.black,
                            size: 40,
                          ),
                        ),
                        /* filled: true,
                      fillColor: Color(0xFFFF485CF0).withOpacity(0.6),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),*/
                        labelText: 'Password',
                        hintText: 'Password',
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(bottom: 1, top: 30),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Color(0xFFFF57ACFF).withOpacity(0.3),
                          minimumSize: Size(400, 50)),
                      onPressed: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (_) => HomeControl()));
                      },
                      child: Text(
                        'Ingresar',
                        style: TextStyle(color: Colors.white, fontSize: 18),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(bottom: 5, top: 1),
                    child: TextButton(
                      onPressed: () {
                        //Navigator.push(context,
                           // MaterialPageRoute(builder: (_) => HomeControl()));
                      },
                      child: Text(
                        'Olvidé mi contraseña',
                        style: TextStyle(color: Colors.white, fontSize: 18),
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 5,bottom: 60),
                 child: Row(
                    children: [

                      Expanded(
                        child: Padding(
                          padding: EdgeInsets.only(top: 5,bottom:5),
                          child: IconButton(
                            onPressed: () {},
                            icon: Icon(
                              Icons.g_mobiledata,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: Padding(
                          padding: EdgeInsets.only(top: 5,bottom:5),
                          child: IconButton(
                            onPressed: () {},
                            icon: Icon(
                              Icons.facebook,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: Padding(
                          padding: EdgeInsets.only(top: 3,bottom:5,left: 50,right: 5),
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                alignment: Alignment.bottomCenter,
                                backgroundColor: Color(0xFFFF57ACFF).withOpacity(0.5),
                                minimumSize: Size(1, 70)),
                            onPressed: () {},
                            //child: Text('huella',textAlign: TextAlign.center,),
                            child: Image.asset('img/Huella_1.png',height: 60,alignment: Alignment.center),
                            ),
                          ),
                        ),

                    ],
                  ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
