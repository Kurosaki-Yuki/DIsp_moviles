import 'package:flutter/material.dart';
import 'package:flutter_application_1/services/database_helper.dart';
import 'package:flutter_application_1/Entity/actividad.dart';



class Activities extends StatefulWidget {
  const Activities({super.key});

  @override
  State<Activities> createState() => _Activities();

  
}

class _Activities extends State<Activities>{

  final DatabaseHelper _dbHelper = DatabaseHelper();
  List<Actividad> _activities = [];

  @override
  void initState() {
  super.initState();
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(

    );
  }

}