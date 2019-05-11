import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'giphy_list_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CupertinoApp(
      title: 'Flutter Demo',
      home: GiphyListPage(title: 'Flutter Demo Home Page'),
    );
  }
}
