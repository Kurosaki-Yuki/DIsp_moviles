import 'package:flutter/material.dart';
import 'package:flutter_application_1/pages/about.dart';
import 'package:logger/logger.dart';
import 'ListContent.dart';
import 'package:shared_preferences/shared_preferences.dart';


var logger = Logger();
bool _isResetEnabled = false;

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();

  
}

class _MyHomePageState extends State<MyHomePage>{


Future<void> _loadPreferences() async {
    
    final prefs = await SharedPreferences.getInstance();
      setState(() {
        logger.d("home load");
        _isResetEnabled = prefs.getBool('isResetEnabled') ?? false;
        });
  }

@override
void initState() {
  logger.d("init");
  super.initState();
  _loadPreferences();
}

void changePage(){
    Navigator.push(
      context, 
      MaterialPageRoute(builder: (context) => const ListContent())
    );
  }

int navIndex = 0;

bool test = false;

int _counter = 0;

void _incrementCounter(){
  setState(() {
    logger.d("plus");
    _counter++;
  });
}
void _decrementCounter(){
  setState(() {
    logger.d(_isResetEnabled);
    _counter--;
  });
}
void _resetCounter(){
  setState(() {
    _counter = 0;
  });
}


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
                  ).then((_) {
                    _loadPreferences();
                  });

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
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget> [
                  Text(
                    'Numero: $_counter'
                  )
                ]
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget> [
                  TextButton(onPressed: _incrementCounter, child: const Icon(Icons.add),),
                  TextButton(onPressed: _decrementCounter, child: const Icon(Icons.remove),),
                  TextButton(onPressed: _isResetEnabled? _resetCounter : null, child: const Icon(Icons.restart_alt),)
                ],
              ),
            ],
          ), 
        ),
      ),
    );
  }

}