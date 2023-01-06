import 'package:flutter/material.dart';
import 'package:homecontroller/Light/WebSocket.dart';

class ZoneSelecction extends StatefulWidget {
  ZoneSelecctionApp createState() => ZoneSelecctionApp();
}

class ZoneSelecctionApp extends State<ZoneSelecction> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ZONAS'),
        backgroundColor: Color(0xFFFF000000).withOpacity(0.9),
      ),
      body: SingleChildScrollView(
        child: Container(
          height: 650,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("img/Back_1.png"),
              fit: BoxFit.cover,
            ),
          ),

          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.only(top: 70, right: 5, left: 5),
                child: MaterialButton(

                  padding: EdgeInsets.only(top: 1,right: 1,left: 1,bottom:1),
                  textColor: Colors.white,
                  splashColor: Colors.white,
                  // elevation: 8.0,
                  color: Colors.blue.withOpacity(0.1),

                  child: Container(
                    width: 400,
                    height: 100,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.shade600,
                          spreadRadius: 1,
                          blurRadius: 1,
                          offset: const Offset(5, 5),
                        ),
                        const BoxShadow(
                            color: Colors.white,
                            offset: Offset(-5,-5),
                            blurRadius: 15,
                            spreadRadius: 1
                        ) ,
                      ],
                      gradient: LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        colors: [
                          Colors.grey.shade200,
                          Colors.grey.shade300,
                          Colors.grey.shade400,
                          Colors.grey.shade500,
                        ],
                      ),
                      image: DecorationImage(
                          image: AssetImage('img/Zone_6.jpg'),
                          fit: BoxFit.cover),
                    ),
                    child: Center(
                      //padding: const EdgeInsets.all(1),
                      child: Text("ZONA 1",style: TextStyle(fontSize: 20),textAlign: TextAlign.right,),
                      //),
                    ),
                  ),
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (_) => WebSocket('1',"ws://192.168.0.170:81")));
                  },
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 10, right: 5, left: 5),
                child: MaterialButton(

                  padding: EdgeInsets.only(top: 1,right: 1,left: 1,bottom:1),
                  textColor: Colors.white,
                  splashColor: Colors.white,
                  // elevation: 8.0,
                  color: Colors.blue.withOpacity(0.1),

                  child: Container(
                    width: 400,
                    height: 100,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.shade600,
                          spreadRadius: 1,
                          blurRadius: 1,
                          offset: const Offset(5, 5),
                        ),
                        const BoxShadow(
                            color: Colors.white,
                            offset: Offset(-5,-5),
                            blurRadius: 15,
                            spreadRadius: 1
                        ) ,
                      ],
                      gradient: LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        colors: [
                          Colors.grey.shade200,
                          Colors.grey.shade300,
                          Colors.grey.shade400,
                          Colors.grey.shade500,
                        ],
                      ),
                      image: DecorationImage(
                          image: AssetImage('img/Zone_6.jpg'),
                          fit: BoxFit.cover),
                    ),
                    child: Center(
                      //padding: const EdgeInsets.all(1),
                      child: Text("ZONA 2",style: TextStyle(fontSize: 20),textAlign: TextAlign.center,),
                      //),
                    ),
                  ),
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (_) => WebSocket('2',"ws://192.168.0.171:81")));
                  },
                ),
              ),
                 Padding(
                padding: EdgeInsets.only(top: 10, right: 5, left: 5),
                child: MaterialButton(

                 padding: EdgeInsets.only(top: 1,right: 1,left: 1,bottom:1),
                  textColor: Colors.white,
                  splashColor: Colors.white,
                  // elevation: 8.0,
                  color: Colors.blue.withOpacity(0.1),

                  child: Container(
                    width: 400,
                    height: 100,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.shade600,
                          spreadRadius: 1,
                          blurRadius: 1,
                          offset: const Offset(5, 5),
                        ),
                        const BoxShadow(
                            color: Colors.white,
                            offset: Offset(-5,-5),
                            blurRadius: 15,
                            spreadRadius: 1
                        ) ,
                      ],
                      gradient: LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        colors: [
                          Colors.grey.shade200,
                          Colors.grey.shade300,
                          Colors.grey.shade400,
                          Colors.grey.shade500,
                        ],
                      ),
                      image: DecorationImage(
                          image: AssetImage('img/Zone_6.jpg'),
                          fit: BoxFit.cover),
                    ),
                    child: Center(
                      //padding: const EdgeInsets.all(1),
                      child: Text("ZONA 3",style: TextStyle(fontSize: 20),textAlign: TextAlign.center,),
                      //),
                    ),
                  ),
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (_) => WebSocket('3',"ws://192.168.0.172:81")));
                  },
                ),
              ),
            Padding(
                padding: EdgeInsets.only(top: 10, right: 5, left: 5),
                child: MaterialButton(

                  padding: EdgeInsets.only(top: 1,right: 1,left: 1,bottom:1),
                  textColor: Colors.white,
                  splashColor: Colors.white,
                  // elevation: 8.0,
                  color: Colors.blue.withOpacity(0.1),

                  child: Container(
                    width: 400,
                    height: 100,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.shade600,
                          spreadRadius: 1,
                          blurRadius: 1,
                          offset: const Offset(5, 5),
                        ),
                        const BoxShadow(
                            color: Colors.white,
                            offset: Offset(-5,-5),
                            blurRadius: 1,
                            spreadRadius: 1
                        ) ,
                      ],
                      gradient: LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        colors: [
                          Colors.grey.shade200,
                          Colors.grey.shade300,
                          Colors.grey.shade400,
                          Colors.grey.shade500,
                        ],
                      ),
                      image: DecorationImage(
                          image: AssetImage('img/Zone_6.jpg'),
                          fit: BoxFit.cover),
                    ),
                    child: Center(
                      //padding: const EdgeInsets.all(1),
                      child: Text("ZONA 4",style: TextStyle(fontSize: 20),textAlign: TextAlign.center,),
                      //),
                    ),
                  ),
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (_) => WebSocket('4',"ws://192.168.0.173:81")));
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

