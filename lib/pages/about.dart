import 'package:flutter/material.dart';

class AboutPage extends StatefulWidget{
  const AboutPage({super.key});

  @override
  State<AboutPage> createState() => _AboutPage();
}

class _AboutPage extends State<AboutPage>{

  void backPage(){
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          //title: Text(widget.title),
        ), 
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget> [
              Row( 
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget> [
                  TextButton(onPressed: backPage, child: const Text('Volver'),),
                  //TextButton(onPressed: nextPage, child: const Text('About'),),
                ]
              )
          ],
        ),
      ),
    );
  }
}