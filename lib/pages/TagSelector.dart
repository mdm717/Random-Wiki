import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';
import 'WebPage.dart';
import 'package:dailywiki/main.dart';
import 'RandomizePage.dart';

var artsGrayed = false;
var bioGrayed = false;
var geoGrayed = false;
var hisGrayed = false;
var mathGrayed = false;
var sciGrayed = false;
var socGrayed = false;
var techGrayed = false;


class TagPage extends StatefulWidget{
  @override
  _TagPage createState() => _TagPage();
}

class _TagPage extends State<TagPage>{
  @override
  Widget build(BuildContext context){
    return Scaffold(
      backgroundColor: Colors.blue,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Select Topics of Interest', style: TextStyle(color: Colors.white, fontSize: 32))
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  RaisedButton(
                      child: Text('Arts'),
                      color: artsGrayed ? Colors.black12 : Colors.white,
                      onPressed: () {
                        setState(() => artsGrayed = !artsGrayed);
                        if(artsGrayed) {
                          category.add('Arts');
                        } else {
                          category.remove('Arts');
                        }
                      }
                  ),
                  RaisedButton(
                      child: Text('Biology'),
                      color: bioGrayed ? Colors.black12 : Colors.white,
                      onPressed: () {
                        setState(() => bioGrayed = !bioGrayed);
                        if(bioGrayed) {
                          category.add('Biology');
                        } else {
                          category.remove('Biology');
                        }
                      }
                  )
                ]
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                RaisedButton(
                    child: Text('Geography'),
                    color: geoGrayed ? Colors.black12 : Colors.white,
                    onPressed: () {
                      setState(() => geoGrayed = !geoGrayed);
                      if(geoGrayed) {
                        category.add('Geography');
                      } else{
                        category.remove('Geography');
                      }
                    }
                ),
                RaisedButton(
                    child: Text('History'),
                    color: hisGrayed ? Colors.black12 : Colors.white,
                    onPressed: () {
                      setState(() => hisGrayed = !hisGrayed);
                      if(hisGrayed) {
                        category.add('History');
                      } else {
                        category.remove('History');
                      }
                    }
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                RaisedButton(
                  child: Text('Mathematics'),
                    color: mathGrayed ? Colors.black12 : Colors.white,
                    onPressed: () {
                      setState(() => mathGrayed = !mathGrayed);
                      if(mathGrayed) {
                        category.add('Mathematics');
                      } else {
                        category.remove('Mathematics');
                      }
                    }
                ),
                RaisedButton(
                  child: Text('Science'),
                    color: sciGrayed ? Colors.black12 : Colors.white,
                    onPressed: () {
                      setState(() => sciGrayed = !sciGrayed);
                      if(sciGrayed) {
                        category.add('Science');
                      } else {
                        category.remove('Science');
                      }
                    }
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                RaisedButton(
                  child: Text('Society'),
                    color: socGrayed ? Colors.black12 : Colors.white,
                    onPressed: () {
                      setState(() => socGrayed = !socGrayed);
                      if(socGrayed) {
                        category.add('Society');
                      } else {
                        category.remove('Society');
                      }
                    }
                ),
                RaisedButton(
                  child: Text('Technology'),
                    color: techGrayed ? Colors.black12 : Colors.white,
                    onPressed: () {
                      setState(() => techGrayed = !techGrayed);
                      if(techGrayed) {
                        category.add('Technology');
                      } else{
                        category.remove('Technology');
                      }
                    }
                )
              ],
            ),
            Align(
              alignment: Alignment.bottomRight,
                child: FlatButton(
                  child: Text('Continue', style: TextStyle(fontSize: 16),),
                  onPressed: (){
                  if(artsGrayed == false && bioGrayed == false && geoGrayed == false && hisGrayed == false
                      && mathGrayed == false && sciGrayed == false && socGrayed == false && techGrayed == false){
                    _showMyDialog();
                  }
                  else {
                    Navigator.push(context, MaterialPageRoute(
                        builder: (context) => RandomizePage()));
                  }
                },
              ),
            )
          ],
        ),
      ),

    );
  }
  Future<void> _showMyDialog() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Something Went Wrong!'),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text('Please Select at Least One Topic of Interest'),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: Text('Ok'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}