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
      //bottom part
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: <Widget> [
                const ContainerWithBoxDecorationWidget(),
              ],
            ),
          ),
        ),
      ),

    );
  }

}//end of Home Class
class ContainerWithBoxDecorationWidget extends StatelessWidget{
  const ContainerWithBoxDecorationWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return  Column(
      children: <Widget>
      [
        Container
          (
          height: 100.0,
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(100.0),
              bottomRight: Radius.circular(10.0),
            ),
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: <Color> [
                Colors.white,
                Colors.blue,
              ],
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.white,
                blurRadius: 10.0,
                offset: Offset(0.0, 10.0),
              )
            ],
          ),
          child: Center(
            child: RichText(
              text: TextSpan(
                text: 'Flutter World ',
                style: TextStyle(
                  fontSize: 24.0,
                  color: Colors.black,
                  decoration: TextDecoration.underline,
                  decorationColor: Colors.black54,
                  decorationStyle: TextDecorationStyle.dotted,
                  fontStyle: FontStyle.italic,
                  fontWeight: FontWeight.normal,
              ),
                children: <InlineSpan>[
                  TextSpan(
                   text: 'for'
                  ),
                  TextSpan(
                    text: ' Mobile',
                    style: TextStyle(
                        color: Colors.deepOrange,
                        fontStyle: FontStyle.normal,
                        fontWeight: FontWeight.bold),
                  ),
                ],
            ),
          ),
          ),
        ),

      ],
    );
  }
}

