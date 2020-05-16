import 'dart:math';

import 'package:flutter/material.dart';
import 'package:myapp3/evaluate.dart';
import 'package:myapp3/linesCut.dart';
import './box.dart';
import 'heading.dart';

class Grid extends StatefulWidget {
  @override
  GridState createState() => GridState();
}

class GridState extends State<Grid> {
  List<int> numbers = List<int>(25);
  List<bool> strike = List<bool>(25);
  List<box> b = List<box>(25);
  LinesCut lc = new LinesCut(0);

  GridState() {
    for (int i = 0; i < 25; i++) {
      numbers[i] = 0;
      strike[i] = false;
    }
    var count = 1;
    var rnd = Random();
    while (count <= 25) {
      var index = rnd.nextInt(25);
      if (numbers[index] == 0) {
        numbers[index] = count++;
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        _buildHeading(lc),
        _getCutLines(),
        //Grid Container
        Container(
          //color: Colors.green,
          padding: EdgeInsets.all(0.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              _buildRow(0),
              _buildRow(1),
              _buildRow(2),
              _buildRow(3),
              _buildRow(4),
            ],
          ),
        ),
        SizedBox(
          height: 20.0,
          //child: Container(color: Colors.red),
        ),
        FloatingActionButton(
          tooltip: 'Reset Button - To reset and generate new Grid',
          onPressed: resetgrid,
          child: Icon(Icons.autorenew),
        ),
      ],
    );
  }

  _buildRow(var row) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        _buildBox(row, 0),
        _buildBox(row, 1),
        _buildBox(row, 2),
        _buildBox(row, 3),
        _buildBox(row, 4),
      ],
    );
  }

  _buildBox(var row, var col) {
    return GestureDetector(
      onTap: () {
        print('tap');
        setState(() {
          strike[(row * 5) + col] = true;
          b[(row * 5) + col].cut = true;
          Evaluate(b, lc);
          lc.cutLines = lc.cutLines;
        });
      },
      child: Container(
        width: 55,
        height: 55,
        decoration: BoxDecoration(
          border: Border.all(
            color: Colors.black,
          ),
        ),
        //margin: EdgeInsets.all(5.0),
        child: Center(
          child: _getNum(row, col, strike[(row * 5) + col]),
        ), //_getNum()
      ),
    );
  }

  _getNum(var row, var col, bool cut) {
    var indexFromRC = (row * 5) + col;
    var txt = numbers[indexFromRC];
    b[indexFromRC] = new box(row, col, cut);
    if (cut == false) {
      return Text(
        '$txt',
        style: TextStyle(
          fontSize: 25.0,
        ),
      );
    } else {
      return Stack(
        fit: StackFit.loose,
        children: <Widget>[
          Center(
            child: Text(
              '$txt',
              style: TextStyle(fontSize: 25.0),
            ),
          ),
          Center(
            child: Image(
              image: AssetImage('diag_2.png'),
            ),
          )
        ],
      );
    }
  }

  resetgrid() {
    print('Rst button pressed');
    for (int i = 0; i < 25; i++) {
      numbers[i] = 0;
      strike[i] = false;
    }
    var count = 1;
    var rnd = Random();
    while (count <= 25) {
      var index = rnd.nextInt(25);
      setState(() {
        if (numbers[index] == 0) {
          numbers[index] = count++;
        }
      });
    }
    setState(() {
      lc.cutLines = 0;
    });
  }

  _buildHeading(LinesCut lc) {
    return Heading(lc.cutLines);
  }

  _getCutLines() {
    var linCut = lc.cutLines;
    return Container(
      margin: EdgeInsets.all(15.0),
      child: Text(
        'No of lines cut: $linCut',
        style: TextStyle(fontSize: 20.0),
      ),
    );
  }
}
