import 'package:flutter/material.dart';

class DashboardTemp extends StatefulWidget {
  DashboardTempApp createState() => DashboardTempApp();
}

class DashboardTempApp extends State<DashboardTemp> {
  String dropdownvalue = 'Zona 1';
  var items = [
    'Zona 1',
    'Zona 2',
    'Zona 3',
    'Zona 4',
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          //  height: 900,
          height: MediaQuery.of(context).size.height,
          decoration: BoxDecoration(
            color: Colors.red,
          ),

          child: Column(
            children: [
              Row(
                children: [
                  Expanded(
                    child: Container(
                      margin: EdgeInsets.only(top: 50),
                      //  height: 200,
                      color: Colors.blue,
                      child: Column(
                        children: [
                          Padding(
                              padding: EdgeInsets.only(top: 8, bottom: 10),
                              child: Text(
                                'Exterior',
                                style: TextStyle(fontSize: 20),
                              )),
                          Center(
                            child: Text(
                              '12°',
                              style: TextStyle(fontSize: 130),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      margin: EdgeInsets.only(top: 50),
                      //  height: 200,
                      color: Colors.blue,
                      child: Column(
                        children: [
                          Padding(
                              padding: EdgeInsets.only(top: 8, bottom: 10),
                              child: Text(
                                'Interior',
                                style: TextStyle(fontSize: 20),
                              )),
                          Center(
                            child: Text(
                              '9°',
                              style: TextStyle(fontSize: 130),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Expanded(
                    child: Padding(
                      padding: EdgeInsets.only(bottom: 1, left: 10, top: 20),
                      child: DropdownButton(
                        value: dropdownvalue,
                        icon: const Icon(Icons.keyboard_arrow_down),
                        items: items.map((String items) {
                          return DropdownMenuItem(
                            value: items,
                            child: Text(items),
                          );
                        }).toList(),
                        onChanged: (String? newValue) {
                          setState(() {
                            dropdownvalue = newValue!;
                          });
                        },
                        style: TextStyle(
                            //te
                            color: Colors.black, //Font color
                            fontSize: 12 //font size on dropdown button
                            ),
                        //dropdownColor: Colors.redAccent, //dropdown background color
                        // underline: Container(), //remove underline
                        isExpanded: true, //make true to make width 100%
                      ),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: EdgeInsets.only(bottom: 1, left: 10, top: 20),
                      child: DropdownButton(
                        value: dropdownvalue,
                        icon: const Icon(Icons.keyboard_arrow_down),
                        items: items.map((String items) {
                          return DropdownMenuItem(
                            value: items,
                            child: Text(items),
                          );
                        }).toList(),
                        onChanged: (String? newValue) {
                          setState(() {
                            dropdownvalue = newValue!;
                          });
                        },
                        style: TextStyle(
                            //te
                            color: Colors.black, //Font color
                            fontSize: 12 //font size on dropdown button
                            ),
                        //dropdownColor: Colors.redAccent, //dropdown background color
                        // underline: Container(), //remove underline
                        isExpanded: true, //make true to make width 100%
                      ),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: EdgeInsets.only(bottom: 1, left: 10, top: 20),
                      child: DropdownButton(
                        value: dropdownvalue,
                        icon: const Icon(Icons.keyboard_arrow_down),
                        items: items.map((String items) {
                          return DropdownMenuItem(
                            value: items,
                            child: Text(items),
                          );
                        }).toList(),
                        onChanged: (String? newValue) {
                          setState(() {
                            dropdownvalue = newValue!;
                          });
                        },
                        style: TextStyle(
                            //te
                            color: Colors.black, //Font color
                            fontSize: 12 //font size on dropdown button
                            ),
                        //dropdownColor: Colors.redAccent, //dropdown background color
                        // underline: Container(), //remove underline
                        isExpanded: true, //make true to make width 100%
                      ),
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width * 0.8,
                    height: MediaQuery.of(context).size.height * 0.3,
                    margin: EdgeInsets.all(10),
                    decoration: BoxDecoration(color: Colors.green),
                    child: Center(
                      child: Text('Gráfico'),
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Expanded(
                    child: Padding(
                      padding: EdgeInsets.only(left: 10, right: 10, top: 10),
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          minimumSize: Size(100, 30)
                        ),
                        onPressed: () {
                          Navigator.popAndPushNamed(context, '/currentRoute');
                        },
                        child: Text('Salir'),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: EdgeInsets.only(left: 10, right: 10, top: 10),
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            minimumSize: Size(100, 30)
                        ),
                        onPressed: () {},
                        child: Text('Informe'),
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
