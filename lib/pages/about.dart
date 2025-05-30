import 'package:flutter/material.dart';
import 'package:flutter_application_1/pages/ListContent.dart';
import 'package:flutter_application_1/pages/home.dart';
import 'package:flutter_application_1/pages/preferencias.dart';

class AboutPage extends StatefulWidget{
  const AboutPage({super.key});

  @override
  State<AboutPage> createState() => _AboutPage();
}

class _AboutPage extends State<AboutPage>{

  void prefPage(){
    Navigator.push(context, MaterialPageRoute(builder: (context) => const Preferencias()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: NavigationBar( 
          onDestinationSelected: (int index){
            setState((){
              switch (index){
                case 0:
                  Navigator.push(
                    context, 
                    MaterialPageRoute(builder: (context) => const MyHomePage())
                  );
                  break;
                case 1:
                Navigator.push(
                    context, 
                    MaterialPageRoute(builder: (context) => const ListContent())
                  );
                  break;
                case 2:
                /*Navigator.push(
                    context, 
                    MaterialPageRoute(builder: (context) => const AboutPage())
                  );*/
                  break;
              }
            });
          },
          destinations: const <Widget> [
            NavigationDestination(icon: Icon(Icons.home), label: 'home'),
            NavigationDestination(icon: Icon(Icons.list), label: 'list'),
            NavigationDestination(icon: Icon(Icons.message), label: 'about'),
          ],
        ),
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
                  TextButton(onPressed: prefPage, child: const Text('Preferencias'),),
                  //TextButton(onPressed: nextPage, child: const Text('About'),),
                ]
              )
          ],
        ),
      ),
    );
  }
}