import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class LoadError extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Container(
      color: Colors.white,
      child: new Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Column(
              children: <Widget>[
                new Padding(
                  padding: const EdgeInsets.fromLTRB(0, 0, 0, 100),
                  child: Text("This plan has not been created.",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                )
              ],
            ),
            Column(
              children: <Widget>[
                SpinKitFadingCube(color: Colors.redAccent),
              ],
            ),
          ],
        ),
      ),
    );
  }
}