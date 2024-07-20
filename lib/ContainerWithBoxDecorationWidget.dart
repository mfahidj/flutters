import 'package:flutter/material.dart';

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
                color: Colors.yellow,
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
