import 'dart:io';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'dropdpwnbutton.dart';
import 'get_api_data.dart';
import 'list_of_activities.dart';
import 'dart:math' as math;

class PriceScreen extends StatefulWidget {
  @override
  _PriceScreenState createState() => _PriceScreenState();
}

class _PriceScreenState extends State<PriceScreen> {
  String? activity;
  String? type;
  String? participants;
  String? price;
  String? typeOfActivity;
  String? numberOfParticipants;
  String gif = "image/chef-cooking.gif";

  void getRandomData() async {
    try {
      var data = await getRandomApiData();

      setState(() {
        activity = data[0];
        type = data[1];
        participants = data[2];
        price = data[3];
      });
    } catch (e) {
      print(e);
    }
  }

  void getDatabyType(typeOfActivity) async {
    try {
      var data = await getApiDatabyType(typeOfActivity);

      setState(() {
        activity = data[0];
        type = data[1];
        participants = data[2];
        price = data[3];
      });
    } catch (e) {
      print(e);
    }
  }

  void getnumberOfParticipantsData(numberOfParticipants) async {
    try {
      var data = await getApiDatabynumberOfParticipants(numberOfParticipants);

      setState(() {
        activity = data[0];
        type = data[1];
        participants = data[2];
        price = data[3];
      });
    } catch (e) {
      print(e);
    }
  }

  void updadegif(type) {
    print(type);
    if (type == "recreational") {
      gif = "image/dribble-basketball.gif";
    }
    if (type == "social") {
      gif = "image/cheers-friends.gif";
    }
    if (type == "busywork") {
      gif = "image/policemen-beep.gif";
    }
    if (type == "charity") {
      gif = "image/waving-say-hi.gif";
    }
    if (type == "education") {
      gif = "image/teacher.gif";
    }
    if (type == "cooking") {
      gif = "image/chef-cooking.gif";
    }
    if (type == "music") {
      gif = "image/dance-happy.gif";
    }
    if (type == "diy") {
      gif = "image/digging-holes-shy.gif";
    }
    if (type == "relaxation") {
      gif = "image/sleep-time-sleep-well.gif";
    }
  }

  @override
  void initState() {
    super.initState();

    setState(() {
      getRandomData();
      updadegif(type);
    });
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    getDropdownItens();
    updadegif(type);

    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 43, 77, 103),
        title: Center(
          child: Text(
            'The Bored APP',
            style: TextStyle(color: Colors.white),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.fromLTRB(0.0, 18.0, 0.0, 0),
              child: Card(
                color: Color.fromARGB(255, 56, 103, 138),
                elevation: 5.0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: Padding(
                  padding:
                      EdgeInsets.symmetric(vertical: 15.0, horizontal: 10.0),
                  child: Text(
                    '''Activity: $activity.

Type: $type.

Number of participants: $participants.
                      ''',
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      fontSize: 20.0,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 18),
              child: Image.asset(
                gif,
                height: 125.0,
                width: 125.0,
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(
                      left: 10.0, right: 30, top: 10, bottom: 10),
                  child: FloatingActionButton.extended(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                    label: Text(
                      'Random',
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        fontSize: 15.0,
                        color: Colors.white,
                      ),
                    ),
                    backgroundColor: Color.fromARGB(255, 38, 73, 100),
                    onPressed: () {
                      setState(
                        () {
                          getRandomData();
                        },
                      );
                    },
                  ),
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(
                          left: 30.0, right: 10, top: 10, bottom: 10),
                      child: Center(
                        child: Container(
                          decoration: BoxDecoration(
                            color: Color.fromARGB(255, 38, 73, 100),
                            borderRadius: BorderRadius.circular(10.0),
                            border: Border.all(
                                color: Color.fromARGB(255, 38, 73, 100),
                                style: BorderStyle.solid,
                                width: 0.80),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.only(
                              left: 8,
                              right: 5,
                            ),
                            child: DropdownButtonHideUnderline(
                              child: DropdownButton<String>(
                                  icon: Transform.rotate(
                                    angle: 270 * math.pi / 180,
                                    child: Icon(
                                      Icons.arrow_back_ios_new,
                                      color: Colors.white,
                                    ),
                                  ),
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 15.0,
                                  ),
                                  hint: Text("Type of task"),
                                  value: typeOfActivity,
                                  items: getDropdownItens(),
                                  onChanged: (value) {
                                    setState(() {
                                      typeOfActivity = value;
                                      getDatabyType(typeOfActivity);
                                    });
                                  }),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                          left: 10.0, right: 30, top: 10, bottom: 10),
                      child: FloatingActionButton.extended(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)),
                        label: Text(
                          'New',
                          textAlign: TextAlign.left,
                          style: TextStyle(
                            fontSize: 15.0,
                            color: Colors.white,
                          ),
                        ),
                        backgroundColor: Color.fromARGB(255, 38, 73, 100),
                        onPressed: () {
                          setState(
                            () {
                              getDatabyType(typeOfActivity);
                            },
                          );
                        },
                      ),
                    ),
                  ],
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(
                          left: 30.0, right: 5, top: 10, bottom: 10),
                      child: Center(
                        child: Container(
                          decoration: BoxDecoration(
                            color: Color.fromARGB(255, 38, 73, 100),
                            borderRadius: BorderRadius.circular(10.0),
                            border: Border.all(
                                color: Color.fromARGB(255, 38, 73, 100),
                                style: BorderStyle.solid,
                                width: 0.80),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.only(
                              left: 8,
                              right: 5,
                            ),
                            child: DropdownButtonHideUnderline(
                              child: DropdownButton<String>(
                                  icon: Transform.rotate(
                                    angle: 270 * math.pi / 180,
                                    child: Icon(
                                      Icons.arrow_back_ios_new,
                                      color: Colors.white,
                                    ),
                                  ),
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 15.0,
                                  ),
                                  hint: Text("Number of participants "),
                                  value: numberOfParticipants,
                                  items: getDropdownItensnumber(),
                                  onChanged: (value) {
                                    setState(() {
                                      numberOfParticipants = value;
                                      getnumberOfParticipantsData(
                                          numberOfParticipants);
                                    });
                                  }),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                          left: 10.0, right: 30, top: 10, bottom: 10),
                      child: FloatingActionButton.extended(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)),
                        label: Text(
                          'New',
                          textAlign: TextAlign.left,
                          style: TextStyle(
                            fontSize: 15.0,
                            color: Colors.white,
                          ),
                        ),
                        backgroundColor: Color.fromARGB(255, 38, 73, 100),
                        onPressed: () {
                          setState(
                            () {
                              getnumberOfParticipantsData(numberOfParticipants);
                            },
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
