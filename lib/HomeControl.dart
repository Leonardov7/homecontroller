import 'package:flutter/material.dart';
import 'package:homecontroller/ConfigFile.dart';
import 'package:homecontroller/Plantilla.dart';
import 'package:homecontroller/Light/ZoneSelecction.dart';

import 'Temperature/DashboardTemp.dart';

class HomeControl extends StatefulWidget {
  HomeControlApp createState() => HomeControlApp();
}

class HomeControlApp extends State<HomeControl> {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
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
                     margin: EdgeInsets.only(top: 5),
                    //  height: 250,
                       width: screenWidth * 0.9,
                   height: screenHeight*  0.3,
                         child: Image.asset('img/Home.png',width: double.infinity,),
                    ),
                  ),
                ],
              ),
              //******************Controles*************************
              Row(
                children: [
                  Expanded(
                    child: Padding(
                      padding: EdgeInsets.only(bottom: 5, top: 1, left: 10),
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor:
                                Color(0xFFFF57ACFF).withOpacity(0.5),
                            maximumSize: Size(200, 120),
                            minimumSize: Size(200, 120)),
                        onPressed: () {},
                        child: Padding(
                            padding: EdgeInsets.all(8),
                            child: Image.asset('img/Keys_1.png',
                                width: double.infinity)),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: EdgeInsets.only(
                          top: 1, bottom: 5, right: 5, left: 5),
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor:
                                Color(0xFFFF57ACFF).withOpacity(0.5),
                            maximumSize: Size(200, 120),
                            minimumSize: Size(200, 120)),
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (_) => DashboardTemp()));
                        },
                        child: Padding(
                          padding: EdgeInsets.all(8),
                          child: Image.asset(
                            'img/Temp.png',
                            width: double.infinity,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: EdgeInsets.only(top: 1, right: 10, bottom: 5),
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor:
                                Color(0xFFFF57ACFF).withOpacity(0.5),
                            maximumSize: Size(200, 120),
                            minimumSize: Size(200, 120)),
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (_) => ZoneSelecction()));
                        },
                        child:Padding(padding: EdgeInsets.all(8),
                            child: Image.asset('img/Luz_1.png', width: double.infinity,)),
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
                            maximumSize: Size(200, 120),
                            minimumSize: Size(200, 120)),
                        onPressed: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (_) => Plantilla()));
                        },
                        child:Padding(padding: EdgeInsets.all(8),
                            child: Image.asset('img/Keys_1.png', width: double.infinity)),
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
                            maximumSize: Size(200, 120),
                            minimumSize: Size(200, 120)),
                        onPressed: () {},
                        child:Padding(padding: EdgeInsets.all(8),
                            child: Image.asset('img/Keys_1.png', width: double.infinity)),
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
                            maximumSize: Size(200, 120),
                            minimumSize: Size(200, 120)),
                        onPressed: () {},
                        child:Padding(padding: EdgeInsets.all(8),
                            child: Image.asset('img/UserAdd_1.png', width: double.infinity),

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
                      padding: EdgeInsets.only(left: 10, top: 5, bottom: 10),
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor:
                                Color(0xFFFF57ACFF).withOpacity(0.5),
                            maximumSize: Size(200, 120),
                            minimumSize: Size(200, 120)),
                        onPressed: () {},
                        child:Padding(padding: EdgeInsets.all(8),
                            child: Image.asset('img/State_1.png', width: double.infinity)),
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
                            maximumSize: Size(200, 120),
                            minimumSize: Size(200, 120)),
                        onPressed: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (_) => ConfigFile()));
                        },
                        child:Padding(padding: EdgeInsets.all(8),
                            child: Image.asset('img/Settings_1.png', width: double.infinity)),
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
                            //fixedSize: Size(420, 130),
                            maximumSize: Size(200, 120),
                            minimumSize: Size(200, 120)),
                        onPressed: () {},
                        child:Padding(padding: EdgeInsets.all(8),
                            child: Image.asset('img/Ask_1.png', width: double.infinity)),
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
