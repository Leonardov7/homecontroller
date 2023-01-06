import 'package:flutter/material.dart';

class ConfigFile extends StatefulWidget {
  ConfigFileApp createState() => ConfigFileApp();
}

class ConfigFileApp extends State<ConfigFile> {
  TextEditingController ip = TextEditingController();
  TextEditingController gate = TextEditingController();
  TextEditingController subnet = TextEditingController();
  String dropdownvalue = 'Zona 1';

  // List of items in our dropdown menu
  var items = [
    'Zona 1',
    'Zona 2',
    'Zona 3',
    'Zona 4',
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Configuración'),
        backgroundColor: Colors.blueGrey,
      ),
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Padding(
                    padding: EdgeInsets.only(top: 30, bottom: 10),
                    child: Text(
                      'Configuarción del dispositivo',
                      style: TextStyle(color: Colors.black45, fontSize: 18),
                    ),
                  )
                ],
              ),
              Row(
                children: [
                  Expanded(
                    child: Column(
                      children: [
                        Padding(
                          padding: EdgeInsets.only(top: 8),
                          child: Text('Configuración de red',
                              style: TextStyle(
                                  color: Colors.black45, fontSize: 12)),
                        ),
                        Padding(
                          padding: EdgeInsets.only(bottom: 1,left: 10),
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
                            style: TextStyle(  //te
                                color: Colors.black, //Font color
                                fontSize: 12 //font size on dropdown button
                            ),
                            //dropdownColor: Colors.redAccent, //dropdown background color
                           // underline: Container(), //remove underline
                            isExpanded: true, //make true to make width 100%
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 1, right: 5, left: 10),
                          child: TextField(
                            controller: ip,
                            style:
                                TextStyle(color: Colors.blueGrey, fontSize: 13),
                            decoration: InputDecoration(
                              fillColor: Colors.grey,
                              labelText: 'IpLocal ',
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 5, right: 5, left: 10),
                          child: TextField(
                            controller: gate,
                            style:
                                TextStyle(color: Colors.blueGrey, fontSize: 13),
                            decoration: InputDecoration(
                              fillColor: Colors.grey,

                              labelText: 'GateWay ',
                              // hintText: 'Ip Local',
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 5, right: 5, left: 10),
                          child: TextField(
                            controller: subnet,
                            style:
                                TextStyle(color: Colors.blueGrey, fontSize: 13),
                            decoration: InputDecoration(
                              fillColor: Colors.grey,

                              labelText: 'SubNet ',
                              // hintText: 'Ip Local',
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Container(
                      margin: EdgeInsets.only(left: 10),
                      height: 180,
                      decoration: const BoxDecoration(
                        color: Color(0xFFFFFFFFFF),
                        border: Border(
                          //top: BorderSide(
                          // width: 1.0, color: Color(0xFFFF000000)),
                          left: BorderSide(
                              width: 1.0, color: Color(0xFFFF000000)),
                          // right: BorderSide(
                          //width: 1.0, color: Color(0xFFFF000000)),
                          //bottom: BorderSide(
                          //  width: 1.0, color: Color(0xFFFF000000)),
                        ),
                      ),
                      child: Center(
                        child: Padding(
                          padding: EdgeInsets.only(top: 1),
                          child: Text('Text1'),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Padding(
                    padding: EdgeInsets.only(top: 10),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.blueGrey,
                          minimumSize: Size(400, 50)),
                      onPressed: () {},
                      child: Text('Aceptar'),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
