import 'package:flutter/material.dart';
import 'package:flutter_application_1/pages/about.dart';
import 'ListContent.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();


}

class _MyHomePageState extends State<MyHomePage>{

void changePage(){
    Navigator.push(
      context, 
      MaterialPageRoute(builder: (context) => const ListContent())
    );
  }

int navIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Card(
      //color: Colors.red,
      child: Scaffold(
        bottomNavigationBar: NavigationBar( 
          onDestinationSelected: (int index){
            setState((){
              switch (index){
                case 0:
                  /*Navigator.push(
                    context, 
                    MaterialPageRoute(builder: (context) => const MyHomePage())
                  );*/
                  break;
                case 1:
                Navigator.push(
                    context, 
                    MaterialPageRoute(builder: (context) => const ListContent())
                  );
                  break;
                case 2:
                Navigator.push(
                    context, 
                    MaterialPageRoute(builder: (context) => const AboutPage())
                  );
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
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget> [
              const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget> [
                    Text(
                  'texto de flutter'
                  )
                ]
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget> [
                  TextButton(onPressed: changePage, child: const Text('Lista'),),
                  //TextButton(onPressed: changePage, child: const Text('data2'),)
                ],
              ),
            ],
          ), 
        ),
      ),
    );
  }

}