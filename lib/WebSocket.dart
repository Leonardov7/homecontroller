import 'package:flutter/material.dart';
import 'package:homecontroller/ConfigFile.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

class WebSocket extends StatefulWidget {
  @override
  WebSocketApp createState() => WebSocketApp();
}

class WebSocketApp extends State<WebSocket> {
  bool ledstatus = false; //boolean value to track LED status, if its ON or OFF
  // late IOWebSocketChannel channel;
  late WebSocketChannel channel;
  bool connected = false; //boolean value to track if WebSocket is connected
  bool ledstatus_1 = false;
  bool ledstatus_3 = false;
  bool ledstatus_4 = false;
  bool ledstatus_5 = false;
  bool ledstatus_6 = false;
  bool ledstatus_7 = false;
  bool ledstatus_8 = false; //initially leadstatus is off so its FALSE
  // bool connected_1 = false; //initially connection status is "NO" so its FALSE
  @override
  void initState() {
    ledstatus = false; //initially leadstatus is off so its FALSE
    connected = false; //initially connection status is "NO" so its FALSE
    ledstatus_1 = false;
    ledstatus_3 = false;
    ledstatus_4 = false;
    ledstatus_5 = false;
    ledstatus_6 = false;
    ledstatus_7 = false;
    ledstatus_8 = false; //initially leadstatus is off so its FALSE
    // connected_1 = false; //initially connection status is "NO" so its FALSE

    Future.delayed(Duration.zero, () async {
      print('nuevo...');
      channelconnect(); //connect to WebSocket wth NodeMCU
    });

    super.initState();
  }

  channelconnect() {
    //function to connect
    try {
      // print('1');
      // channel = IOWebSocketChannel.connect("ws://192.168.0.2"); //channel IP : Port

      channel = WebSocketChannel.connect(Uri.parse("ws://192.168.0.121:81"));
      //print('2');
      channel.stream.listen(
        (message) {
          print(message);
          setState(() {
            if (message == "connected...") {
              connected = true; //message is "connected" from NodeMCU
            } else if (message == "poweron:success...") {
              ledstatus = true;
              //ledstatus_1 = true;
              //ledstatus_3 = true;
            } else if (message == "poweroff:success") {
              ledstatus = false;
              //ledstatus_1 = false;
            }
          });
        },
        onDone: () {
          //if WebSocket is disconnected
          print("Web socket is closed");
          setState(() {
            connected = false;
          });
        },
        onError: (error) {
          print(error.toString());
        },
      );
    } catch (e) {
      print("error on connecting to websocket....." + e.toString());
    }
  }

  Future<void> sendcmd(String cmd, int zona) async {
    // print(cmd+"***");
    if (connected == true) {
      if (ledstatus == false && cmd != "poweron" && cmd != "poweroff") {
        print("Send the valid command");
      } else {
        //print(zona.toString() + cmd);
        channel.sink.add(zona.toString() + cmd); //sending Command to NodeMCU
      }
    } else {
      channelconnect();
      print("Websocket is not connected.");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFF01350b),
      appBar: AppBar(
        title: Text("Remote Controller App"),
        backgroundColor: Colors.black12,
        actions: [
          IconButton(
            onPressed: () async {
              Navigator.push(
                  context, MaterialPageRoute(builder: (_) => ConfigFile()));
            },
            icon: const Icon(Icons.settings),
            // child: const Icon(Icons.add),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.only(top: 10, left: 10, right: 10),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Expanded(
                    child: Column(
                      children: [
                        Padding(
                            padding: EdgeInsets.only(top: 12, bottom: 10),
                            child: connected
                                ? Text("WEBSOCKET: CONNECTED",
                                    style: TextStyle(
                                        color: Colors.green, fontSize: 15))
                                : Text(
                                    "WEBSOCKET: DISCONNECTED",
                                    style: TextStyle(
                                        color: Colors.red, fontSize: 15),
                                  )),
                        /* Padding(
                            padding: EdgeInsets.only(top: 5, bottom: 20),
                            child: ledstatus
                                ? Text("LED IS: ON")
                                : Text("LED IS: OFF"))*/
                      ],
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Expanded(
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor:
                              ledstatus ? Colors.green : Colors.white70,
                          minimumSize: Size(1, 150)),
                      onPressed: () {
                        {
                          //print('enviando..');
                          //on button press
                          if (ledstatus) {
                            //if ledstatus is true, then turn off the led
                            //if led is on, turn off
                            sendcmd("poweroff", 1);

                            ledstatus = false;
                          } else {
                            //if ledstatus is false, then turn on the led
                            //if led is off, turn on
                            sendcmd("poweron", 1);
                            ledstatus = true;
                          }
                          setState(() {});
                        }
                      },
                      /*child: ledstatus
                          ? Text("APAGAR ZONA 1",
                              style:
                                  TextStyle(color: Colors.black, fontSize: 15))
                          : Text("ENCENDER ZONA 1",
                              style:
                                  TextStyle(color: Colors.black, fontSize: 15))*/
                      child: Text("CANAL 1",
                          style: TextStyle(color: Colors.black, fontSize: 15)),
                    ),
                  ),
                  Expanded(
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor:
                                ledstatus_1 ? Colors.green : Colors.white70,
                            minimumSize: Size(1, 150)),
                        onPressed: () {
                          {
                            //on button press
                            if (ledstatus_1) {
                              //if ledstatus is true, then turn off the led
                              //if led is on, turn off
                              sendcmd("poweroff", 2);

                              ledstatus_1 = false;
                            } else {
                              //if ledstatus is false, then turn on the led
                              //if led is off, turn on
                              sendcmd("poweron", 2);
                              ledstatus_1 = true;
                            }
                            setState(() {});
                          }
                        },
                        /* child: ledstatus_1
                          ? Text("APAGAR ZONA 2",
                              style:
                                  TextStyle(color: Colors.black, fontSize: 15))
                          : Text("ENCENDER ZONA 2",
                              style:
                                  TextStyle(color: Colors.black, fontSize: 15))*/
                        child: Text("CANAL 2",
                            style:
                                TextStyle(color: Colors.black, fontSize: 15))),
                  ),
                ],
              ),
              Row(
                // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Expanded(
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor:
                              ledstatus_3 ? Colors.lightGreen : Colors.white70,
                          minimumSize: Size(0, 150)),
                      onPressed: () {},
                      child: Text('Zona 3'),
                    ),
                  ),
                  Expanded(
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor:
                              ledstatus_4 ? Colors.lightGreen : Colors.white70,
                          minimumSize: Size(0, 150)),
                      onPressed: () {},
                      child: Text('Zona 4'),
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Expanded(
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor:
                              ledstatus_5 ? Colors.lightGreen : Colors.white70,
                          minimumSize: Size(0, 150)),
                      onPressed: () {},
                      child: Text('Zona 5'),
                    ),
                  ),
                  Expanded(
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor:
                              ledstatus_6 ? Colors.lightGreen : Colors.white70,
                          minimumSize: Size(0, 150)),
                      onPressed: () {},
                      child: Text('Zona 6'),
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                    onPressed: () {},
                    child: Text('Apagar todos',
                        style: TextStyle(color: Colors.black, fontSize: 15)),
                    style: ElevatedButton.styleFrom(
                        backgroundColor:
                            ledstatus_7 ? Colors.lightGreen : Colors.white70,
                        minimumSize: Size(380, 40)),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      ledstatus_1 = true;
                    },
                    child: Text('Encender todos',
                        style: TextStyle(color: Colors.black, fontSize: 15)),
                    style: ElevatedButton.styleFrom(
                        backgroundColor:
                            ledstatus_8 ? Colors.lightGreen : Colors.white70,
                        minimumSize: Size(380, 40)),
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
