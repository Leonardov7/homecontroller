import 'package:flutter/material.dart';
import 'package:homecontroller/ConfigFile.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

class WebSocket extends StatefulWidget {
  final String zona;
  final String ip;
  WebSocket(this.zona,this.ip);
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

      channel = WebSocketChannel.connect(Uri.parse(widget.ip));
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
      //  backgroundColor: Color(0xFFFF01350b),
      /*   appBar: AppBar(
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
      ),*/
      body: SingleChildScrollView(
        child: Container(
          height: 650,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("img/Circuit_2.png"),
              fit: BoxFit.cover,
            ),
          ),
          margin: EdgeInsets.only(top: 40, left: 10, right: 10),
          child: Column(
            children: [
              Row(
                //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
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
                                  ),),
                        /* Padding(
                            padding: EdgeInsets.only(top: 5, bottom: 20),
                            child: ledstatus
                                ? Text("LED IS: ON")
                                : Text("LED IS: OFF"))*/
                        Padding(padding: EdgeInsets.only(top: 2,bottom: 5),
                        child: Text('ZONA ' +widget.zona,style: TextStyle(
                            color: Colors.red, fontSize: 20),),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Expanded(
                    child: Padding(
                      padding: EdgeInsets.only(top: 1, right: 5),
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor: ledstatus
                                ? Colors.green.withOpacity(0.8)
                                : Color(0xFFFF57ACFF).withOpacity(0.5),
                            minimumSize: Size(1, 150)),
                        onPressed: () {
                          {
                            if (ledstatus) {
                              sendcmd("poweroff", 1);
                              ledstatus = false;
                            } else {
                              sendcmd("poweron", 1);
                              ledstatus = true;
                            }
                            setState(() {});
                          }
                        },
                        child: ledstatus
                            ? Text("CANAL-1 \n ON ",
                                style: TextStyle(
                                    color: Colors.black, fontSize: 20),
                                textAlign: (TextAlign.center))
                            : Text(
                                "CANAL-1 \n OFF ",
                                style: TextStyle(
                                    color: Colors.black, fontSize: 20),
                                textAlign: (TextAlign.center),
                              ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: EdgeInsets.only(top: 5, left: 5),
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor: ledstatus_1
                                ? Colors.green.withOpacity(0.8)
                                : Color(0xFFFF57ACFF).withOpacity(0.5),
                            minimumSize: Size(1, 150)),
                        onPressed: () {
                          {
                            if (ledstatus_1) {
                              sendcmd("poweroff", 2);//comando, zona
                              ledstatus_1 = false;
                            } else {
                              sendcmd("poweron", 2);
                              ledstatus_1 = true;
                            }
                            setState(() {});
                          }
                        },
                        child: ledstatus_1
                            ? Text("CANAL-2 \n ON ",
                            style: TextStyle(
                                color: Colors.black, fontSize: 20),
                            textAlign: (TextAlign.center))
                            : Text(
                          "CANAL-2 \n OFF ",
                          style: TextStyle(
                              color: Colors.black, fontSize: 20),
                          textAlign: (TextAlign.center),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Row(
                // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Expanded(
                    child: Padding(
                      padding: EdgeInsets.only(top: 5, right: 5),
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor: ledstatus_3
                                ? Colors.green.withOpacity(0.8)
                                : Color(0xFFFF57ACFF).withOpacity(0.5),
                            minimumSize: Size(1, 150)),
                        onPressed: () {
                          {
                            if (ledstatus_3) {
                              sendcmd("poweroff", 1);
                              ledstatus_3 = false;
                            } else {
                              sendcmd("poweron", 1);
                              ledstatus_3 = true;
                            }
                            setState(() {});
                          }
                        },
                        child: ledstatus_3
                            ? Text("CANAL-3 \n ON ",
                            style: TextStyle(
                                color: Colors.black, fontSize: 20),
                            textAlign: (TextAlign.center))
                            : Text(
                          "CANAL-3 \n OFF ",
                          style: TextStyle(
                              color: Colors.black, fontSize: 20),
                          textAlign: (TextAlign.center),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: EdgeInsets.only(top: 1, left: 5),
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor: ledstatus_4
                                ? Colors.green.withOpacity(0.8)
                                : Color(0xFFFF57ACFF).withOpacity(0.5),
                            minimumSize: Size(1, 150)),
                        onPressed: () {
                          {
                            if (ledstatus_4) {
                              sendcmd("poweroff", 1);
                              ledstatus_4 = false;
                            } else {
                              sendcmd("poweron", 1);
                              ledstatus_4 = true;
                            }
                            setState(() {});
                          }
                        },
                        child: ledstatus_4
                            ? Text("CANAL-4 \n ON ",
                            style: TextStyle(
                                color: Colors.black, fontSize: 20),
                            textAlign: (TextAlign.center))
                            : Text(
                          "CANAL-4 \n OFF ",
                          style: TextStyle(
                              color: Colors.black, fontSize: 20),
                          textAlign: (TextAlign.center),
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
                      padding: EdgeInsets.only(top: 1, right: 5),
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor: ledstatus_5
                                ? Colors.green.withOpacity(0.8)
                                : Color(0xFFFF57ACFF).withOpacity(0.5),
                            minimumSize: Size(1, 150)),
                        onPressed: () {
                          {
                            if (ledstatus_5) {
                              sendcmd("poweroff", 1);
                              ledstatus_5 = false;
                            } else {
                              sendcmd("poweron", 1);
                              ledstatus_5 = true;
                            }
                            setState(() {});
                          }
                        },
                        child: ledstatus_5
                            ? Text("CANAL-5 \n ON ",
                            style: TextStyle(
                                color: Colors.black, fontSize: 20),
                            textAlign: (TextAlign.center))
                            : Text(
                          "CANAL-5 \n OFF ",
                          style: TextStyle(
                              color: Colors.black, fontSize: 20),
                          textAlign: (TextAlign.center),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: EdgeInsets.only(top: 5, left: 5),
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor: ledstatus_6
                                ? Colors.green.withOpacity(0.8)
                                : Color(0xFFFF57ACFF).withOpacity(0.5),
                            minimumSize: Size(1, 150)),
                        onPressed: () {
                          {
                            if (ledstatus_6) {
                              sendcmd("poweroff", 1);
                              ledstatus_6 = false;
                            } else {
                              sendcmd("poweron", 1);
                              ledstatus_6= true;
                            }
                            setState(() {});
                          }
                        },
                        child: ledstatus_6
                            ? Text("CANAL-6 \n ON ",
                            style: TextStyle(
                                color: Colors.black, fontSize: 20),
                            textAlign: (TextAlign.center))
                            : Text(
                          "CANAL-6 \n OFF ",
                          style: TextStyle(
                              color: Colors.black, fontSize: 20),
                          textAlign: (TextAlign.center),
                        ),
                      ),
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
