import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:sutplan/Loading.dart';
import 'package:sutplan/convercolor.dart';
import 'package:sutplan/loaderror.dart';
import 'package:sutplan/mainplan.dart';

class Plan extends StatelessWidget {
  const Plan( {Key key, this.choice,}) : super(key: key);
  final Choice choice;

  @override
  Widget build(BuildContext context) {
    return new Container(
      child: _buildBody(context),
    );
  }
  @override
  Widget _buildBody(BuildContext context) {
    return StreamBuilder(
      stream: Firestore.instance.collection('plans').document(choice.id).snapshots(),
      builder: (BuildContext context, snapshot){
        if (!snapshot.hasData) {
          return Loading();
        }
        return _buildSplitObject(context, snapshot.data);
      },
    );
  }
  @override
  Widget _buildSplitObject(BuildContext context, var data) {
    var record = data.data;

    var Fri;
    var Mon;
    var Sat;
    var Sun;
    var Thu;
    var Subjest;
    var Tue;
    var Wed;


    int count = choice.count;
    List M = new List(28);
    List TU = new List(28);
    List W = new List(28);
    List TH = new List(28);
    List F = new List(28);
    List SA = new List(28);
    List SU = new List(28);
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
      Mon = (map[Keyss]['mon']);
      Tue = (map[Keyss]['tue']);
      Fri = (map[Keyss]['fri']);
      Sat = (map[Keyss]['sat']);
      Sun = (map[Keyss]['sun']);
      Thu = (map[Keyss]['thu']);
      Subjest = (map[Keyss]['subject']);
      Wed = (map[Keyss]['wed']);
    }

    Color _colorTableNullEven = Colors.white;
    Color _colorTableNullOdd = Colors.white;

    ///MON
    for(var i = Mon.length-1; i >= 0; i--){
      if(Mon[i]['show'] == false) {
        M[i] = _colorTableNullEven;
      }else if(Mon[i]['show'] == true){
        if(Mon[i]['color'] == "" && Mon[i]['end'] == false){
          M[i] = M[i+1];
        }else if(Mon[i]['color'] != ""){
          M[i] = HexColor((Mon[i]['color']));
        }else if(Mon[i]['color'] == ""){
        }
      }
    }


    ///TUE
    for(var i = Tue.length-1; i >= 0 ; i--){
      if(Tue[i]['show'] == false) {
        TU[i] = _colorTableNullOdd;
      }else if(Tue[i]['show'] == true){
        if(Tue[i]['color'] == "" && Tue[i]['end'] == false){
          TU[i] = TU[i+1];
        }else if(Tue[i]['color'] != ""){
          TU[i] = HexColor((Tue[i]['color']));
        }
      }
    }

    ///WED
    for(var i = Wed.length-1; i >= 0 ; i--){
      if(Wed[i]['show'] == false) {
        W[i] = _colorTableNullEven;
      }else if(Wed[i]['show'] == true){
        if(Wed[i]['color'] == "" && Wed[i]['end'] == false){
          W[i] = W[i+1];
        }else if(Wed[i]['color'] != ""){
          W[i] = HexColor((Wed[i]['color']));
        }
      }
    }

    ///THU
    for(var i = Thu.length-1; i >= 0; i--){
      if(Thu[i]['show'] == false) {
        TH[i] = _colorTableNullOdd;
      }else if(Thu[i]['show'] == true){
        if(Thu[i]['color'] == "" && Thu[i]['end'] == false){
          TH[i] = TH[i+1];
        }else if(Thu[i]['color'] != ""){
          TH[i] = HexColor((Thu[i]['color']));
        }
      }
    }

    ///FRI
    for(var i = Fri.length-1; i >=0 ; i--){
      if(Fri[i]['show'] == false) {
        F[i] = _colorTableNullEven;
      }else if(Fri[i]['show'] == true){
        if(Fri[i]['color'] == "" && Fri[i]['end'] == false){
          F[i] = F[i+1];
        }else if(Fri[i]['color'] != ""){
          F[i] = HexColor((Fri[i]['color']));
        }
      }
    }

    ///SAT
    for(var i = Sat.length-1; i >= 0 ; i--){
      if(Sat[i]['show'] == false) {
        SA[i] = _colorTableNullOdd;
      }else if(Sat[i]['show'] == true){
        if(Sat[i]['color'] == "" && Sat[i]['end'] == false){
          SA[i] = SA[i+1];
        }else if(Sat[i]['color'] != ""){
          SA[i] = HexColor((Sat[i]['color']));
        }
      }
    }

    ///SUN
    for(var i = Sun.length-1; i >= 0 ; i--){
      if(Sun[i]['show'] == false) {
        SU[i] = (Colors.white);
      }else if(Sun[i]['show'] == true){
        if(Sun[i]['color'] == "" && Sun[i]['end'] == false){
          SU[i] = SU[i+1];
        }else if(Sun[i]['color'] != ""){
          SU[i] = HexColor((Sun[i]['color']));
        }
      }
    }



    Color _colorTableDay = Colors.white;
    Color _colorTableSun = Colors.redAccent;
    Color _colorTableSat = Colors.white;
    Color _colorTextDay = Colors.black;
    Color _colorTableTime = Colors.white;
    Color _colorTextTime = Colors.black;

    ///MON
    Color _colorPlanMon7 = Colors.white;
    Color _colorPlanMon8_1 = M[0];
    Color _colorPlanMon8_2 = M[1];
    Color _colorPlanMon9_1 = M[2];
    Color _colorPlanMon9_2 = M[3];
    Color _colorPlanMon10_1 = M[4];
    Color _colorPlanMon10_2 = M[5];
    Color _colorPlanMon11_1 = M[6];
    Color _colorPlanMon11_2 = M[7];
    Color _colorPlanMon12_1 = M[8];
    Color _colorPlanMon12_2 = M[9];
    Color _colorPlanMon13_1 = M[10];
    Color _colorPlanMon13_2 = M[11];
    Color _colorPlanMon14_1 = M[12];
    Color _colorPlanMon14_2 = M[13];
    Color _colorPlanMon15_1 = M[14];
    Color _colorPlanMon15_2 = M[15];
    Color _colorPlanMon16_1 = M[16];
    Color _colorPlanMon16_2 = M[17];
    Color _colorPlanMon17_1 = M[18];
    Color _colorPlanMon17_2 = M[19];
    Color _colorPlanMon18_1 = M[20];
    Color _colorPlanMon18_2 = M[21];
    Color _colorPlanMon19_1 = M[22];
    Color _colorPlanMon19_2 = M[23];
    Color _colorPlanMon20_1 = M[24];
    Color _colorPlanMon20_2 = M[25];
    Color _colorPlanMon21_1 = M[26];
    Color _colorPlanMon21_2 = M[27];


    ///TUE
    Color _colorPlanTue7 = Colors.white;
    Color _colorPlanTue8_1 = TU[0];
    Color _colorPlanTue8_2 = TU[1];
    Color _colorPlanTue9_1 = TU[2];
    Color _colorPlanTue9_2 = TU[3];
    Color _colorPlanTue10_1 = TU[4];
    Color _colorPlanTue10_2 = TU[5];
    Color _colorPlanTue11_1 = TU[6];
    Color _colorPlanTue11_2 = TU[7];
    Color _colorPlanTue12_1 = TU[8];
    Color _colorPlanTue12_2 = TU[9];
    Color _colorPlanTue13_1 = TU[10];
    Color _colorPlanTue13_2 = TU[11];
    Color _colorPlanTue14_1 = TU[12];
    Color _colorPlanTue14_2 = TU[13];
    Color _colorPlanTue15_1 = TU[14];
    Color _colorPlanTue15_2 = TU[15];
    Color _colorPlanTue16_1 = TU[16];
    Color _colorPlanTue16_2 = TU[17];
    Color _colorPlanTue17_1 = TU[18];
    Color _colorPlanTue17_2 = TU[19];
    Color _colorPlanTue18_1 = TU[20];
    Color _colorPlanTue18_2 = TU[21];
    Color _colorPlanTue19_1 = TU[22];
    Color _colorPlanTue19_2 = TU[23];
    Color _colorPlanTue20_1 = TU[24];
    Color _colorPlanTue20_2 = TU[25];
    Color _colorPlanTue21_1 = TU[26];
    Color _colorPlanTue21_2 = TU[27];


    ///WED
    Color _colorPlanWed7 = Colors.white;
    Color _colorPlanWed8_1 = W[0];
    Color _colorPlanWed8_2 = W[1];
    Color _colorPlanWed9_1 = W[2];
    Color _colorPlanWed9_2 = W[3];
    Color _colorPlanWed10_1 = W[4];
    Color _colorPlanWed10_2 = W[5];
    Color _colorPlanWed11_1 = W[6];
    Color _colorPlanWed11_2 = W[7];
    Color _colorPlanWed12_1 = W[8];
    Color _colorPlanWed12_2 = W[9];
    Color _colorPlanWed13_1 = W[10];
    Color _colorPlanWed13_2 = W[11];
    Color _colorPlanWed14_1 = W[12];
    Color _colorPlanWed14_2 = W[13];
    Color _colorPlanWed15_1 = W[14];
    Color _colorPlanWed15_2 = W[15];
    Color _colorPlanWed16_1 = W[16];
    Color _colorPlanWed16_2 = W[17];
    Color _colorPlanWed17_1 = W[18];
    Color _colorPlanWed17_2 = W[19];
    Color _colorPlanWed18_1 = W[20];
    Color _colorPlanWed18_2 = W[21];
    Color _colorPlanWed19_1 = W[22];
    Color _colorPlanWed19_2 = W[23];
    Color _colorPlanWed20_1 = W[24];
    Color _colorPlanWed20_2 = W[25];
    Color _colorPlanWed21_1 = W[26];
    Color _colorPlanWed21_2 = W[27];

    ///THU
    Color _colorPlanThu7 = Colors.white;
    Color _colorPlanThu8_1 = TH[0];
    Color _colorPlanThu8_2 = TH[1];
    Color _colorPlanThu9_1 = TH[2];
    Color _colorPlanThu9_2 = TH[3];
    Color _colorPlanThu10_1 = TH[4];
    Color _colorPlanThu10_2 = TH[5];
    Color _colorPlanThu11_1 = TH[6];
    Color _colorPlanThu11_2 = TH[7];
    Color _colorPlanThu12_1 = TH[8];
    Color _colorPlanThu12_2 = TH[9];
    Color _colorPlanThu13_1 = TH[10];
    Color _colorPlanThu13_2 = TH[11];
    Color _colorPlanThu14_1 = TH[12];
    Color _colorPlanThu14_2 = TH[13];
    Color _colorPlanThu15_1 = TH[14];
    Color _colorPlanThu15_2 = TH[15];
    Color _colorPlanThu16_1 = TH[16];
    Color _colorPlanThu16_2 = TH[17];
    Color _colorPlanThu17_1 = TH[18];
    Color _colorPlanThu17_2 = TH[19];
    Color _colorPlanThu18_1 = TH[20];
    Color _colorPlanThu18_2 = TH[21];
    Color _colorPlanThu19_1 = TH[22];
    Color _colorPlanThu19_2 = TH[23];
    Color _colorPlanThu20_1 = TH[24];
    Color _colorPlanThu20_2 = TH[25];
    Color _colorPlanThu21_1 = TH[26];
    Color _colorPlanThu21_2 = TH[27];

    ///FRI
    Color _colorPlanFri7 = Colors.white;
    Color _colorPlanFri8_1 = F[0];
    Color _colorPlanFri8_2 = F[1];
    Color _colorPlanFri9_1 = F[2];
    Color _colorPlanFri9_2 = F[3];
    Color _colorPlanFri10_1 = F[4];
    Color _colorPlanFri10_2 = F[5];
    Color _colorPlanFri11_1 = F[6];
    Color _colorPlanFri11_2 = F[7];
    Color _colorPlanFri12_1 = F[8];
    Color _colorPlanFri12_2 = F[9];
    Color _colorPlanFri13_1 = F[10];
    Color _colorPlanFri13_2 = F[11];
    Color _colorPlanFri14_1 = F[12];
    Color _colorPlanFri14_2 = F[13];
    Color _colorPlanFri15_1 = F[14];
    Color _colorPlanFri15_2 = F[15];
    Color _colorPlanFri16_1 = F[16];
    Color _colorPlanFri16_2 = F[17];
    Color _colorPlanFri17_1 = F[18];
    Color _colorPlanFri17_2 = F[19];
    Color _colorPlanFri18_1 = F[20];
    Color _colorPlanFri18_2 = F[21];
    Color _colorPlanFri19_1 = F[22];
    Color _colorPlanFri19_2 = F[23];
    Color _colorPlanFri20_1 = F[24];
    Color _colorPlanFri20_2 = F[25];
    Color _colorPlanFri21_1 = F[26];
    Color _colorPlanFri21_2 = F[27];

    ///SAT
    Color _colorPlanSat7 = Colors.white;
    Color _colorPlanSat8_1 = SA[0];
    Color _colorPlanSat8_2 = SA[1];
    Color _colorPlanSat9_1 = SA[2];
    Color _colorPlanSat9_2 = SA[3];
    Color _colorPlanSat10_1 = SA[4];
    Color _colorPlanSat10_2 = SA[5];
    Color _colorPlanSat11_1 = SA[6];
    Color _colorPlanSat11_2 = SA[7];
    Color _colorPlanSat12_1 = SA[8];
    Color _colorPlanSat12_2 = SA[9];
    Color _colorPlanSat13_1 = SA[10];
    Color _colorPlanSat13_2 = SA[11];
    Color _colorPlanSat14_1 = SA[12];
    Color _colorPlanSat14_2 = SA[13];
    Color _colorPlanSat15_1 = SA[14];
    Color _colorPlanSat15_2 = SA[15];
    Color _colorPlanSat16_1 = SA[16];
    Color _colorPlanSat16_2 = SA[17];
    Color _colorPlanSat17_1 = SA[18];
    Color _colorPlanSat17_2 = SA[19];
    Color _colorPlanSat18_1 = SA[20];
    Color _colorPlanSat18_2 = SA[21];
    Color _colorPlanSat19_1 = SA[22];
    Color _colorPlanSat19_2 = SA[23];
    Color _colorPlanSat20_1 = SA[24];
    Color _colorPlanSat20_2 = SA[25];
    Color _colorPlanSat21_1 = SA[26];
    Color _colorPlanSat21_2 = SA[27];


    ///SUN
    Color _colorPlanSun7 = Colors.white;
    Color _colorPlanSun8_1 = SU[0];
    Color _colorPlanSun8_2 = SU[1];
    Color _colorPlanSun9_1 = SU[2];
    Color _colorPlanSun9_2 = SU[3];
    Color _colorPlanSun10_1 = SU[4];
    Color _colorPlanSun10_2 = SU[5];
    Color _colorPlanSun11_1 = SU[6];
    Color _colorPlanSun11_2 = SU[7];
    Color _colorPlanSun12_1 = SU[8];
    Color _colorPlanSun12_2 = SU[9];
    Color _colorPlanSun13_1 = SU[10];
    Color _colorPlanSun13_2 = SU[11];
    Color _colorPlanSun14_1 = SU[12];
    Color _colorPlanSun14_2 = SU[13];
    Color _colorPlanSun15_1 = SU[14];
    Color _colorPlanSun15_2 = SU[15];
    Color _colorPlanSun16_1 = SU[16];
    Color _colorPlanSun16_2 = SU[17];
    Color _colorPlanSun17_1 = SU[18];
    Color _colorPlanSun17_2 = SU[19];
    Color _colorPlanSun18_1 = SU[20];
    Color _colorPlanSun18_2 = SU[21];
    Color _colorPlanSun19_1 = SU[22];
    Color _colorPlanSun19_2 = SU[23];
    Color _colorPlanSun20_1 = SU[24];
    Color _colorPlanSun20_2 = SU[25];
    Color _colorPlanSun21_1 = SU[26];
    Color _colorPlanSun21_2 = SU[27];
    double _fontSize = 1.25;
    double FBWidth = 5.0;
    double FBHeight = 3.5;
    double FBTWidth = FBWidth;
    double FBTHeight = FBHeight/2;

    BoxDecoration myBoxDecoration() {
      return BoxDecoration(
        border: Border(
          bottom: BorderSide( //                   <--- left side
            color: Colors.black12,
            width: 0.1,
          ),
        ),
      );
    }
    return new CustomScrollView(
      slivers: <Widget>[
        SliverFixedExtentList(
          itemExtent: 850,
          delegate: SliverChildBuilderDelegate(
                (BuildContext context, int i) {
              return  new Container(
                child: new Column(
                  children: <Widget>[
                    new Container(
                      child: new Row(
                        children: [
                          new  Expanded(
                            child: Column(
                              children: [
                                new Container(
                                  child: Table(
                                    defaultVerticalAlignment: TableCellVerticalAlignment.top,
                                    children: <TableRow>[TableRow(children: <Widget>[
                                      FittedBox(
                                        fit: BoxFit.contain,
                                        child: Container(
                                          margin: EdgeInsets.all(0),
                                          color: _colorTableDay,
                                          width: FBWidth,
                                          height: FBHeight,
                                          child: Center(
                                            child: Text(
                                              "T/D",
                                              textAlign: TextAlign.center,
                                              style: TextStyle(
                                                color: _colorTextDay,
                                                fontSize: _fontSize,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                      FittedBox(
                                        fit: BoxFit.contain,
                                        child: Container(
                                          margin: EdgeInsets.all(0),
                                          color: _colorTableDay,
                                          width: FBWidth,
                                          height: FBHeight,
                                          child: Center(
                                            child: Text(
                                              "Mon",
                                              textAlign: TextAlign.center,
                                              style: TextStyle(
                                                color: _colorTextDay,
                                                fontSize: _fontSize,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                      FittedBox(
                                        fit: BoxFit.contain,
                                        child: Container(
                                          margin: EdgeInsets.all(0),
                                          color: _colorTableDay,
                                          width: FBWidth,
                                          height: FBHeight,
                                          child: Center(
                                            child: Text(
                                              "Tue",
                                              textAlign: TextAlign.center,
                                              style: TextStyle(
                                                color: _colorTextDay,
                                                fontSize: _fontSize,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                      FittedBox(
                                        fit: BoxFit.contain,
                                        child: Container(
                                          margin: EdgeInsets.all(0),
                                          color: _colorTableDay,
                                          width: FBWidth,
                                          height: FBHeight,
                                          child: Center(
                                            child: Text(
                                              "Wed",
                                              textAlign: TextAlign.center,
                                              style: TextStyle(
                                                color: _colorTextDay,
                                                fontSize: _fontSize,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                      FittedBox(
                                        fit: BoxFit.contain,
                                        child: Container(
                                          margin: EdgeInsets.all(0),
                                          color: _colorTableDay,
                                          width: FBWidth,
                                          height: FBHeight,
                                          child: Center(
                                            child: Text(
                                              "Thu",
                                              textAlign: TextAlign.center,
                                              style: TextStyle(
                                                color: _colorTextDay,
                                                fontSize: _fontSize,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                      FittedBox(
                                        fit: BoxFit.contain,
                                        child: Container(
                                          margin: EdgeInsets.all(0),
                                          color: _colorTableDay,
                                          width: FBWidth,
                                          height: FBHeight,
                                          child: Center(
                                            child: Text(
                                              "Fri",
                                              textAlign: TextAlign.center,
                                              style: TextStyle(
                                                color: _colorTextDay,
                                                fontSize: _fontSize,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                      FittedBox(
                                        fit: BoxFit.contain,
                                        child: Container(
                                          margin: EdgeInsets.all(0),
                                          color: _colorTableSat,
                                          width: FBWidth,
                                          height: FBHeight,
                                          child: Center(
                                            child: Text(
                                              "Sat",
                                              textAlign: TextAlign.center,
                                              style: TextStyle(
                                                color: _colorTextDay,
                                                fontSize: _fontSize,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                      FittedBox(
                                        fit: BoxFit.contain,
                                        child: Container(
                                          margin: EdgeInsets.all(0),
                                          color: _colorTableSun,
                                          width: FBWidth,
                                          height: FBHeight,
                                          child: Center(
                                            child: Text(
                                              "Sun",
                                              textAlign: TextAlign.center,
                                              style: TextStyle(
                                                color: _colorTextDay,
                                                fontSize: _fontSize,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ]),
                                      ///8.00
                                      TableRow(children: <Widget>[
                                        FittedBox(
                                          fit: BoxFit.contain,
                                          child: Container(
                                            margin: EdgeInsets.all(0),
                                            color: _colorTableTime,
                                            width: FBWidth,
                                            height: FBHeight,
                                            child: Center(
                                              child: Text(
                                                "8.00",
                                                textAlign: TextAlign.center,
                                                style: TextStyle(
                                                  color: _colorTextTime,
                                                  fontSize: _fontSize,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                        ///TimeColor
                                        FittedBox(
                                          fit: BoxFit.contain,
                                          child: Column(
                                            children: <Widget>[
                                              Container(
                                                decoration: myBoxDecoration(), //
                                                child: Container(
                                                  margin: EdgeInsets.all(0),
                                                  color: _colorPlanMon7,
                                                  width: FBTWidth,
                                                  height: FBTHeight,
                                                ),//     <--- BoxDecoration here
                                              ),
                                              Container(
                                                margin: EdgeInsets.all(0),
                                                color: _colorPlanMon8_1,
                                                width: FBTWidth,
                                                height: FBTHeight,
                                              ),
                                            ],
                                          ),
                                        ),
                                        FittedBox(
                                          fit: BoxFit.contain,
                                          child: Column(
                                            children: <Widget>[
                                              Container(
                                                decoration: myBoxDecoration(), //
                                                child: Container(
                                                  margin: EdgeInsets.all(0),
                                                  color: _colorPlanTue7,
                                                  width: FBTWidth,
                                                  height: FBTHeight,
                                                ),//     <--- BoxDecoration here
                                              ),
                                              Container(
                                                margin: EdgeInsets.all(0),
                                                color: _colorPlanTue8_1,
                                                width: FBTWidth,
                                                height: FBTHeight,
                                                child: Center(
                                                  child: Text(
                                                    "",
                                                    textAlign: TextAlign.center,
                                                    style: TextStyle(
                                                      color: Colors.white,
                                                      fontSize: 1,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        FittedBox(
                                          fit: BoxFit.contain,
                                          child: Column(
                                            children: <Widget>[
                                              Container(
                                                decoration: myBoxDecoration(), //
                                                child: Container(
                                                  margin: EdgeInsets.all(0),
                                                  color: _colorPlanWed7,
                                                  width: FBTWidth,
                                                  height: FBTHeight,
                                                ),//     <--- BoxDecoration here
                                              ),
                                              Container(
                                                margin: EdgeInsets.all(0),
                                                color: _colorPlanWed8_1,
                                                width: FBTWidth,
                                                height: FBTHeight,
                                              ),
                                            ],
                                          ),
                                        ),
                                        FittedBox(
                                          fit: BoxFit.contain,
                                          child: Column(
                                            children: <Widget>[
                                              Container(
                                                decoration: myBoxDecoration(), //
                                                child: Container(
                                                  margin: EdgeInsets.all(0),
                                                  color: _colorPlanThu7,
                                                  width: FBTWidth,
                                                  height: FBTHeight,
                                                ),//     <--- BoxDecoration here
                                              ),
                                              Container(
                                                margin: EdgeInsets.all(0),
                                                color: _colorPlanThu8_1,
                                                width: FBTWidth,
                                                height: FBTHeight,
                                              ),
                                            ],
                                          ),
                                        ),
                                        FittedBox(
                                          fit: BoxFit.contain,
                                          child: Column(
                                            children: <Widget>[
                                              Container(
                                                decoration: myBoxDecoration(), //
                                                child: Container(
                                                  margin: EdgeInsets.all(0),
                                                  color: _colorPlanFri7,
                                                  width: FBTWidth,
                                                  height: FBTHeight,
                                                ),//     <--- BoxDecoration here
                                              ),
                                              Container(
                                                margin: EdgeInsets.all(0),
                                                color: _colorPlanFri8_1,
                                                width: FBTWidth,
                                                height: FBTHeight,
                                              ),
                                            ],
                                          ),
                                        ),
                                        FittedBox(
                                          fit: BoxFit.contain,
                                          child: Column(
                                            children: <Widget>[
                                              Container(
                                                decoration: myBoxDecoration(), //
                                                child: Container(
                                                  margin: EdgeInsets.all(0),
                                                  color: _colorPlanSat7,
                                                  width: FBTWidth,
                                                  height: FBTHeight,
                                                  child: Center(
                                                    child: Text(
                                                      "",
                                                      textAlign: TextAlign.center,
                                                      style: TextStyle(
                                                        color: Colors.white,
                                                        fontSize: 1,
                                                      ),
                                                    ),
                                                  ),
                                                ),//     <--- BoxDecoration here
                                              ),
                                              Container(
                                                margin: EdgeInsets.all(0),
                                                color: _colorPlanSat8_1,
                                                width: FBTWidth,
                                                height: FBTHeight,
                                                child: Center(
                                                  child: Text(
                                                    "",
                                                    textAlign: TextAlign.center,
                                                    style: TextStyle(
                                                      color: Colors.white,
                                                      fontSize: 1,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        FittedBox(
                                          fit: BoxFit.contain,
                                          child: Column(
                                            children: <Widget>[
                                              Container(
                                                decoration: myBoxDecoration(), //
                                                child: Container(
                                                  margin: EdgeInsets.all(0),
                                                  color: _colorPlanSun7,
                                                  width: FBTWidth,
                                                  height: FBTHeight,
                                                ),//     <--- BoxDecoration here
                                              ),
                                              Container(
                                                margin: EdgeInsets.all(0),
                                                color: _colorPlanSun8_1,
                                                width: FBTWidth,
                                                height: FBTHeight,
                                              ),
                                            ],
                                          ),
                                        ),

                                      ]),
                                      ///9.00
                                      TableRow(children: <Widget>[
                                        FittedBox(
                                          fit: BoxFit.contain,
                                          child: Container(
                                            margin: EdgeInsets.all(0),
                                            color: _colorTableTime,
                                            width: FBWidth,
                                            height: FBHeight,
                                            child: Center(
                                              child: Text(
                                                "9.00",
                                                textAlign: TextAlign.center,
                                                style: TextStyle(
                                                  color: _colorTextTime,
                                                  fontSize: _fontSize,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                        ///TimeColor
                                        FittedBox(
                                          fit: BoxFit.contain,
                                          child: Column(
                                            children: <Widget>[
                                              Container(
                                                decoration: myBoxDecoration(), //
                                                child: Container(
                                                  margin: EdgeInsets.all(0),
                                                  color: _colorPlanMon8_2,
                                                  width: FBTWidth,
                                                  height: FBTHeight,
                                                ),//     <--- BoxDecoration here
                                              ),
                                              Container(
                                                margin: EdgeInsets.all(0),
                                                color: _colorPlanMon9_1,
                                                width: FBTWidth,
                                                height: FBTHeight,
                                              ),
                                            ],
                                          ),
                                        ),
                                        FittedBox(
                                          fit: BoxFit.contain,
                                          child: Column(
                                            children: <Widget>[
                                              Container(
                                                decoration: myBoxDecoration(), //
                                                child: Container(
                                                  margin: EdgeInsets.all(0),
                                                  color: _colorPlanTue8_2,
                                                  width: FBTWidth,
                                                  height: FBTHeight,
                                                ),//     <--- BoxDecoration here
                                              ),
                                              Container(
                                                margin: EdgeInsets.all(0),
                                                color: _colorPlanTue9_1,
                                                width: FBTWidth,
                                                height: FBTHeight,
                                                child: Center(
                                                  child: Text(
                                                    "",
                                                    textAlign: TextAlign.center,
                                                    style: TextStyle(
                                                      color: Colors.white,
                                                      fontSize: 1,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        FittedBox(
                                          fit: BoxFit.contain,
                                          child: Column(
                                            children: <Widget>[
                                              Container(
                                                decoration: myBoxDecoration(), //
                                                child: Container(
                                                  margin: EdgeInsets.all(0),
                                                  color: _colorPlanWed8_2,
                                                  width: FBTWidth,
                                                  height: FBTHeight,
                                                ),//     <--- BoxDecoration here
                                              ),
                                              Container(
                                                margin: EdgeInsets.all(0),
                                                color: _colorPlanWed9_1,
                                                width: FBTWidth,
                                                height: FBTHeight,
                                              ),
                                            ],
                                          ),
                                        ),
                                        FittedBox(
                                          fit: BoxFit.contain,
                                          child: Column(
                                            children: <Widget>[
                                              Container(
                                                decoration: myBoxDecoration(), //
                                                child: Container(
                                                  margin: EdgeInsets.all(0),
                                                  color: _colorPlanThu8_2,
                                                  width: FBTWidth,
                                                  height: FBTHeight,
                                                ),//     <--- BoxDecoration here
                                              ),
                                              Container(
                                                margin: EdgeInsets.all(0),
                                                color: _colorPlanThu9_1,
                                                width: FBTWidth,
                                                height: FBTHeight,
                                              ),
                                            ],
                                          ),
                                        ),
                                        FittedBox(
                                          fit: BoxFit.contain,
                                          child: Column(
                                            children: <Widget>[
                                              Container(
                                                decoration: myBoxDecoration(), //
                                                child: Container(
                                                  margin: EdgeInsets.all(0),
                                                  color: _colorPlanFri8_2,
                                                  width: FBTWidth,
                                                  height: FBTHeight,
                                                ),//     <--- BoxDecoration here
                                              ),
                                              Container(
                                                margin: EdgeInsets.all(0),
                                                color: _colorPlanFri9_1,
                                                width: FBTWidth,
                                                height: FBTHeight,
                                              ),
                                            ],
                                          ),
                                        ),
                                        FittedBox(
                                          fit: BoxFit.contain,
                                          child: Column(
                                            children: <Widget>[
                                              Container(
                                                decoration: myBoxDecoration(), //
                                                child: Container(
                                                  margin: EdgeInsets.all(0),
                                                  color: _colorPlanSat8_2,
                                                  width: FBTWidth,
                                                  height: FBTHeight,
                                                  child: Center(
                                                    child: Text(
                                                      "",
                                                      textAlign: TextAlign.center,
                                                      style: TextStyle(
                                                        color: Colors.white,
                                                        fontSize: 1,
                                                      ),
                                                    ),
                                                  ),
                                                ),//     <--- BoxDecoration here
                                              ),
                                              Container(
                                                margin: EdgeInsets.all(0),
                                                color: _colorPlanSat9_1,
                                                width: FBTWidth,
                                                height: FBTHeight,
                                                child: Center(
                                                  child: Text(
                                                    "",
                                                    textAlign: TextAlign.center,
                                                    style: TextStyle(
                                                      color: Colors.white,
                                                      fontSize: 1,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        FittedBox(
                                          fit: BoxFit.contain,
                                          child: Column(
                                            children: <Widget>[
                                              Container(
                                                decoration: myBoxDecoration(), //
                                                child: Container(
                                                  margin: EdgeInsets.all(0),
                                                  color: _colorPlanSun8_2,
                                                  width: FBTWidth,
                                                  height: FBTHeight,
                                                ),//     <--- BoxDecoration here
                                              ),
                                              Container(
                                                margin: EdgeInsets.all(0),
                                                color: _colorPlanSun9_1,
                                                width: FBTWidth,
                                                height: FBTHeight,
                                              ),
                                            ],
                                          ),
                                        ),

                                      ]),
                                      ///10.00
                                      TableRow(children: <Widget>[
                                        FittedBox(
                                          fit: BoxFit.contain,
                                          child: Container(
                                            margin: EdgeInsets.all(0),
                                            color: _colorTableTime,
                                            width: FBWidth,
                                            height: FBHeight,
                                            child: Center(
                                              child: Text(
                                                "10.00",
                                                textAlign: TextAlign.center,
                                                style: TextStyle(
                                                  color: _colorTextTime,
                                                  fontSize: _fontSize,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                        ///TimeColor
                                        FittedBox(
                                          fit: BoxFit.contain,
                                          child: Column(
                                            children: <Widget>[
                                              Container(
                                                decoration: myBoxDecoration(), //
                                                child: Container(
                                                  margin: EdgeInsets.all(0),
                                                  color: _colorPlanMon9_2,
                                                  width: FBTWidth,
                                                  height: FBTHeight,
                                                ),//     <--- BoxDecoration here
                                              ),
                                              Container(
                                                margin: EdgeInsets.all(0),
                                                color: _colorPlanMon10_1,
                                                width: FBTWidth,
                                                height: FBTHeight,
                                              ),
                                            ],
                                          ),
                                        ),
                                        FittedBox(
                                          fit: BoxFit.contain,
                                          child: Column(
                                            children: <Widget>[
                                              Container(
                                                decoration: myBoxDecoration(), //
                                                child: Container(
                                                  margin: EdgeInsets.all(0),
                                                  color: _colorPlanTue9_2,
                                                  width: FBTWidth,
                                                  height: FBTHeight,
                                                ),//     <--- BoxDecoration here
                                              ),
                                              Container(
                                                margin: EdgeInsets.all(0),
                                                color: _colorPlanTue10_1,
                                                width: FBTWidth,
                                                height: FBTHeight,

                                              ),
                                            ],
                                          ),
                                        ),
                                        FittedBox(
                                          fit: BoxFit.contain,
                                          child: Column(
                                            children: <Widget>[
                                              Container(
                                                decoration: myBoxDecoration(), //
                                                child: Container(
                                                  margin: EdgeInsets.all(0),
                                                  color: _colorPlanWed9_2,
                                                  width: FBTWidth,
                                                  height: FBTHeight,
                                                ),//     <--- BoxDecoration here
                                              ),
                                              Container(
                                                margin: EdgeInsets.all(0),
                                                color: _colorPlanWed10_1,
                                                width: FBTWidth,
                                                height: FBTHeight,
                                              ),
                                            ],
                                          ),
                                        ),
                                        FittedBox(
                                          fit: BoxFit.contain,
                                          child: Column(
                                            children: <Widget>[
                                              Container(
                                                decoration: myBoxDecoration(), //
                                                child: Container(
                                                  margin: EdgeInsets.all(0),
                                                  color: _colorPlanThu9_2,
                                                  width: FBTWidth,
                                                  height: FBTHeight,
                                                ),//     <--- BoxDecoration here
                                              ),
                                              Container(
                                                margin: EdgeInsets.all(0),
                                                color: _colorPlanThu10_1,
                                                width: FBTWidth,
                                                height: FBTHeight,
                                              ),
                                            ],
                                          ),
                                        ),
                                        FittedBox(
                                          fit: BoxFit.contain,
                                          child: Column(
                                            children: <Widget>[
                                              Container(
                                                decoration: myBoxDecoration(), //
                                                child: Container(
                                                  margin: EdgeInsets.all(0),
                                                  color: _colorPlanFri9_2,
                                                  width: FBTWidth,
                                                  height: FBTHeight,
                                                ),//     <--- BoxDecoration here
                                              ),
                                              Container(
                                                margin: EdgeInsets.all(0),
                                                color: _colorPlanFri10_1,
                                                width: FBTWidth,
                                                height: FBTHeight,
                                              ),
                                            ],
                                          ),
                                        ),
                                        FittedBox(
                                          fit: BoxFit.contain,
                                          child: Column(
                                            children: <Widget>[
                                              Container(
                                                decoration: myBoxDecoration(), //
                                                child: Container(
                                                  margin: EdgeInsets.all(0),
                                                  color: _colorPlanSat9_2,
                                                  width: FBTWidth,
                                                  height: FBTHeight,
                                                ),//     <--- BoxDecoration here
                                              ),
                                              Container(
                                                margin: EdgeInsets.all(0),
                                                color: _colorPlanSat10_1,
                                                width: FBTWidth,
                                                height: FBTHeight,
                                                child: Center(
                                                  child: Text(
                                                    "",
                                                    textAlign: TextAlign.center,
                                                    style: TextStyle(
                                                      color: Colors.white,
                                                      fontSize: 1,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        FittedBox(
                                          fit: BoxFit.contain,
                                          child: Column(
                                            children: <Widget>[
                                              Container(
                                                decoration: myBoxDecoration(), //
                                                child: Container(
                                                  margin: EdgeInsets.all(0),
                                                  color: _colorPlanSun9_2,
                                                  width: FBTWidth,
                                                  height: FBTHeight,
                                                ),//     <--- BoxDecoration here
                                              ),
                                              Container(
                                                margin: EdgeInsets.all(0),
                                                color: _colorPlanSun10_1,
                                                width: FBTWidth,
                                                height: FBTHeight,
                                              ),
                                            ],
                                          ),
                                        ),

                                      ]),
                                      ///11.00
                                      TableRow(children: <Widget>[
                                        FittedBox(
                                          fit: BoxFit.contain,
                                          child: Container(
                                            margin: EdgeInsets.all(0),
                                            color: _colorTableTime,
                                            width: FBWidth,
                                            height: FBHeight,
                                            child: Center(
                                              child: Text(
                                                "11.00",
                                                textAlign: TextAlign.center,
                                                style: TextStyle(
                                                  color: _colorTextTime,
                                                  fontSize: _fontSize,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                        ///TimeColor
                                        FittedBox(
                                          fit: BoxFit.contain,
                                          child: Column(
                                            children: <Widget>[
                                              Container(
                                                decoration: myBoxDecoration(), //
                                                child: Container(
                                                  margin: EdgeInsets.all(0),
                                                  color: _colorPlanMon10_2,
                                                  width: FBTWidth,
                                                  height: FBTHeight,
                                                ),//     <--- BoxDecoration here
                                              ),
                                              Container(
                                                margin: EdgeInsets.all(0),
                                                color: _colorPlanMon11_1,
                                                width: FBTWidth,
                                                height: FBTHeight,
                                              ),
                                            ],
                                          ),
                                        ),
                                        FittedBox(
                                          fit: BoxFit.contain,
                                          child: Column(
                                            children: <Widget>[
                                              Container(
                                                decoration: myBoxDecoration(), //
                                                child: Container(
                                                  margin: EdgeInsets.all(0),
                                                  color: _colorPlanTue10_2,
                                                  width: FBTWidth,
                                                  height: FBTHeight,
                                                ),//     <--- BoxDecoration here
                                              ),
                                              Container(
                                                margin: EdgeInsets.all(0),
                                                color: _colorPlanTue11_1,
                                                width: FBTWidth,
                                                height: FBTHeight,

                                              ),
                                            ],
                                          ),
                                        ),
                                        FittedBox(
                                          fit: BoxFit.contain,
                                          child: Column(
                                            children: <Widget>[
                                              Container(
                                                decoration: myBoxDecoration(), //
                                                child: Container(
                                                  margin: EdgeInsets.all(0),
                                                  color: _colorPlanWed10_2,
                                                  width: FBTWidth,
                                                  height: FBTHeight,
                                                ),//     <--- BoxDecoration here
                                              ),
                                              Container(
                                                margin: EdgeInsets.all(0),
                                                color: _colorPlanWed11_1,
                                                width: FBTWidth,
                                                height: FBTHeight,
                                              ),
                                            ],
                                          ),
                                        ),
                                        FittedBox(
                                          fit: BoxFit.contain,
                                          child: Column(
                                            children: <Widget>[
                                              Container(
                                                decoration: myBoxDecoration(), //
                                                child: Container(
                                                  margin: EdgeInsets.all(0),
                                                  color: _colorPlanThu10_2,
                                                  width: FBTWidth,
                                                  height: FBTHeight,
                                                ),//     <--- BoxDecoration here
                                              ),
                                              Container(
                                                margin: EdgeInsets.all(0),
                                                color: _colorPlanThu11_1,
                                                width: FBTWidth,
                                                height: FBTHeight,
                                              ),
                                            ],
                                          ),
                                        ),
                                        FittedBox(
                                          fit: BoxFit.contain,
                                          child: Column(
                                            children: <Widget>[
                                              Container(
                                                decoration: myBoxDecoration(), //
                                                child: Container(
                                                  margin: EdgeInsets.all(0),
                                                  color: _colorPlanFri10_2,
                                                  width: FBTWidth,
                                                  height: FBTHeight,
                                                ),//     <--- BoxDecoration here
                                              ),
                                              Container(
                                                margin: EdgeInsets.all(0),
                                                color: _colorPlanFri11_1,
                                                width: FBTWidth,
                                                height: FBTHeight,
                                              ),
                                            ],
                                          ),
                                        ),
                                        FittedBox(
                                          fit: BoxFit.contain,
                                          child: Column(
                                            children: <Widget>[
                                              Container(
                                                decoration: myBoxDecoration(), //
                                                child: Container(
                                                  margin: EdgeInsets.all(0),
                                                  color: _colorPlanSat10_2,
                                                  width: FBTWidth,
                                                  height: FBTHeight,
                                                ),//     <--- BoxDecoration here
                                              ),
                                              Container(
                                                margin: EdgeInsets.all(0),
                                                color: _colorPlanSat11_1,
                                                width: FBTWidth,
                                                height: FBTHeight,
                                                child: Center(
                                                  child: Text(
                                                    "",
                                                    textAlign: TextAlign.center,
                                                    style: TextStyle(
                                                      color: Colors.white,
                                                      fontSize: 1,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        FittedBox(
                                          fit: BoxFit.contain,
                                          child: Column(
                                            children: <Widget>[
                                              Container(
                                                decoration: myBoxDecoration(), //
                                                child: Container(
                                                  margin: EdgeInsets.all(0),
                                                  color: _colorPlanSun10_2,
                                                  width: FBTWidth,
                                                  height: FBTHeight,
                                                ),//     <--- BoxDecoration here
                                              ),
                                              Container(
                                                margin: EdgeInsets.all(0),
                                                color: _colorPlanSun11_1,
                                                width: FBTWidth,
                                                height: FBTHeight,
                                              ),
                                            ],
                                          ),
                                        ),

                                      ]),
                                      ///12.00
                                      TableRow(children: <Widget>[
                                        FittedBox(
                                          fit: BoxFit.contain,
                                          child: Container(
                                            margin: EdgeInsets.all(0),
                                            color: _colorTableTime,
                                            width: FBWidth,
                                            height: FBHeight,
                                            child: Center(
                                              child: Text(
                                                "12.00",
                                                textAlign: TextAlign.center,
                                                style: TextStyle(
                                                  color: _colorTextTime,
                                                  fontSize: _fontSize,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                        ///TimeColor
                                        FittedBox(
                                          fit: BoxFit.contain,
                                          child: Column(
                                            children: <Widget>[
                                              Container(
                                                decoration: myBoxDecoration(), //
                                                child: Container(
                                                  margin: EdgeInsets.all(0),
                                                  color: _colorPlanMon11_2,
                                                  width: FBTWidth,
                                                  height: FBTHeight,
                                                ),//     <--- BoxDecoration here
                                              ),
                                              Container(
                                                margin: EdgeInsets.all(0),
                                                color: _colorPlanMon12_1,
                                                width: FBTWidth,
                                                height: FBTHeight,
                                              ),
                                            ],
                                          ),
                                        ),
                                        FittedBox(
                                          fit: BoxFit.contain,
                                          child: Column(
                                            children: <Widget>[
                                              Container(
                                                decoration: myBoxDecoration(), //
                                                child: Container(
                                                  margin: EdgeInsets.all(0),
                                                  color: _colorPlanTue11_2,
                                                  width: FBTWidth,
                                                  height: FBTHeight,
                                                ),//     <--- BoxDecoration here
                                              ),
                                              Container(
                                                margin: EdgeInsets.all(0),
                                                color: _colorPlanTue12_1,
                                                width: FBTWidth,
                                                height: FBTHeight,

                                              ),
                                            ],
                                          ),
                                        ),
                                        FittedBox(
                                          fit: BoxFit.contain,
                                          child: Column(
                                            children: <Widget>[
                                              Container(
                                                decoration: myBoxDecoration(), //
                                                child: Container(
                                                  margin: EdgeInsets.all(0),
                                                  color: _colorPlanWed11_2,
                                                  width: FBTWidth,
                                                  height: FBTHeight,
                                                ),//     <--- BoxDecoration here
                                              ),
                                              Container(
                                                margin: EdgeInsets.all(0),
                                                color: _colorPlanWed12_1,
                                                width: FBTWidth,
                                                height: FBTHeight,
                                              ),
                                            ],
                                          ),
                                        ),
                                        FittedBox(
                                          fit: BoxFit.contain,
                                          child: Column(
                                            children: <Widget>[
                                              Container(
                                                decoration: myBoxDecoration(), //
                                                child: Container(
                                                  margin: EdgeInsets.all(0),
                                                  color: _colorPlanThu11_2,
                                                  width: FBTWidth,
                                                  height: FBTHeight,
                                                ),//     <--- BoxDecoration here
                                              ),
                                              Container(
                                                margin: EdgeInsets.all(0),
                                                color: _colorPlanThu12_1,
                                                width: FBTWidth,
                                                height: FBTHeight,
                                              ),
                                            ],
                                          ),
                                        ),
                                        FittedBox(
                                          fit: BoxFit.contain,
                                          child: Column(
                                            children: <Widget>[
                                              Container(
                                                decoration: myBoxDecoration(), //
                                                child: Container(
                                                  margin: EdgeInsets.all(0),
                                                  color: _colorPlanFri11_2,
                                                  width: FBTWidth,
                                                  height: FBTHeight,
                                                ),//     <--- BoxDecoration here
                                              ),
                                              Container(
                                                margin: EdgeInsets.all(0),
                                                color: _colorPlanFri12_1,
                                                width: FBTWidth,
                                                height: FBTHeight,
                                              ),
                                            ],
                                          ),
                                        ),
                                        FittedBox(
                                          fit: BoxFit.contain,
                                          child: Column(
                                            children: <Widget>[
                                              Container(
                                                decoration: myBoxDecoration(), //
                                                child: Container(
                                                  margin: EdgeInsets.all(0),
                                                  color: _colorPlanSat11_2,
                                                  width: FBTWidth,
                                                  height: FBTHeight,
                                                ),//     <--- BoxDecoration here
                                              ),
                                              Container(
                                                margin: EdgeInsets.all(0),
                                                color: _colorPlanSat12_1,
                                                width: FBTWidth,
                                                height: FBTHeight,
                                                child: Center(
                                                  child: Text(
                                                    "",
                                                    textAlign: TextAlign.center,
                                                    style: TextStyle(
                                                      color: Colors.white,
                                                      fontSize: 1,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        FittedBox(
                                          fit: BoxFit.contain,
                                          child: Column(
                                            children: <Widget>[
                                              Container(
                                                decoration: myBoxDecoration(), //
                                                child: Container(
                                                  margin: EdgeInsets.all(0),
                                                  color: _colorPlanSun11_2,
                                                  width: FBTWidth,
                                                  height: FBTHeight,
                                                ),//     <--- BoxDecoration here
                                              ),
                                              Container(
                                                margin: EdgeInsets.all(0),
                                                color: _colorPlanSun12_1,
                                                width: FBTWidth,
                                                height: FBTHeight,
                                              ),
                                            ],
                                          ),
                                        ),

                                      ]),
                                      ///13.00
                                      TableRow(children: <Widget>[
                                        FittedBox(
                                          fit: BoxFit.contain,
                                          child: Container(
                                            margin: EdgeInsets.all(0),
                                            color: _colorTableTime,
                                            width: FBWidth,
                                            height: FBHeight,
                                            child: Center(
                                              child: Text(
                                                "13.00",
                                                textAlign: TextAlign.center,
                                                style: TextStyle(
                                                  color: _colorTextTime,
                                                  fontSize: _fontSize,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                        ///TimeColor
                                        FittedBox(
                                          fit: BoxFit.contain,
                                          child: Column(
                                            children: <Widget>[
                                              Container(
                                                decoration: myBoxDecoration(), //
                                                child: Container(
                                                  margin: EdgeInsets.all(0),
                                                  color: _colorPlanMon12_2,
                                                  width: FBTWidth,
                                                  height: FBTHeight,
                                                ),//     <--- BoxDecoration here
                                              ),
                                              Container(
                                                margin: EdgeInsets.all(0),
                                                color: _colorPlanMon13_1,
                                                width: FBTWidth,
                                                height: FBTHeight,
                                              ),
                                            ],
                                          ),
                                        ),
                                        FittedBox(
                                          fit: BoxFit.contain,
                                          child: Column(
                                            children: <Widget>[
                                              Container(
                                                decoration: myBoxDecoration(), //
                                                child: Container(
                                                  margin: EdgeInsets.all(0),
                                                  color: _colorPlanTue12_2,
                                                  width: FBTWidth,
                                                  height: FBTHeight,
                                                ),//     <--- BoxDecoration here
                                              ),
                                              Container(
                                                margin: EdgeInsets.all(0),
                                                color: _colorPlanTue13_1,
                                                width: FBTWidth,
                                                height: FBTHeight,

                                              ),
                                            ],
                                          ),
                                        ),
                                        FittedBox(
                                          fit: BoxFit.contain,
                                          child: Column(
                                            children: <Widget>[
                                              Container(
                                                decoration: myBoxDecoration(), //
                                                child: Container(
                                                  margin: EdgeInsets.all(0),
                                                  color: _colorPlanWed12_2,
                                                  width: FBTWidth,
                                                  height: FBTHeight,
                                                ),//     <--- BoxDecoration here
                                              ),
                                              Container(
                                                margin: EdgeInsets.all(0),
                                                color: _colorPlanWed13_1,
                                                width: FBTWidth,
                                                height: FBTHeight,
                                              ),
                                            ],
                                          ),
                                        ),
                                        FittedBox(
                                          fit: BoxFit.contain,
                                          child: Column(
                                            children: <Widget>[
                                              Container(
                                                decoration: myBoxDecoration(), //
                                                child: Container(
                                                  margin: EdgeInsets.all(0),
                                                  color: _colorPlanThu12_2,
                                                  width: FBTWidth,
                                                  height: FBTHeight,
                                                ),//     <--- BoxDecoration here
                                              ),
                                              Container(
                                                margin: EdgeInsets.all(0),
                                                color: _colorPlanThu13_1,
                                                width: FBTWidth,
                                                height: FBTHeight,
                                              ),
                                            ],
                                          ),
                                        ),
                                        FittedBox(
                                          fit: BoxFit.contain,
                                          child: Column(
                                            children: <Widget>[
                                              Container(
                                                decoration: myBoxDecoration(), //
                                                child: Container(
                                                  margin: EdgeInsets.all(0),
                                                  color: _colorPlanFri12_2,
                                                  width: FBTWidth,
                                                  height: FBTHeight,
                                                ),//     <--- BoxDecoration here
                                              ),
                                              Container(
                                                margin: EdgeInsets.all(0),
                                                color: _colorPlanFri13_1,
                                                width: FBTWidth,
                                                height: FBTHeight,
                                              ),
                                            ],
                                          ),
                                        ),
                                        FittedBox(
                                          fit: BoxFit.contain,
                                          child: Column(
                                            children: <Widget>[
                                              Container(
                                                decoration: myBoxDecoration(), //
                                                child: Container(
                                                  margin: EdgeInsets.all(0),
                                                  color: _colorPlanSat12_2,
                                                  width: FBTWidth,
                                                  height: FBTHeight,
                                                ),//     <--- BoxDecoration here
                                              ),
                                              Container(
                                                margin: EdgeInsets.all(0),
                                                color: _colorPlanSat13_1,
                                                width: FBTWidth,
                                                height: FBTHeight,
                                              ),
                                            ],
                                          ),
                                        ),
                                        FittedBox(
                                          fit: BoxFit.contain,
                                          child: Column(
                                            children: <Widget>[
                                              Container(
                                                decoration: myBoxDecoration(), //
                                                child: Container(
                                                  margin: EdgeInsets.all(0),
                                                  color: _colorPlanSun12_2,
                                                  width: FBTWidth,
                                                  height: FBTHeight,
                                                ),//     <--- BoxDecoration here
                                              ),
                                              Container(
                                                margin: EdgeInsets.all(0),
                                                color: _colorPlanSun13_1,
                                                width: FBTWidth,
                                                height: FBTHeight,
                                              ),
                                            ],
                                          ),
                                        ),

                                      ]),
                                      ///14.00
                                      TableRow(children: <Widget>[
                                        FittedBox(
                                          fit: BoxFit.contain,
                                          child: Container(
                                            margin: EdgeInsets.all(0),
                                            color: _colorTableTime,
                                            width: FBWidth,
                                            height: FBHeight,
                                            child: Center(
                                              child: Text(
                                                "14.00",
                                                textAlign: TextAlign.center,
                                                style: TextStyle(
                                                  color: _colorTextTime,
                                                  fontSize: _fontSize,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                        ///TimeColor
                                        FittedBox(
                                          fit: BoxFit.contain,
                                          child: Column(
                                            children: <Widget>[
                                              Container(
                                                decoration: myBoxDecoration(), //
                                                child: Container(
                                                  margin: EdgeInsets.all(0),
                                                  color: _colorPlanMon13_2,
                                                  width: FBTWidth,
                                                  height: FBTHeight,
                                                ),//     <--- BoxDecoration here
                                              ),
                                              Container(
                                                margin: EdgeInsets.all(0),
                                                color: _colorPlanMon14_1,
                                                width: FBTWidth,
                                                height: FBTHeight,
                                              ),
                                            ],
                                          ),
                                        ),
                                        FittedBox(
                                          fit: BoxFit.contain,
                                          child: Column(
                                            children: <Widget>[
                                              Container(
                                                decoration: myBoxDecoration(), //
                                                child: Container(
                                                  margin: EdgeInsets.all(0),
                                                  color: _colorPlanTue13_2,
                                                  width: FBTWidth,
                                                  height: FBTHeight,
                                                ),//     <--- BoxDecoration here
                                              ),
                                              Container(
                                                margin: EdgeInsets.all(0),
                                                color: _colorPlanTue14_1,
                                                width: FBTWidth,
                                                height: FBTHeight,

                                              ),
                                            ],
                                          ),
                                        ),
                                        FittedBox(
                                          fit: BoxFit.contain,
                                          child: Column(
                                            children: <Widget>[
                                              Container(
                                                decoration: myBoxDecoration(), //
                                                child: Container(
                                                  margin: EdgeInsets.all(0),
                                                  color: _colorPlanWed13_2,
                                                  width: FBTWidth,
                                                  height: FBTHeight,
                                                ),//     <--- BoxDecoration here
                                              ),
                                              Container(
                                                margin: EdgeInsets.all(0),
                                                color: _colorPlanWed14_1,
                                                width: FBTWidth,
                                                height: FBTHeight,
                                              ),
                                            ],
                                          ),
                                        ),
                                        FittedBox(
                                          fit: BoxFit.contain,
                                          child: Column(
                                            children: <Widget>[
                                              Container(
                                                decoration: myBoxDecoration(), //
                                                child: Container(
                                                  margin: EdgeInsets.all(0),
                                                  color: _colorPlanThu13_2,
                                                  width: FBTWidth,
                                                  height: FBTHeight,
                                                ),//     <--- BoxDecoration here
                                              ),
                                              Container(
                                                margin: EdgeInsets.all(0),
                                                color: _colorPlanThu14_1,
                                                width: FBTWidth,
                                                height: FBTHeight,
                                              ),
                                            ],
                                          ),
                                        ),
                                        FittedBox(
                                          fit: BoxFit.contain,
                                          child: Column(
                                            children: <Widget>[
                                              Container(
                                                decoration: myBoxDecoration(), //
                                                child: Container(
                                                  margin: EdgeInsets.all(0),
                                                  color: _colorPlanFri13_2,
                                                  width: FBTWidth,
                                                  height: FBTHeight,
                                                ),//     <--- BoxDecoration here
                                              ),
                                              Container(
                                                margin: EdgeInsets.all(0),
                                                color: _colorPlanFri14_1,
                                                width: FBTWidth,
                                                height: FBTHeight,
                                              ),
                                            ],
                                          ),
                                        ),
                                        FittedBox(
                                          fit: BoxFit.contain,
                                          child: Column(
                                            children: <Widget>[
                                              Container(
                                                decoration: myBoxDecoration(), //
                                                child: Container(
                                                  margin: EdgeInsets.all(0),
                                                  color: _colorPlanSat13_2,
                                                  width: FBTWidth,
                                                  height: FBTHeight,
                                                ),//     <--- BoxDecoration here
                                              ),
                                              Container(
                                                margin: EdgeInsets.all(0),
                                                color: _colorPlanSat14_1,
                                                width: FBTWidth,
                                                height: FBTHeight,
                                              ),
                                            ],
                                          ),
                                        ),
                                        FittedBox(
                                          fit: BoxFit.contain,
                                          child: Column(
                                            children: <Widget>[
                                              Container(
                                                decoration: myBoxDecoration(), //
                                                child: Container(
                                                  margin: EdgeInsets.all(0),
                                                  color: _colorPlanSun13_2,
                                                  width: FBTWidth,
                                                  height: FBTHeight,
                                                ),//     <--- BoxDecoration here
                                              ),
                                              Container(
                                                margin: EdgeInsets.all(0),
                                                color: _colorPlanSun14_1,
                                                width: FBTWidth,
                                                height: FBTHeight,
                                              ),
                                            ],
                                          ),
                                        ),

                                      ]),
                                      ///15.00
                                      TableRow(children: <Widget>[
                                        FittedBox(
                                          fit: BoxFit.contain,
                                          child: Container(
                                            margin: EdgeInsets.all(0),
                                            color: _colorTableTime,
                                            width: FBWidth,
                                            height: FBHeight,
                                            child: Center(
                                              child: Text(
                                                "15.00",
                                                textAlign: TextAlign.center,
                                                style: TextStyle(
                                                  color: _colorTextTime,
                                                  fontSize: _fontSize,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                        ///TimeColor
                                        FittedBox(
                                          fit: BoxFit.contain,
                                          child: Column(
                                            children: <Widget>[
                                              Container(
                                                decoration: myBoxDecoration(), //
                                                child: Container(
                                                  margin: EdgeInsets.all(0),
                                                  color: _colorPlanMon14_2,
                                                  width: FBTWidth,
                                                  height: FBTHeight,
                                                ),//     <--- BoxDecoration here
                                              ),
                                              Container(
                                                margin: EdgeInsets.all(0),
                                                color: _colorPlanMon15_1,
                                                width: FBTWidth,
                                                height: FBTHeight,
                                              ),
                                            ],
                                          ),
                                        ),
                                        FittedBox(
                                          fit: BoxFit.contain,
                                          child: Column(
                                            children: <Widget>[
                                              Container(
                                                decoration: myBoxDecoration(), //
                                                child: Container(
                                                  margin: EdgeInsets.all(0),
                                                  color: _colorPlanTue14_2,
                                                  width: FBTWidth,
                                                  height: FBTHeight,
                                                ),//     <--- BoxDecoration here
                                              ),
                                              Container(
                                                margin: EdgeInsets.all(0),
                                                color: _colorPlanTue15_1,
                                                width: FBTWidth,
                                                height: FBTHeight,

                                              ),
                                            ],
                                          ),
                                        ),
                                        FittedBox(
                                          fit: BoxFit.contain,
                                          child: Column(
                                            children: <Widget>[
                                              Container(
                                                decoration: myBoxDecoration(), //
                                                child: Container(
                                                  margin: EdgeInsets.all(0),
                                                  color: _colorPlanWed14_2,
                                                  width: FBTWidth,
                                                  height: FBTHeight,
                                                ),//     <--- BoxDecoration here
                                              ),
                                              Container(
                                                margin: EdgeInsets.all(0),
                                                color: _colorPlanWed15_1,
                                                width: FBTWidth,
                                                height: FBTHeight,
                                              ),
                                            ],
                                          ),
                                        ),
                                        FittedBox(
                                          fit: BoxFit.contain,
                                          child: Column(
                                            children: <Widget>[
                                              Container(
                                                decoration: myBoxDecoration(), //
                                                child: Container(
                                                  margin: EdgeInsets.all(0),
                                                  color: _colorPlanThu14_2,
                                                  width: FBTWidth,
                                                  height: FBTHeight,
                                                ),//     <--- BoxDecoration here
                                              ),
                                              Container(
                                                margin: EdgeInsets.all(0),
                                                color: _colorPlanThu15_1,
                                                width: FBTWidth,
                                                height: FBTHeight,
                                              ),
                                            ],
                                          ),
                                        ),
                                        FittedBox(
                                          fit: BoxFit.contain,
                                          child: Column(
                                            children: <Widget>[
                                              Container(
                                                decoration: myBoxDecoration(), //
                                                child: Container(
                                                  margin: EdgeInsets.all(0),
                                                  color: _colorPlanFri14_2,
                                                  width: FBTWidth,
                                                  height: FBTHeight,
                                                ),//     <--- BoxDecoration here
                                              ),
                                              Container(
                                                margin: EdgeInsets.all(0),
                                                color: _colorPlanFri15_1,
                                                width: FBTWidth,
                                                height: FBTHeight,
                                              ),
                                            ],
                                          ),
                                        ),
                                        FittedBox(
                                          fit: BoxFit.contain,
                                          child: Column(
                                            children: <Widget>[
                                              Container(
                                                decoration: myBoxDecoration(), //
                                                child: Container(
                                                  margin: EdgeInsets.all(0),
                                                  color: _colorPlanSat14_2,
                                                  width: FBTWidth,
                                                  height: FBTHeight,
                                                ),//     <--- BoxDecoration here
                                              ),
                                              Container(
                                                margin: EdgeInsets.all(0),
                                                color: _colorPlanSat15_1,
                                                width: FBTWidth,
                                                height: FBTHeight,
                                              ),
                                            ],
                                          ),
                                        ),
                                        FittedBox(
                                          fit: BoxFit.contain,
                                          child: Column(
                                            children: <Widget>[
                                              Container(
                                                decoration: myBoxDecoration(), //
                                                child: Container(
                                                  margin: EdgeInsets.all(0),
                                                  color: _colorPlanSun14_2,
                                                  width: FBTWidth,
                                                  height: FBTHeight,
                                                ),//     <--- BoxDecoration here
                                              ),
                                              Container(
                                                margin: EdgeInsets.all(0),
                                                color: _colorPlanSun15_1,
                                                width: FBTWidth,
                                                height: FBTHeight,
                                              ),
                                            ],
                                          ),
                                        ),

                                      ]),
                                      ///16.00
                                      TableRow(children: <Widget>[
                                        FittedBox(
                                          fit: BoxFit.contain,
                                          child: Container(
                                            margin: EdgeInsets.all(0),
                                            color: _colorTableTime,
                                            width: FBWidth,
                                            height: FBHeight,
                                            child: Center(
                                              child: Text(
                                                "16.00",
                                                textAlign: TextAlign.center,
                                                style: TextStyle(
                                                  color: _colorTextTime,
                                                  fontSize: _fontSize,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                        ///TimeColor
                                        FittedBox(
                                          fit: BoxFit.contain,
                                          child: Column(
                                            children: <Widget>[
                                              Container(
                                                decoration: myBoxDecoration(), //
                                                child: Container(
                                                  margin: EdgeInsets.all(0),
                                                  color: _colorPlanMon15_2,
                                                  width: FBTWidth,
                                                  height: FBTHeight,
                                                ),//     <--- BoxDecoration here
                                              ),
                                              Container(
                                                margin: EdgeInsets.all(0),
                                                color: _colorPlanMon16_1,
                                                width: FBTWidth,
                                                height: FBTHeight,
                                              ),
                                            ],
                                          ),
                                        ),
                                        FittedBox(
                                          fit: BoxFit.contain,
                                          child: Column(
                                            children: <Widget>[
                                              Container(
                                                decoration: myBoxDecoration(), //
                                                child: Container(
                                                  margin: EdgeInsets.all(0),
                                                  color: _colorPlanTue15_2,
                                                  width: FBTWidth,
                                                  height: FBTHeight,
                                                ),//     <--- BoxDecoration here
                                              ),
                                              Container(
                                                margin: EdgeInsets.all(0),
                                                color: _colorPlanTue16_1,
                                                width: FBTWidth,
                                                height: FBTHeight,

                                              ),
                                            ],
                                          ),
                                        ),
                                        FittedBox(
                                          fit: BoxFit.contain,
                                          child: Column(
                                            children: <Widget>[
                                              Container(
                                                decoration: myBoxDecoration(), //
                                                child: Container(
                                                  margin: EdgeInsets.all(0),
                                                  color: _colorPlanWed15_2,
                                                  width: FBTWidth,
                                                  height: FBTHeight,
                                                ),//     <--- BoxDecoration here
                                              ),
                                              Container(
                                                margin: EdgeInsets.all(0),
                                                color: _colorPlanWed16_1,
                                                width: FBTWidth,
                                                height: FBTHeight,
                                              ),
                                            ],
                                          ),
                                        ),
                                        FittedBox(
                                          fit: BoxFit.contain,
                                          child: Column(
                                            children: <Widget>[
                                              Container(
                                                decoration: myBoxDecoration(), //
                                                child: Container(
                                                  margin: EdgeInsets.all(0),
                                                  color: _colorPlanThu15_2,
                                                  width: FBTWidth,
                                                  height: FBTHeight,
                                                ),//     <--- BoxDecoration here
                                              ),
                                              Container(
                                                margin: EdgeInsets.all(0),
                                                color: _colorPlanThu16_1,
                                                width: FBTWidth,
                                                height: FBTHeight,
                                              ),
                                            ],
                                          ),
                                        ),
                                        FittedBox(
                                          fit: BoxFit.contain,
                                          child: Column(
                                            children: <Widget>[
                                              Container(
                                                decoration: myBoxDecoration(), //
                                                child: Container(
                                                  margin: EdgeInsets.all(0),
                                                  color: _colorPlanFri15_2,
                                                  width: FBTWidth,
                                                  height: FBTHeight,
                                                ),//     <--- BoxDecoration here
                                              ),
                                              Container(
                                                margin: EdgeInsets.all(0),
                                                color: _colorPlanFri16_1,
                                                width: FBTWidth,
                                                height: FBTHeight,
                                              ),
                                            ],
                                          ),
                                        ),
                                        FittedBox(
                                          fit: BoxFit.contain,
                                          child: Column(
                                            children: <Widget>[
                                              Container(
                                                decoration: myBoxDecoration(), //
                                                child: Container(
                                                  margin: EdgeInsets.all(0),
                                                  color: _colorPlanSat15_2,
                                                  width: FBTWidth,
                                                  height: FBTHeight,
                                                ),//     <--- BoxDecoration here
                                              ),
                                              Container(
                                                margin: EdgeInsets.all(0),
                                                color: _colorPlanSat16_1,
                                                width: FBTWidth,
                                                height: FBTHeight,
                                              ),
                                            ],
                                          ),
                                        ),
                                        FittedBox(
                                          fit: BoxFit.contain,
                                          child: Column(
                                            children: <Widget>[
                                              Container(
                                                decoration: myBoxDecoration(), //
                                                child: Container(
                                                  margin: EdgeInsets.all(0),
                                                  color: _colorPlanSun15_2,
                                                  width: FBTWidth,
                                                  height: FBTHeight,
                                                ),//     <--- BoxDecoration here
                                              ),
                                              Container(
                                                margin: EdgeInsets.all(0),
                                                color: _colorPlanSun16_1,
                                                width: FBTWidth,
                                                height: FBTHeight,
                                              ),
                                            ],
                                          ),
                                        ),

                                      ]),
                                      ///17.00
                                      TableRow(children: <Widget>[
                                        FittedBox(
                                          fit: BoxFit.contain,
                                          child: Container(
                                            margin: EdgeInsets.all(0),
                                            color: _colorTableTime,
                                            width: FBWidth,
                                            height: FBHeight,
                                            child: Center(
                                              child: Text(
                                                "17.00",
                                                textAlign: TextAlign.center,
                                                style: TextStyle(
                                                  color: _colorTextTime,
                                                  fontSize: _fontSize,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                        ///TimeColor
                                        FittedBox(
                                          fit: BoxFit.contain,
                                          child: Column(
                                            children: <Widget>[
                                              Container(
                                                decoration: myBoxDecoration(), //
                                                child: Container(
                                                  margin: EdgeInsets.all(0),
                                                  color: _colorPlanMon16_2,
                                                  width: FBTWidth,
                                                  height: FBTHeight,
                                                ),//     <--- BoxDecoration here
                                              ),
                                              Container(
                                                margin: EdgeInsets.all(0),
                                                color: _colorPlanMon17_1,
                                                width: FBTWidth,
                                                height: FBTHeight,
                                              ),
                                            ],
                                          ),
                                        ),
                                        FittedBox(
                                          fit: BoxFit.contain,
                                          child: Column(
                                            children: <Widget>[
                                              Container(
                                                decoration: myBoxDecoration(), //
                                                child: Container(
                                                  margin: EdgeInsets.all(0),
                                                  color: _colorPlanTue16_2,
                                                  width: FBTWidth,
                                                  height: FBTHeight,
                                                ),//     <--- BoxDecoration here
                                              ),
                                              Container(
                                                margin: EdgeInsets.all(0),
                                                color: _colorPlanTue17_1,
                                                width: FBTWidth,
                                                height: FBTHeight,

                                              ),
                                            ],
                                          ),
                                        ),
                                        FittedBox(
                                          fit: BoxFit.contain,
                                          child: Column(
                                            children: <Widget>[
                                              Container(
                                                decoration: myBoxDecoration(), //
                                                child: Container(
                                                  margin: EdgeInsets.all(0),
                                                  color: _colorPlanWed16_2,
                                                  width: FBTWidth,
                                                  height: FBTHeight,
                                                ),//     <--- BoxDecoration here
                                              ),
                                              Container(
                                                margin: EdgeInsets.all(0),
                                                color: _colorPlanWed17_1,
                                                width: FBTWidth,
                                                height: FBTHeight,
                                              ),
                                            ],
                                          ),
                                        ),
                                        FittedBox(
                                          fit: BoxFit.contain,
                                          child: Column(
                                            children: <Widget>[
                                              Container(
                                                decoration: myBoxDecoration(), //
                                                child: Container(
                                                  margin: EdgeInsets.all(0),
                                                  color: _colorPlanThu16_2,
                                                  width: FBTWidth,
                                                  height: FBTHeight,
                                                ),//     <--- BoxDecoration here
                                              ),
                                              Container(
                                                margin: EdgeInsets.all(0),
                                                color: _colorPlanThu17_1,
                                                width: FBTWidth,
                                                height: FBTHeight,
                                              ),
                                            ],
                                          ),
                                        ),
                                        FittedBox(
                                          fit: BoxFit.contain,
                                          child: Column(
                                            children: <Widget>[
                                              Container(
                                                decoration: myBoxDecoration(), //
                                                child: Container(
                                                  margin: EdgeInsets.all(0),
                                                  color: _colorPlanFri16_2,
                                                  width: FBTWidth,
                                                  height: FBTHeight,
                                                ),//     <--- BoxDecoration here
                                              ),
                                              Container(
                                                margin: EdgeInsets.all(0),
                                                color: _colorPlanFri17_1,
                                                width: FBTWidth,
                                                height: FBTHeight,
                                              ),
                                            ],
                                          ),
                                        ),
                                        FittedBox(
                                          fit: BoxFit.contain,
                                          child: Column(
                                            children: <Widget>[
                                              Container(
                                                decoration: myBoxDecoration(), //
                                                child: Container(
                                                  margin: EdgeInsets.all(0),
                                                  color: _colorPlanSat16_2,
                                                  width: FBTWidth,
                                                  height: FBTHeight,
                                                ),//     <--- BoxDecoration here
                                              ),
                                              Container(
                                                margin: EdgeInsets.all(0),
                                                color: _colorPlanSat17_1,
                                                width: FBTWidth,
                                                height: FBTHeight,
                                              ),
                                            ],
                                          ),
                                        ),
                                        FittedBox(
                                          fit: BoxFit.contain,
                                          child: Column(
                                            children: <Widget>[
                                              Container(
                                                decoration: myBoxDecoration(), //
                                                child: Container(
                                                  margin: EdgeInsets.all(0),
                                                  color: _colorPlanSun16_2,
                                                  width: FBTWidth,
                                                  height: FBTHeight,
                                                ),//     <--- BoxDecoration here
                                              ),
                                              Container(
                                                margin: EdgeInsets.all(0),
                                                color: _colorPlanSun17_1,
                                                width: FBTWidth,
                                                height: FBTHeight,
                                              ),
                                            ],
                                          ),
                                        ),

                                      ]),
                                      ///18.00
                                      TableRow(children: <Widget>[
                                        FittedBox(
                                          fit: BoxFit.contain,
                                          child: Container(
                                            margin: EdgeInsets.all(0),
                                            color: _colorTableTime,
                                            width: FBWidth,
                                            height: FBHeight,
                                            child: Center(
                                              child: Text(
                                                "18.00",
                                                textAlign: TextAlign.center,
                                                style: TextStyle(
                                                  color: _colorTextTime,
                                                  fontSize: _fontSize,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                        ///TimeColor
                                        FittedBox(
                                          fit: BoxFit.contain,
                                          child: Column(
                                            children: <Widget>[
                                              Container(
                                                decoration: myBoxDecoration(), //
                                                child: Container(
                                                  margin: EdgeInsets.all(0),
                                                  color: _colorPlanMon17_2,
                                                  width: FBTWidth,
                                                  height: FBTHeight,
                                                ),//     <--- BoxDecoration here
                                              ),
                                              Container(
                                                margin: EdgeInsets.all(0),
                                                color: _colorPlanMon18_1,
                                                width: FBTWidth,
                                                height: FBTHeight,
                                              ),
                                            ],
                                          ),
                                        ),
                                        FittedBox(
                                          fit: BoxFit.contain,
                                          child: Column(
                                            children: <Widget>[
                                              Container(
                                                decoration: myBoxDecoration(), //
                                                child: Container(
                                                  margin: EdgeInsets.all(0),
                                                  color: _colorPlanTue17_2,
                                                  width: FBTWidth,
                                                  height: FBTHeight,
                                                ),//     <--- BoxDecoration here
                                              ),
                                              Container(
                                                margin: EdgeInsets.all(0),
                                                color: _colorPlanTue18_1,
                                                width: FBTWidth,
                                                height: FBTHeight,

                                              ),
                                            ],
                                          ),
                                        ),
                                        FittedBox(
                                          fit: BoxFit.contain,
                                          child: Column(
                                            children: <Widget>[
                                              Container(
                                                decoration: myBoxDecoration(), //
                                                child: Container(
                                                  margin: EdgeInsets.all(0),
                                                  color: _colorPlanWed17_2,
                                                  width: FBTWidth,
                                                  height: FBTHeight,
                                                ),//     <--- BoxDecoration here
                                              ),
                                              Container(
                                                margin: EdgeInsets.all(0),
                                                color: _colorPlanWed18_1,
                                                width: FBTWidth,
                                                height: FBTHeight,
                                              ),
                                            ],
                                          ),
                                        ),
                                        FittedBox(
                                          fit: BoxFit.contain,
                                          child: Column(
                                            children: <Widget>[
                                              Container(
                                                decoration: myBoxDecoration(), //
                                                child: Container(
                                                  margin: EdgeInsets.all(0),
                                                  color: _colorPlanThu17_2,
                                                  width: FBTWidth,
                                                  height: FBTHeight,
                                                ),//     <--- BoxDecoration here
                                              ),
                                              Container(
                                                margin: EdgeInsets.all(0),
                                                color: _colorPlanThu18_1,
                                                width: FBTWidth,
                                                height: FBTHeight,
                                              ),
                                            ],
                                          ),
                                        ),
                                        FittedBox(
                                          fit: BoxFit.contain,
                                          child: Column(
                                            children: <Widget>[
                                              Container(
                                                decoration: myBoxDecoration(), //
                                                child: Container(
                                                  margin: EdgeInsets.all(0),
                                                  color: _colorPlanFri17_2,
                                                  width: FBTWidth,
                                                  height: FBTHeight,
                                                ),//     <--- BoxDecoration here
                                              ),
                                              Container(
                                                margin: EdgeInsets.all(0),
                                                color: _colorPlanFri18_1,
                                                width: FBTWidth,
                                                height: FBTHeight,
                                              ),
                                            ],
                                          ),
                                        ),
                                        FittedBox(
                                          fit: BoxFit.contain,
                                          child: Column(
                                            children: <Widget>[
                                              Container(
                                                decoration: myBoxDecoration(), //
                                                child: Container(
                                                  margin: EdgeInsets.all(0),
                                                  color: _colorPlanSat17_2,
                                                  width: FBTWidth,
                                                  height: FBTHeight,
                                                ),//     <--- BoxDecoration here
                                              ),
                                              Container(
                                                margin: EdgeInsets.all(0),
                                                color: _colorPlanSat18_1,
                                                width: FBTWidth,
                                                height: FBTHeight,
                                              ),
                                            ],
                                          ),
                                        ),
                                        FittedBox(
                                          fit: BoxFit.contain,
                                          child: Column(
                                            children: <Widget>[
                                              Container(
                                                decoration: myBoxDecoration(), //
                                                child: Container(
                                                  margin: EdgeInsets.all(0),
                                                  color: _colorPlanSun17_2,
                                                  width: FBTWidth,
                                                  height: FBTHeight,
                                                ),//     <--- BoxDecoration here
                                              ),
                                              Container(
                                                margin: EdgeInsets.all(0),
                                                color: _colorPlanSun18_1,
                                                width: FBTWidth,
                                                height: FBTHeight,
                                              ),
                                            ],
                                          ),
                                        ),

                                      ]),
                                      ///19.00
                                      TableRow(children: <Widget>[
                                        FittedBox(
                                          fit: BoxFit.contain,
                                          child: Container(
                                            margin: EdgeInsets.all(0),
                                            color: _colorTableTime,
                                            width: FBWidth,
                                            height: FBHeight,
                                            child: Center(
                                              child: Text(
                                                "19.00",
                                                textAlign: TextAlign.center,
                                                style: TextStyle(
                                                  color: _colorTextTime,
                                                  fontSize: _fontSize,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                        ///TimeColor
                                        FittedBox(
                                          fit: BoxFit.contain,
                                          child: Column(
                                            children: <Widget>[
                                              Container(
                                                decoration: myBoxDecoration(), //
                                                child: Container(
                                                  margin: EdgeInsets.all(0),
                                                  color: _colorPlanMon18_2,
                                                  width: FBTWidth,
                                                  height: FBTHeight,
                                                ),//     <--- BoxDecoration here
                                              ),
                                              Container(
                                                margin: EdgeInsets.all(0),
                                                color: _colorPlanMon19_1,
                                                width: FBTWidth,
                                                height: FBTHeight,
                                              ),
                                            ],
                                          ),
                                        ),
                                        FittedBox(
                                          fit: BoxFit.contain,
                                          child: Column(
                                            children: <Widget>[
                                              Container(
                                                decoration: myBoxDecoration(), //
                                                child: Container(
                                                  margin: EdgeInsets.all(0),
                                                  color: _colorPlanTue18_2,
                                                  width: FBTWidth,
                                                  height: FBTHeight,
                                                ),//     <--- BoxDecoration here
                                              ),
                                              Container(
                                                margin: EdgeInsets.all(0),
                                                color: _colorPlanTue19_1,
                                                width: FBTWidth,
                                                height: FBTHeight,

                                              ),
                                            ],
                                          ),
                                        ),
                                        FittedBox(
                                          fit: BoxFit.contain,
                                          child: Column(
                                            children: <Widget>[
                                              Container(
                                                decoration: myBoxDecoration(), //
                                                child: Container(
                                                  margin: EdgeInsets.all(0),
                                                  color: _colorPlanWed18_2,
                                                  width: FBTWidth,
                                                  height: FBTHeight,
                                                ),//     <--- BoxDecoration here
                                              ),
                                              Container(
                                                margin: EdgeInsets.all(0),
                                                color: _colorPlanWed19_1,
                                                width: FBTWidth,
                                                height: FBTHeight,
                                              ),
                                            ],
                                          ),
                                        ),
                                        FittedBox(
                                          fit: BoxFit.contain,
                                          child: Column(
                                            children: <Widget>[
                                              Container(
                                                decoration: myBoxDecoration(), //
                                                child: Container(
                                                  margin: EdgeInsets.all(0),
                                                  color: _colorPlanThu18_2,
                                                  width: FBTWidth,
                                                  height: FBTHeight,
                                                ),//     <--- BoxDecoration here
                                              ),
                                              Container(
                                                margin: EdgeInsets.all(0),
                                                color: _colorPlanThu19_1,
                                                width: FBTWidth,
                                                height: FBTHeight,
                                              ),
                                            ],
                                          ),
                                        ),
                                        FittedBox(
                                          fit: BoxFit.contain,
                                          child: Column(
                                            children: <Widget>[
                                              Container(
                                                decoration: myBoxDecoration(), //
                                                child: Container(
                                                  margin: EdgeInsets.all(0),
                                                  color: _colorPlanFri18_2,
                                                  width: FBTWidth,
                                                  height: FBTHeight,
                                                ),//     <--- BoxDecoration here
                                              ),
                                              Container(
                                                margin: EdgeInsets.all(0),
                                                color: _colorPlanFri19_1,
                                                width: FBTWidth,
                                                height: FBTHeight,
                                              ),
                                            ],
                                          ),
                                        ),
                                        FittedBox(
                                          fit: BoxFit.contain,
                                          child: Column(
                                            children: <Widget>[
                                              Container(
                                                decoration: myBoxDecoration(), //
                                                child: Container(
                                                  margin: EdgeInsets.all(0),
                                                  color: _colorPlanSat18_2,
                                                  width: FBTWidth,
                                                  height: FBTHeight,
                                                ),//     <--- BoxDecoration here
                                              ),
                                              Container(
                                                margin: EdgeInsets.all(0),
                                                color: _colorPlanSat19_1,
                                                width: FBTWidth,
                                                height: FBTHeight,
                                              ),
                                            ],
                                          ),
                                        ),
                                        FittedBox(
                                          fit: BoxFit.contain,
                                          child: Column(
                                            children: <Widget>[
                                              Container(
                                                decoration: myBoxDecoration(), //
                                                child: Container(
                                                  margin: EdgeInsets.all(0),
                                                  color: _colorPlanSun18_2,
                                                  width: FBTWidth,
                                                  height: FBTHeight,
                                                ),//     <--- BoxDecoration here
                                              ),
                                              Container(
                                                margin: EdgeInsets.all(0),
                                                color: _colorPlanSun19_1,
                                                width: FBTWidth,
                                                height: FBTHeight,
                                              ),
                                            ],
                                          ),
                                        ),

                                      ]),
                                      ///20.00
                                      TableRow(children: <Widget>[
                                        FittedBox(
                                          fit: BoxFit.contain,
                                          child: Container(
                                            margin: EdgeInsets.all(0),
                                            color: _colorTableTime,
                                            width: FBWidth,
                                            height: FBHeight,
                                            child: Center(
                                              child: Text(
                                                "20.00",
                                                textAlign: TextAlign.center,
                                                style: TextStyle(
                                                  color: _colorTextTime,
                                                  fontSize: _fontSize,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                        ///TimeColor
                                        FittedBox(
                                          fit: BoxFit.contain,
                                          child: Column(
                                            children: <Widget>[
                                              Container(
                                                decoration: myBoxDecoration(), //
                                                child: Container(
                                                  margin: EdgeInsets.all(0),
                                                  color: _colorPlanMon19_2,
                                                  width: FBTWidth,
                                                  height: FBTHeight,
                                                ),//     <--- BoxDecoration here
                                              ),
                                              Container(
                                                margin: EdgeInsets.all(0),
                                                color: _colorPlanMon20_1,
                                                width: FBTWidth,
                                                height: FBTHeight,
                                              ),
                                            ],
                                          ),
                                        ),
                                        FittedBox(
                                          fit: BoxFit.contain,
                                          child: Column(
                                            children: <Widget>[
                                              Container(
                                                decoration: myBoxDecoration(), //
                                                child: Container(
                                                  margin: EdgeInsets.all(0),
                                                  color: _colorPlanTue19_2,
                                                  width: FBTWidth,
                                                  height: FBTHeight,
                                                ),//     <--- BoxDecoration here
                                              ),
                                              Container(
                                                margin: EdgeInsets.all(0),
                                                color: _colorPlanTue20_1,
                                                width: FBTWidth,
                                                height: FBTHeight,

                                              ),
                                            ],
                                          ),
                                        ),
                                        FittedBox(
                                          fit: BoxFit.contain,
                                          child: Column(
                                            children: <Widget>[
                                              Container(
                                                decoration: myBoxDecoration(), //
                                                child: Container(
                                                  margin: EdgeInsets.all(0),
                                                  color: _colorPlanWed19_2,
                                                  width: FBTWidth,
                                                  height: FBTHeight,
                                                ),//     <--- BoxDecoration here
                                              ),
                                              Container(
                                                margin: EdgeInsets.all(0),
                                                color: _colorPlanWed20_1,
                                                width: FBTWidth,
                                                height: FBTHeight,
                                              ),
                                            ],
                                          ),
                                        ),
                                        FittedBox(
                                          fit: BoxFit.contain,
                                          child: Column(
                                            children: <Widget>[
                                              Container(
                                                decoration: myBoxDecoration(), //
                                                child: Container(
                                                  margin: EdgeInsets.all(0),
                                                  color: _colorPlanThu19_2,
                                                  width: FBTWidth,
                                                  height: FBTHeight,
                                                ),//     <--- BoxDecoration here
                                              ),
                                              Container(
                                                margin: EdgeInsets.all(0),
                                                color: _colorPlanThu20_1,
                                                width: FBTWidth,
                                                height: FBTHeight,
                                              ),
                                            ],
                                          ),
                                        ),
                                        FittedBox(
                                          fit: BoxFit.contain,
                                          child: Column(
                                            children: <Widget>[
                                              Container(
                                                decoration: myBoxDecoration(), //
                                                child: Container(
                                                  margin: EdgeInsets.all(0),
                                                  color: _colorPlanFri19_2,
                                                  width: FBTWidth,
                                                  height: FBTHeight,
                                                ),//     <--- BoxDecoration here
                                              ),
                                              Container(
                                                margin: EdgeInsets.all(0),
                                                color: _colorPlanFri20_1,
                                                width: FBTWidth,
                                                height: FBTHeight,
                                              ),
                                            ],
                                          ),
                                        ),
                                        FittedBox(
                                          fit: BoxFit.contain,
                                          child: Column(
                                            children: <Widget>[
                                              Container(
                                                decoration: myBoxDecoration(), //
                                                child: Container(
                                                  margin: EdgeInsets.all(0),
                                                  color: _colorPlanSat19_2,
                                                  width: FBTWidth,
                                                  height: FBTHeight,
                                                ),//     <--- BoxDecoration here
                                              ),
                                              Container(
                                                margin: EdgeInsets.all(0),
                                                color: _colorPlanSat20_1,
                                                width: FBTWidth,
                                                height: FBTHeight,
                                              ),
                                            ],
                                          ),
                                        ),
                                        FittedBox(
                                          fit: BoxFit.contain,
                                          child: Column(
                                            children: <Widget>[
                                              Container(
                                                decoration: myBoxDecoration(), //
                                                child: Container(
                                                  margin: EdgeInsets.all(0),
                                                  color: _colorPlanSun19_2,
                                                  width: FBTWidth,
                                                  height: FBTHeight,
                                                ),//     <--- BoxDecoration here
                                              ),
                                              Container(
                                                margin: EdgeInsets.all(0),
                                                color: _colorPlanSun20_1,
                                                width: FBTWidth,
                                                height: FBTHeight,
                                              ),
                                            ],
                                          ),
                                        ),

                                      ]),
                                      ///21.00
                                      TableRow(children: <Widget>[
                                        FittedBox(
                                          fit: BoxFit.contain,
                                          child: Container(
                                            margin: EdgeInsets.all(0),
                                            color: _colorTableTime,
                                            width: FBWidth,
                                            height: FBHeight,
                                            child: Center(
                                              child: Text(
                                                "21.00",
                                                textAlign: TextAlign.center,
                                                style: TextStyle(
                                                  color: _colorTextTime,
                                                  fontSize: _fontSize,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                        ///TimeColor
                                        FittedBox(
                                          fit: BoxFit.contain,
                                          child: Column(
                                            children: <Widget>[
                                              Container(
                                                decoration: myBoxDecoration(), //
                                                child: Container(
                                                  margin: EdgeInsets.all(0),
                                                  color: _colorPlanMon20_2,
                                                  width: FBTWidth,
                                                  height: FBTHeight,
                                                ),//     <--- BoxDecoration here
                                              ),
                                              Container(
                                                margin: EdgeInsets.all(0),
                                                color: _colorPlanMon21_1,
                                                width: FBTWidth,
                                                height: FBTHeight,
                                              ),
                                            ],
                                          ),
                                        ),
                                        FittedBox(
                                          fit: BoxFit.contain,
                                          child: Column(
                                            children: <Widget>[
                                              Container(
                                                decoration: myBoxDecoration(), //
                                                child: Container(
                                                  margin: EdgeInsets.all(0),
                                                  color: _colorPlanTue20_2,
                                                  width: FBTWidth,
                                                  height: FBTHeight,
                                                ),//     <--- BoxDecoration here
                                              ),
                                              Container(
                                                margin: EdgeInsets.all(0),
                                                color: _colorPlanTue21_1,
                                                width: FBTWidth,
                                                height: FBTHeight,

                                              ),
                                            ],
                                          ),
                                        ),
                                        FittedBox(
                                          fit: BoxFit.contain,
                                          child: Column(
                                            children: <Widget>[
                                              Container(
                                                decoration: myBoxDecoration(), //
                                                child: Container(
                                                  margin: EdgeInsets.all(0),
                                                  color: _colorPlanWed20_2,
                                                  width: FBTWidth,
                                                  height: FBTHeight,
                                                ),//     <--- BoxDecoration here
                                              ),
                                              Container(
                                                margin: EdgeInsets.all(0),
                                                color: _colorPlanWed21_1,
                                                width: FBTWidth,
                                                height: FBTHeight,
                                              ),
                                            ],
                                          ),
                                        ),
                                        FittedBox(
                                          fit: BoxFit.contain,
                                          child: Column(
                                            children: <Widget>[
                                              Container(
                                                decoration: myBoxDecoration(), //
                                                child: Container(
                                                  margin: EdgeInsets.all(0),
                                                  color: _colorPlanThu20_2,
                                                  width: FBTWidth,
                                                  height: FBTHeight,
                                                ),//     <--- BoxDecoration here
                                              ),
                                              Container(
                                                margin: EdgeInsets.all(0),
                                                color: _colorPlanThu21_1,
                                                width: FBTWidth,
                                                height: FBTHeight,
                                              ),
                                            ],
                                          ),
                                        ),
                                        FittedBox(
                                          fit: BoxFit.contain,
                                          child: Column(
                                            children: <Widget>[
                                              Container(
                                                decoration: myBoxDecoration(), //
                                                child: Container(
                                                  margin: EdgeInsets.all(0),
                                                  color: _colorPlanFri20_2,
                                                  width: FBTWidth,
                                                  height: FBTHeight,
                                                ),//     <--- BoxDecoration here
                                              ),
                                              Container(
                                                margin: EdgeInsets.all(0),
                                                color: _colorPlanFri21_1,
                                                width: FBTWidth,
                                                height: FBTHeight,
                                              ),
                                            ],
                                          ),
                                        ),
                                        FittedBox(
                                          fit: BoxFit.contain,
                                          child: Column(
                                            children: <Widget>[
                                              Container(
                                                decoration: myBoxDecoration(), //
                                                child: Container(
                                                  margin: EdgeInsets.all(0),
                                                  color: _colorPlanSat20_2,
                                                  width: FBTWidth,
                                                  height: FBTHeight,
                                                ),//     <--- BoxDecoration here
                                              ),
                                              Container(
                                                margin: EdgeInsets.all(0),
                                                color: _colorPlanSat21_1,
                                                width: FBTWidth,
                                                height: FBTHeight,
                                              ),
                                            ],
                                          ),
                                        ),
                                        FittedBox(
                                          fit: BoxFit.contain,
                                          child: Column(
                                            children: <Widget>[
                                              Container(
                                                decoration: myBoxDecoration(), //
                                                child: Container(
                                                  margin: EdgeInsets.all(0),
                                                  color: _colorPlanSun20_2,
                                                  width: FBTWidth,
                                                  height: FBTHeight,
                                                ),//     <--- BoxDecoration here
                                              ),
                                              Container(
                                                margin: EdgeInsets.all(0),
                                                color: _colorPlanSun21_1,
                                                width: FBTWidth,
                                                height: FBTHeight,
                                              ),
                                            ],
                                          ),
                                        ),

                                      ]),
                                      ///22.00
                                      TableRow(children: <Widget>[
                                        FittedBox(
                                          fit: BoxFit.contain,
                                          child: Container(
                                            margin: EdgeInsets.all(0),
                                            color: _colorTableTime,
                                            width: FBWidth,
                                            height: FBHeight,
                                            child: Center(
                                              child: Text(
                                                "22.00",
                                                textAlign: TextAlign.center,
                                                style: TextStyle(
                                                  color: _colorTextTime,
                                                  fontSize: _fontSize,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                        ///TimeColor
                                        FittedBox(
                                          fit: BoxFit.contain,
                                          child: Column(
                                            children: <Widget>[
                                              Container(
                                                decoration: myBoxDecoration(), //
                                                child: Container(
                                                  margin: EdgeInsets.all(0),
                                                  color: _colorPlanMon21_2,
                                                  width: FBTWidth,
                                                  height: FBTHeight,
                                                ),//     <--- BoxDecoration here
                                              ),
                                            ],
                                          ),
                                        ),
                                        FittedBox(
                                          fit: BoxFit.contain,
                                          child: Column(
                                            children: <Widget>[
                                              Container(
                                                decoration: myBoxDecoration(), //
                                                child: Container(
                                                  margin: EdgeInsets.all(0),
                                                  color: _colorPlanTue21_2,
                                                  width: FBTWidth,
                                                  height: FBTHeight,
                                                ),//     <--- BoxDecoration here
                                              ),
                                            ],
                                          ),
                                        ),
                                        FittedBox(
                                          fit: BoxFit.contain,
                                          child: Column(
                                            children: <Widget>[
                                              Container(
                                                decoration: myBoxDecoration(), //
                                                child: Container(
                                                  margin: EdgeInsets.all(0),
                                                  color: _colorPlanWed21_2,
                                                  width: FBTWidth,
                                                  height: FBTHeight,
                                                ),//     <--- BoxDecoration here
                                              ),
                                            ],
                                          ),
                                        ),
                                        FittedBox(
                                          fit: BoxFit.contain,
                                          child: Column(
                                            children: <Widget>[
                                              Container(
                                                decoration: myBoxDecoration(), //
                                                child: Container(
                                                  margin: EdgeInsets.all(0),
                                                  color: _colorPlanThu21_2,
                                                  width: FBTWidth,
                                                  height: FBTHeight,
                                                ),//     <--- BoxDecoration here
                                              ),
                                            ],
                                          ),
                                        ),
                                        FittedBox(
                                          fit: BoxFit.contain,
                                          child: Column(
                                            children: <Widget>[
                                              Container(
                                                decoration: myBoxDecoration(), //
                                                child: Container(
                                                  margin: EdgeInsets.all(0),
                                                  color: _colorPlanFri21_2,
                                                  width: FBTWidth,
                                                  height: FBTHeight,
                                                ),//     <--- BoxDecoration here
                                              ),
                                            ],
                                          ),
                                        ),
                                        FittedBox(
                                          fit: BoxFit.contain,
                                          child: Column(
                                            children: <Widget>[
                                              Container(
                                                decoration: myBoxDecoration(), //
                                                child: Container(
                                                  margin: EdgeInsets.all(0),
                                                  color: _colorPlanSat21_2,
                                                  width: FBTWidth,
                                                  height: FBTHeight,
                                                ),//     <--- BoxDecoration here
                                              ),
                                            ],
                                          ),
                                        ),
                                        FittedBox(
                                          fit: BoxFit.contain,
                                          child: Column(
                                            children: <Widget>[
                                              Container(
                                                decoration: myBoxDecoration(), //
                                                child: Container(
                                                  margin: EdgeInsets.all(0),
                                                  color: _colorPlanSun21_2,
                                                  width: FBTWidth,
                                                  height: FBTHeight,
                                                ),//     <--- BoxDecoration here
                                              ),
                                            ],
                                          ),
                                        ),

                                      ]),
                                    ],
                                  )
                                ),
                                new Divider(
                                  color: Colors.black54,
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                    new Expanded(
                      child: new Container(
                        child:  new Container(
                          child: ListView.builder(
                            itemCount: Subjest.length,
                            itemBuilder: (context, index) {
                              return new Container(
                                color: HexColor((Subjest[index]['color'])),
                                child: new Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: <Widget>[
                                    new ExpansionTile(
                                        title: new Container(
                                            child: Row(
                                              children: <Widget>[
                                                Column(
                                                  children: <Widget>[
                                                    Row(
                                                      children: <Widget>[
                                                        Text((() {
                                                          if(Subjest[index]['coursecode'] == null){
                                                            return "-";}

                                                          return Subjest[index]['coursecode'];
                                                        })(),style: TextStyle(
                                                            fontSize: 16,
                                                            fontWeight: FontWeight.bold
                                                        ),),//
                                                      ],
                                                    ),
                                                    SizedBox(
                                                      width: 150.0,
                                                    ),
                                                  ],
                                                ),
                                                Column(
                                                  children: <Widget>[
                                                    Row(
                                                      children: <Widget>[
                                                        Text("G: ",style: TextStyle(
                                                            fontSize: 16,
                                                            fontWeight: FontWeight.bold
                                                        ),),
                                                        Text((() {
                                                          if(Subjest[index]['group'] == null){
                                                            return "-";}

                                                          return Subjest[index]['group'];
                                                        })(),style: TextStyle(
                                                            fontSize: 16,
                                                            fontWeight: FontWeight.bold
                                                        ),),//
                                                      ],
                                                    ),
                                                    SizedBox(
                                                      width: 150.0,
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
                ),
              );
            },
            childCount: 1,
          ),
        ),
      ],
    );
  }
}

