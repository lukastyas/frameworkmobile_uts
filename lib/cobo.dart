import 'package:flutter/material.dart';
import 'home_page.dart';


class Homepage extends StatelessWidget {
  static String tag = 'cobo-page';

  final String title;

  Homepage({Key key, this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: new AppBar(
        elevation: 0.0,
        title: Text(title),
        actions: <Widget>[
          new IconButton( icon: new Icon(Icons.search, color: Colors.white),
              onPressed: (){

              }
          ),
        ],
      ),
      drawer: Drawer(
        child: ListView(
          children: <Widget>[
            UserAccountsDrawerHeader(
              accountName: Text("Flutter"),
              accountEmail: Text("flutter@example.com"),
              currentAccountPicture: CircleAvatar(
                child: Text("F"),
                backgroundColor: Colors.white,
                foregroundColor: Colors.red,
              ),//CircleAvatar
              otherAccountsPictures: <Widget>[
                CircleAvatar(
                  child: Text("C"),
                  backgroundColor: Colors.white,
                  foregroundColor: Colors.red,
                )
              ],//<Widget>
            ),//UserAccountHeader
            ListTile(
              leading: CircleAvatar(
                child: Icon(Icons.home),
              ),
              title: Text("Home"),
              onTap: (){
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: CircleAvatar(
                child: Icon(Icons.map),
              ),
              title: Text("Map"),
              onTap: (){
                Navigator.pop(context);
              },
            ),
            Divider(
              height: 2.0,
            ),
            ListTile(
              leading: CircleAvatar(
                child: Icon(Icons.close),
              ),
              title: Text("Close"),
              onTap: (){
                Navigator.of(context).pop();
              },
            ),
          ],
        ),
      ),
      body: new DefaultTabController(
        length: 3,
        child: new Scaffold(
          appBar: new AppBar(
            actions: <Widget>[],
            title: new TabBar(
              tabs: [
                new Tab(icon: new Icon(Icons.directions_car)),
                new Tab(icon: new Icon(Icons.directions_transit)),
                new Tab(icon: new Icon(Icons.directions_bike)),
              ],
              indicatorColor: Colors.white,
            ),
          ),
          body: new TabBarView(
            children: [
              SnackBarPage(),
              new Icon(Icons.directions_transit,size: 50.0,),
              new Icon(Icons.directions_bike,size: 50.0,),
            ],
          ),
        ),
      ),
    );
  }
}

class MyApp1 extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Drawer Layout With Tabs',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: Homepage(title: 'Drawer Layout With Tabs'),
    );
  }
}

class SnackBarPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Center(
      child: RaisedButton(
        onPressed: () {
          final snackBar = SnackBar(
            content: Text('Yay! A SnackBar!'),
            action: SnackBarAction(
              label: 'Undo',
              onPressed: () {

              },
            ),
          );

          Scaffold.of(context).showSnackBar(snackBar);
        },
        child: Text('Show SnacnkBar'),
      ),
    );
  }
}