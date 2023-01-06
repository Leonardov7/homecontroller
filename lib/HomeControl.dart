import 'package:flutter/material.dart';
import 'package:homecontroller/ConfigFile.dart';
import 'package:homecontroller/DTO/Plantilla.dart';
import 'package:homecontroller/Light/ZoneSelecction.dart';

class HomeControl extends StatefulWidget {
  HomeControlApp createState() => HomeControlApp();
}

class HomeControlApp extends State<HomeControl> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      /* appBar: AppBar(
        title: Text('CONTROL', textAlign: TextAlign.center),
        backgroundColor: Color(0xFFFF3C97FF),
      ),*/
      body: SingleChildScrollView(
        child: Container(
          // color: Color(0xFFFF3C97FF),
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("img/Circuit_2.png"),
              fit: BoxFit.fitHeight,
            ),
          ),
       child: Column(
            children: [
              Container(
                margin: EdgeInsets.only(top: 20),
                color: Color(0xFFFF57ACFF).withOpacity(0.5),
                child: Row(
                  children: [
                    Expanded(
                      child: Padding(
                        padding: EdgeInsets.only(
                            top: 10, left: 10, right: 1, bottom: 10),
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              backgroundColor:
                                  Color(0xFFFF57ACFF).withOpacity(0.8),
                              minimumSize: Size(400, 60)),
                          onPressed: () {},
                          child: Text('Botón uno'),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding: EdgeInsets.only(
                            top: 10, right: 10, left: 1, bottom: 10),
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              backgroundColor:
                                  Color(0xFFFF57ACFF).withOpacity(0.8),
                              minimumSize: Size(400, 60)),
                          onPressed: () {},
                          child: Text('Botón dos'),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              //*************************imagen**************************
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Center(
                    child: Container(
                      height: 250,
                      child: Image.asset('img/Home.png'),
                    ),
                  ),
                ],
              ),
              //******************Controles*************************
              Row(
                children: [
                  Expanded(
                    child: Padding(
                      padding: EdgeInsets.only(bottom: 5, top: 10, left: 10),
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor:
                                Color(0xFFFF57ACFF).withOpacity(0.5),
                            minimumSize: Size(400, 130)),
                        onPressed: () {},
                        child: Image.asset('img/Keys_1.png', width: 100),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: EdgeInsets.only(
                          top: 10, bottom: 5, right: 5, left: 5),
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor:
                                Color(0xFFFF57ACFF).withOpacity(0.5),
                            minimumSize: Size(400, 130)),
                        onPressed: () {},
                        child: Image.asset('img/Temp.png', width: 50),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: EdgeInsets.only(top: 10, right: 10, bottom: 5),
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor:
                                Color(0xFFFF57ACFF).withOpacity(0.5),
                            minimumSize: Size(400, 130)),
                        onPressed: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (_) => ZoneSelecction()));
                        },
                        child: Image.asset(
                          'img/Luz_1.png',
                          width: 150,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Expanded(
                    child: Padding(
                      padding: EdgeInsets.only(left: 10),
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor:
                                Color(0xFFFF57ACFF).withOpacity(0.5),
                            minimumSize: Size(400, 130)),
                        onPressed: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (_) => Plantilla()));

                        },
                        child: Text('Botón seis'),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: EdgeInsets.only(right: 5, left: 5),
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor:
                                Color(0xFFFF57ACFF).withOpacity(0.5),
                            minimumSize: Size(400, 130)),
                        onPressed: () {},
                        child: Text('Botón siete'),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: EdgeInsets.only(right: 10),
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor:
                                Color(0xFFFF57ACFF).withOpacity(0.5),
                            minimumSize: Size(400, 130)),
                        onPressed: () {},
                        child: Text('Botón ocho'),
                      ),
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Expanded(
                    child: Padding(
                      padding: EdgeInsets.only(left: 10, top: 5, bottom: 10),
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor:
                                Color(0xFFFF57ACFF).withOpacity(0.5),
                            minimumSize: Size(400, 130)),
                        onPressed: () {},
                        child: Image.asset('img/State_1.png', width: 150),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: EdgeInsets.only(
                          right: 5, left: 5, top: 5, bottom: 10),
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor:
                                Color(0xFFFF57ACFF).withOpacity(0.5),
                            minimumSize: Size(400, 130)),
                        onPressed: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (_) => ConfigFile()));
                        },
                        child: Image.asset('img/Settings_1.png', width: 150),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: EdgeInsets.only(right: 10, top: 5, bottom: 10),
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor:
                                Color(0xFFFF57ACFF).withOpacity(0.5),
                            minimumSize: Size(400, 130)),
                        onPressed: () {},
                        child: Image.asset('img/Ask_1.png', width: 70),
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
