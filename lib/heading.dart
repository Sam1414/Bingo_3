import './box.dart';
import 'linesCut.dart';

import 'package:flutter/material.dart';

class Heading extends StatelessWidget {
  final int cutLines;
  Heading(this.cutLines) {
    print('Heading executed');
    print('No. of cut lines: $cutLines');
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          SizedBox(
            width: 50.0,
            child: RaisedButton(
              elevation: 10.0,
              color: Colors.purple,
              padding: EdgeInsets.all(10.0),
              shape: CircleBorder(),
              onPressed: (cutLines >= 1) ? () {} : null,
              child: Text(
                'B',
                style: TextStyle(fontSize: 30.0),
              ),
            ),
          ),
          SizedBox(width: 5.0),
          SizedBox(
            width: 50.0,
            child: RaisedButton(
              elevation: 10.0,
              color: Colors.purple,
              padding: EdgeInsets.all(10.0),
              shape: CircleBorder(),
              onPressed: (cutLines >= 2) ? () {} : null,
              child: Text(
                'I',
                style: TextStyle(fontSize: 30.0),
              ),
            ),
          ),
          SizedBox(width: 5.0),
          SizedBox(
            width: 50.0,
            child: RaisedButton(
              elevation: 10.0,
              color: Colors.purple,
              padding: EdgeInsets.all(10.0),
              shape: CircleBorder(),
              onPressed: (cutLines >= 3) ? () {} : null,
              child: Text(
                'N',
                style: TextStyle(fontSize: 30.0),
              ),
            ),
          ),
          SizedBox(width: 5.0),
          SizedBox(
            width: 50.0,
            child: RaisedButton(
              elevation: 10.0,
              color: Colors.purple,
              padding: EdgeInsets.all(10.0),
              shape: CircleBorder(),
              onPressed: (cutLines >= 4) ? () {} : null,
              child: Text(
                'G',
                style: TextStyle(fontSize: 30.0),
              ),
            ),
          ),
          SizedBox(width: 5.0),
          SizedBox(
            width: 50.0,
            child: RaisedButton(
              elevation: 10.0,
              color: Colors.purple,
              padding: EdgeInsets.all(10.0),
              shape: CircleBorder(),
              onPressed: (cutLines >= 5) ? () {} : null,
              child: Text(
                'O',
                style: TextStyle(fontSize: 30.0),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
