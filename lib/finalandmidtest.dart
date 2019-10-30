import 'package:flutter/material.dart';
import 'package:sutplan/CupertinoSegmentedControl.dart';
class FinalAndMidTest extends StatefulWidget{

  final String uid;
  FinalAndMidTest(this.uid, {Key key}) : super(key:key);

  @override
  _FinalAndMidTest createState() => _FinalAndMidTest();
}


class _FinalAndMidTest extends State<FinalAndMidTest> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: _buildBody(context),
    );
  }

  Widget _buildBody(BuildContext context) {
    List<Widget> containers = [
      Container(
        child: CupertinoSegmentedControlDemo(widget.uid,0),
      ),
      Container(
        child: CupertinoSegmentedControlDemo(widget.uid,1),
      ),
      Container(
        child: CupertinoSegmentedControlDemo(widget.uid,2),
      )
    ];
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: Text("MidandFinal Test."),
          bottom: TabBar(
            tabs: <Widget>[
              Tab(
                text: 'plan I',
              ),
              Tab(
                text: 'plan II',
              ),
              Tab(
                text: 'plan III',
              ),
            ],
          ),
        ),
        body: TabBarView(
          children: containers,
        ),
      ),
    );
  }


}