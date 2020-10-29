import 'package:flutter/material.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';
import 'package:webview_flutter/webview_flutter.dart';

import 'package:dailywiki/main.dart';
import 'package:dailywiki/pages/RandomizePage.dart';
import 'dart:math';


class WebPage extends StatefulWidget{
  @override
  _WebPage createState() => new _WebPage();
}

class _WebPage extends State<WebPage>{
  void initState() {
    final flutterWebviewPlugin = new FlutterWebviewPlugin();

    flutterWebviewPlugin.onUrlChanged.listen((String url) {
      if(url.contains('Category')){
        getSubCatURL(url);
        print(pageUrl);
        flutterWebviewPlugin.reloadUrl(pageUrl);
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return WebviewScaffold(
      appBar: new AppBar(
        title: Text('Daily Wiki'),
      ),
      url: pageUrl,
    );
  }

  void getSubCatURL(String catUrl){
    String newCat = catUrl.substring(41, catUrl.length);
    String urlBase = 'https://wikipedia.org/wiki/Special:RandomInCategory/';
    pageUrl = urlBase + newCat;
  }
}