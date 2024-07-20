import 'RowWidget.dart';
import 'package:flutter/material.dart';
//import 'package:fluttertoast/fluttertoast.dart';
import 'package:bot_toast/bot_toast.dart';
import 'ColumnAndRowNestingWidget.dart';
import 'ContainerWithBoxDecorationWidget.dart';
import 'ColumnWidget.dart';
/*
https://github.com/MMMzq/bot_toast/tree/master
*/
void main() {
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      builder: BotToastInit(),
      navigatorObservers: [BotToastNavigatorObserver()], //2. registered route observer=
      debugShowCheckedModeBanner: false,
      //title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.lightGreen ,
      ),
      home:  MyHomePage(),
    );
  }
}
class MyHomePage extends StatefulWidget
{
  @override
  State<StatefulWidget> createState() {
    return MyHomeState();
  }
}
class MyHomeState extends State<MyHomePage>{
  int _selectedIndex = 0;
  static const TextStyle optionStyle =
  TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  static const List<Widget> _widgetOptions = <Widget>[
    Text(
      'Index 0: Home',
      style: optionStyle,
    ),
    Text(
      'Index 1: Business',
      style: optionStyle,
    ),
    Text(
      'Index 2: School',
      style: optionStyle,
    ),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.menu),
          onPressed: () {
          BotToast.showText(text: "this is toast example...");
          BotToast.showSimpleNotification(title: "init");
          //BotToast.showLoading(); //popup a loading toast
          BotToast.showAttachedWidget(
              attachedBuilder: (_) => const Card(
                child: Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Icon(
                    Icons.favorite,
                    color: Colors.redAccent,
                  ),
                ),
              ),
              duration: Duration(seconds: 2),
              target: Offset(520, 520));

          //ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: const Text('snack')));            print(" print command...................");
          }
        ),
        title: const Text("Home"),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(Icons.more_vert),
            onPressed: () {},
          ),
        ],
        flexibleSpace: const SafeArea(
          child: Icon(
            Icons.photo_camera,
            size: 75.0,
            color: Colors.white70,
          ),
        ),
        bottom: PreferredSize(
          child: Container(
            color: Colors.lightGreen.shade100,
            height: 75.0,
            width: double.infinity,
            child: Center(
              child: Text('Bottom'),
            ),
          ),
          preferredSize: Size.fromHeight(75.0),
        ),
      ),
      //bottom part
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: <Widget> [
                const ContainerWithBoxDecorationWidget(),
                Divider(),
                const ColumnWidget(),
                Divider(),
                const RowWidget(),
                Divider(),
                const ColumnAndRowNestingWidget(),
                Divider(),
                FloatingActionButton.extended(onPressed: (){
                  BotToast.showText(text: "FloatingActionButton Pressed");
                },
                  backgroundColor: const Color(0xff03dac6),
                  foregroundColor: Colors.black,
                  icon: Icon(Icons.add),
                  label: Text("Hello."),
                ),
                Divider(),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.business),
            label: 'Business',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.school),
            label: 'School',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.amber[800],
        onTap: _onItemTapped,
      ),
    );
  }
}//end of Home Class

