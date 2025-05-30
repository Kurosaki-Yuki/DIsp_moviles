import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_application_1/pages/about.dart';
import 'package:flutter_application_1/pages/home.dart';

class ListContent extends StatefulWidget{
  const ListContent({super.key});

  @override
  State<ListContent> createState() => _ListContent();
}

class _ListContent extends State<ListContent>{

  void backPage(){
    Navigator.pop(context);
  }

  void nextPage(){
    Navigator.push(context, 
    MaterialPageRoute(builder: (context) => const AboutPage()));
  }



  @override
  Widget build(BuildContext context) {
    
  final List<String> elementos = [
    'TE',
    'TO',
    'TETO'
  ];

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
                /*Navigator.push(
                    context, 
                    MaterialPageRoute(builder: (context) => const ListContent())
                  );*/
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
      persistentFooterButtons: [
        Visibility(
          maintainSize: true, 
          maintainAnimation: true,
          maintainState: true,
          visible: true, 
          child: ElevatedButton(
            onPressed: backPage,
            child: const Text('Volver'),
          )
        ),
        Visibility(
          maintainSize: true, 
          maintainAnimation: true,
          maintainState: true,
          visible: true, 
          child: ElevatedButton(
            onPressed: nextPage,
            child: const Text('About'),
          )
        )
      ],
      body: ListView.builder(
          itemCount: elementos.length,
          itemBuilder: (context, index){
            return ListTile(
              title: Text(elementos[index]),
            );
          },
        ),
      

              /*Row( 
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget> [
                  TextButton(onPressed: backPage, child: const Text('Volver'),),
                  TextButton(onPressed: nextPage, child: const Text('About'),),
                ]
              )
          ],
        ),
      ),*/
    );
  }
}