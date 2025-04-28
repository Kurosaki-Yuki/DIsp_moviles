import 'package:flutter/material.dart';
import 'ListContent.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

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

  @override
  Widget build(BuildContext context) {
    return Card(
      //color: Colors.red,
      child: Scaffold(
      appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: Text(widget.title),
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