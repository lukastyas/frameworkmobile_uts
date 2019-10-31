import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'home_page.dart';


class Homepage extends StatelessWidget {
  static String tag = 'cobo-page';

  final String title;

  Homepage({Key key, this.title}) : super(key: key);

  //TODO dibawah ini digunakan untuk membuat AppBar
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
      //TODO dibawah ini digunakan untuk membuat drawer
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
                //TODO navigator ini untuk menutup drawer
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
            //TODO dibawah ini fungsinya untuk membuat tab yang jumlahnya 3
            title: new TabBar(
              tabs: [
                new Tab(text: "Home",),
                new Tab(text: "SnackBar",),
                new Tab(text: "ListView",),
              ],
              indicatorColor: Colors.white,
            ),
          ),
          //TODO dalam bodynya terdapat isi dari masing-masing Tab
          body: new TabBarView(
            children: [
              Welcome(),
              SnackBarPage(),
              MyApp(),
            ],
          ),
        ),
      ),
    );
  }
}

//TODO terdapat class MyApp1
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

//TODO class snackbar untuk menampilkan snackbar
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

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ListView Builder',
      home: Scaffold(
        body: _PageList(),
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}

//TODO listview class
class _PageList extends StatefulWidget {
  @override
  _PageListState createState() => _PageListState();
}
//TODO class listview dan isi list masih statis
class _PageListState extends State<_PageList> {

  List<String> languages = [
    "Dart",
    "Kotlin",
    "Java",
    "PHP",
    "Swift",
    "Javascript",
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey[300],
      child: ListView.builder(
        itemCount: languages.length,
        itemBuilder: (BuildContext context, int index) {
          final number = index+1;
          final language = languages[index].toString();
          return Card(
            child: ListTile(
              leading: Text(number.toString()),
              title: Text(language),
              trailing: Icon(Icons.check),
            ),
          );
        },
      ),
    );
  }
}

//TODO tampilan awal setelah login masuk ketab home
class Welcome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final _screenSize = MediaQuery.of(context).size;
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'First App',
      home: Scaffold(
          body:  Container(
            height: 500,
            child: Column(
              children: <Widget>[
                Image.asset('img/bg.jpg'),
                Text(
                  'Welcome to My Project',
                  style: TextStyle(fontSize: 24, fontFamily: "Serif", height: 2.0),
                ),
                Text('oleh Programer Tcupu'),
//                Row(
//                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                  children: <Widget>[
//                    Image.asset('img/p.jpg'),
//                    Image.asset('img/p.jpg')
//                  ],
//                )
              ]
          )
          )
      ),
    );
  }
}