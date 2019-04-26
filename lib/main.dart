import 'package:flutter/material.dart';
import 'package:all_in_all_flutter/pages/index.dart';
import 'package:all_in_all_flutter/pages/homeDrawer.dart';
import 'package:all_in_all_flutter/pages/rank.dart';
void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      theme: new ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: new MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key}) : super(key: key);

  @override
  _MyHomePageState createState() => new _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
bool _selected = false;
   void setSelected() {
     setState(() {
       _selected = true;
     });
   }


@override
  Widget build(BuildContext context) {
    return new DefaultTabController(
      length: 2,
      child: new Scaffold(
        appBar: new AppBar(
          title: new Text('总而言之'),
          bottom: new TabBar(
            tabs: <Widget>[
              new Tab(icon: new Icon(Icons.explore),),
              new Tab(icon: new Icon(Icons.equalizer),),
            ],
          ),
         
        ),
        body: new TabBarView(
          children: <Widget>[
            new Center(child: new Index()),
            new Center(child: new Rank()),
          ],
        ),
        drawer: new Drawer(
        child: HomeBuilder.homeDrawer(),
      ),
      ),
    );
  }
}

