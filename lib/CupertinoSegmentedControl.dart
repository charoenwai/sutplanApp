import 'dart:core';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sutplan/Loading.dart';
import 'package:sutplan/convercolor.dart';
import 'package:sutplan/loaderror.dart';

class CupertinoSegmentedControlDemo extends StatefulWidget {
  final String uid;
  final int count;
  CupertinoSegmentedControlDemo(this.uid,this.count, {Key key}) : super(key:key);


  @override
  _CupertinoSegmentedControlDemoState createState() =>
      _CupertinoSegmentedControlDemoState();
}

class _CupertinoSegmentedControlDemoState  extends State<CupertinoSegmentedControlDemo> {

  int sharedValue = 0;

  @override
  Widget build(BuildContext context) {
    return  new Scaffold(
        body: Column(
          children: <Widget>[
            const Padding(
              padding: EdgeInsets.all(16.0),
            ),
            SizedBox(
              width: 500.0,
              child: CupertinoSegmentedControl<int>(
                children: logoWidgets,
                onValueChanged: (int val) {
                  setState(() {
                    sharedValue = val;
                  });
                },
                groupValue: sharedValue,
              ),
            ),
            new Expanded(
              child:_buildBody(context,sharedValue),
            ),
          ],
        ),
      );
  }

  @override
  Widget _buildBody(BuildContext context,sharedValue) {
    return StreamBuilder(
      stream: Firestore.instance.collection('plans')
          .document(widget.uid)
          .snapshots(),
      builder: (BuildContext context, snapshot) {
        if (!snapshot.hasData) {
          return Loading();
        }
        return _buildSplitObject(context, snapshot.data,sharedValue);
      },
    );
  }

  @override
  Widget _buildSplitObject(BuildContext context, var data,sharedValue) {
    var record = data.data;

    var Subjest;

    int count = widget.count;

    List Key = new List(3);

    Map<String, dynamic> maps = record;
    int k = 0;
    for (var Keys in maps.keys) {
      Key[k] = Keys;
      k++;
    }
    ///SeletcPlan
    var Keyss = Key[count];

    ///return Loading
    if(Key[count] == null){
      return LoadError();
    }

    Map<String, dynamic> map = record;
    for (var key in map.keys) {
      Subjest = (map[Keyss]['subject']);
    }


    return new Column(
      children: <Widget>[
        new Expanded(
          child: new Container(
            child:  new Container(
              child: ListView.builder(
                itemCount: Subjest.length,
                itemBuilder: (context, index) {
                  return new Container(
                    color: Colors.white,
//                    color: HexColor((Subjest[index]['color'])),
                    child: new Column(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        new ExpansionTile(
                            title: new Container(
                              child: Row(
                                children: <Widget>[
                                  Column(
                                    children: <Widget>[
                                      SizedBox(
                                        width: 50,
                                      ),
                                      Row(
                                        children: <Widget>[
                                          Text((() {
                                            if(Subjest[index]['coursecode'] == null){
                                              return "-";}

                                            return Subjest[index]['coursecode'];
                                          })(),style: TextStyle(
                                              fontSize: 14,
                                              fontWeight: FontWeight.bold
                                          ),),//

                                        ],
                                      ),
                                    ],
                                  ),
                                  Column(
                                    children: <Widget>[
                                      SizedBox(
                                        width: 15,
                                      ),
                                    ],
                                  ),
                                  Column(
                                    children: <Widget>[
                                      Row(
                                        children: <Widget>[
                                          Text("วันที่ ",style: TextStyle(
                                              fontSize: 14,
                                              fontWeight: FontWeight.bold
                                          ),),
                                          Text((() {
                                            if(Subjest[index]['midtest'] == "" && Subjest[index]['finaltest'] == ""){
                                              return " ไม่มีสอบ";}
                                            else if(sharedValue == 0){
                                              return Subjest[index]['midtest'];
                                            }
                                            return Subjest[index]['finaltest'];
                                          })(),style: TextStyle(
                                              fontSize: 14,
                                              fontWeight: FontWeight.bold
                                          ),),//
                                        ],
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            children: <Widget>[
                              new ListTile(
                                title: new Container(
                                  child: Column(
                                    children: <Widget>[
                                      Row(
                                        children: <Widget>[
                                          Column(
                                            children: <Widget>[
                                              Row(
                                                children: <Widget>[
                                                  Text("รายชื่อวิชา",style: TextStyle(
                                                      fontSize: 14,
                                                      fontWeight: FontWeight.bold
                                                  ),),//
                                                ],
                                              ),
                                            ],
                                          ),
                                          Column(
                                            children: <Widget>[
                                              SizedBox(
                                                width: 29,
                                              ),
                                            ],
                                          ),
                                          Column(
                                            children: <Widget>[
                                              Row(
                                                children: <Widget>[
                                                  Text((() {
                                                    if(Subjest[index]['name'] == ""){
                                                      return "-";}

                                                    return Subjest[index]['name'];
                                                  })(),style: TextStyle(
                                                      fontSize: 14
                                                  ),),//
                                                ],
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                      Row(
                                        children: <Widget>[
                                          Column(
                                            children: <Widget>[
                                              Row(
                                                children: <Widget>[
                                                  Text("วัน-เวลาเรียน",style: TextStyle(
                                                      fontSize: 14,
                                                      fontWeight: FontWeight.bold
                                                  ),),//
                                                ],
                                              ),
                                            ],
                                          ),
                                          Column(
                                            children: <Widget>[
                                              SizedBox(
                                                width: 15,
                                              ),
                                            ],
                                          ),
                                          Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: <Widget>[
                                              Row(
                                                children: <Widget>[
                                                  Text((() {
                                                    if(Subjest[index]['daytime'][0] == ""){
                                                      return "-";}
                                                    return Subjest[index]['daytime'][0];
                                                  }
                                                  )(),style: TextStyle(
                                                    fontSize: 14,
                                                  ),
                                                    textAlign: TextAlign.left,
                                                  ),//
                                                ],
                                              ),
                                              Row(
                                                children: <Widget>[
                                                  Text((() {
                                                    if(Subjest[index]['daytime'].length != 2){
                                                      return "-";}
                                                    return Subjest[index]['daytime'][1];
                                                  }
                                                  )(),style: TextStyle(
                                                    fontSize: 14,
                                                  ),
                                                    textAlign: TextAlign.left,
                                                  ),//
                                                ],
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                      Row(
                                        children: <Widget>[
                                          Column(
                                            children: <Widget>[
                                              Row(
                                                children: <Widget>[
                                                  Text("กลุ่ม",style: TextStyle(
                                                      fontSize: 14,
                                                      fontWeight: FontWeight.bold
                                                  ),),//
                                                ],
                                              ),
                                            ],
                                          ),
                                          Column(
                                            children: <Widget>[
                                              SizedBox(
                                                width: 70,
                                              ),
                                            ],
                                          ),
                                          Column(
                                            children: <Widget>[
                                              Row(
                                                children: <Widget>[
                                                  Text((() {
                                                    if(Subjest[index]['group'] == ""){
                                                      return "-";}

                                                    return Subjest[index]['group'];
                                                  })(),style: TextStyle(
                                                      fontSize: 14
                                                  ),),//
                                                ],
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                      Row(
                                        children: <Widget>[
                                          Column(
                                            children: <Widget>[
                                              Row(
                                                children: <Widget>[
                                                  Text("หน่วยกิต",style: TextStyle(
                                                      fontSize: 14,
                                                      fontWeight: FontWeight.bold
                                                  ),),//
                                                ],
                                              ),
                                            ],
                                          ),
                                          Column(
                                            children: <Widget>[
                                              SizedBox(
                                                width: 43,
                                              ),
                                            ],
                                          ),
                                          Column(
                                            children: <Widget>[
                                              Row(
                                                children: <Widget>[
                                                  Text((() {
                                                    if(Subjest[index]['credit'] == ""){
                                                      return "-";}

                                                    return Subjest[index]['credit'].toString();
                                                  })(),style: TextStyle(
                                                      fontSize: 14
                                                  ),),//
                                                ],
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                      Row(
                                        children: <Widget>[
                                          Column(
                                            children: <Widget>[
                                              Row(
                                                children: <Widget>[
                                                  Text("สอบกลางภาค",style: TextStyle(
                                                      fontSize: 14,
                                                      fontWeight: FontWeight.bold
                                                  ),),//
                                                ],
                                              ),
                                            ],
                                          ),
                                          Column(
                                            children: <Widget>[
                                              SizedBox(
                                                width: 11,
                                              ),
                                            ],
                                          ),
                                          Column(
                                            children: <Widget>[
                                              Row(
                                                children: <Widget>[
                                                  Text((() {
                                                    if(Subjest[index]['midtest'] == ""){
                                                      return "-";}

                                                    return Subjest[index]['midtest'];
                                                  })(),style: TextStyle(
                                                      fontSize: 14
                                                  ),),//
                                                ],
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                      Row(
                                        children: <Widget>[
                                          Column(
                                            children: <Widget>[
                                              Row(
                                                children: <Widget>[
                                                  Text("สอบประจำภาค",style: TextStyle(
                                                      fontSize: 14,
                                                      fontWeight: FontWeight.bold
                                                  ),),//
                                                ],
                                              ),
                                            ],
                                          ),
                                          Column(
                                            children: <Widget>[
                                              SizedBox(
                                                width: 3,
                                              ),
                                            ],
                                          ),
                                          Column(
                                            children: <Widget>[
                                              Row(
                                                children: <Widget>[
                                                  Text((() {
                                                    if(Subjest[index]['finaltest'] == ""){
                                                      return "-";}

                                                    return Subjest[index]['finaltest'];
                                                  })(),style: TextStyle(
                                                      fontSize: 14
                                                  ),),//
                                                ],
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),

                                ),
                              )
                            ]
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ),),
      ],
    );
  }

  Map<int, Widget> logoWidgets = const <int, Widget>{
    0: Text('สอบกลางภาค'),
    1: Text('สอบประจำภาค'),
  };
}