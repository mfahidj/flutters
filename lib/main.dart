import 'package:flutter/material.dart';
//import 'package:fluttertoast/fluttertoast.dart';
import 'package:bot_toast/bot_toast.dart';
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
              attachedBuilder: (_) => Card(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
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

    );
  }

}

