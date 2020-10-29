import 'package:flutter/material.dart';
import 'package:dailywiki/main.dart';
import 'package:dailywiki/pages/TagSelector.dart';
import 'WebPage.dart';
import 'dart:math';

String pageUrl = '';

class RandomizePage extends StatelessWidget{
  void getFirstURL(){
    Random range = new Random();
    var urlCat = range.nextInt(category.length);
    String urlBase = 'https://wikipedia.org/wiki/Special:RandomInCategory/';
    pageUrl = urlBase + category[urlCat];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: new Drawer(
        child: ListView(
          children: [
            ListTile(
              title: Text('Categories', style: TextStyle(fontSize: 18)),
              trailing: Icon(Icons.work),
              onTap: (){
                Navigator.pop(context);
                Navigator.push(context, MaterialPageRoute(builder: (context) => TagPage()));
              }
            )
          ],
        )
      ),
      appBar: new AppBar(

        title: Text('Daily Wiki'),
        centerTitle: true,
      ),
      backgroundColor: Colors.blue,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            RaisedButton(
              child: Text('Learn Something New!'),
              onPressed: (){
                getFirstURL();
                Navigator.push(context, MaterialPageRoute(builder: (context) => WebPage()));
              },
            )
          ],
        ),
      ),
    );
  }



}