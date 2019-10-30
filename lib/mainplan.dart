import 'package:flutter/material.dart';
import 'package:sutplan/plan.dart';

class MainPlan extends StatefulWidget {
  final String uid;
  MainPlan(this.uid, {Key key}) : super(key:key);

  @override
  _MainPlanState createState() => _MainPlanState();
}


class _MainPlanState extends State<MainPlan> {

  Choice _selectedChoice = choices[0];
  void _select(Choice choice) {

    setState(() {
      _selectedChoice = choice;
    });
  }


  @override
  Widget build(BuildContext context) {
    for(var i = 0;i < choices.length;i++){
      choices[i].id = widget.uid;
    }
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Select Plans'),
          actions: <Widget>[
            PopupMenuButton<Choice>(
              icon: Icon(
                Icons.description,
                size: 30.0,
                color: Colors.white,
              ),
              onSelected: _select,
              itemBuilder: (BuildContext context) {
                return choices.map((Choice choice) {
                  return PopupMenuItem<Choice>(
                    value: choice,
                    child: Text(choice.title),
                  );
                }).toList();
              },
            ),
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.all(5.0),
          child: Plan(choice: _selectedChoice),
        ),
      ),
    );
  }
}


class Choice {
   Choice({this.id, this.title,this.count});
   String title;
   String id;
   int count;


}

List<Choice> choices =  <Choice>[
   Choice(title: 'PlanI',count: 0),
   Choice(title: 'PlanII',count: 1),
   Choice(title: 'PlanIII',count: 2),
];