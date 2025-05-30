import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:logger/logger.dart';

class Preferencias extends StatefulWidget {
  const Preferencias({super.key});

  @override
  State<Preferencias> createState() => _Preferencias();


}

class _Preferencias extends State<Preferencias>{

  bool _isResetEnabled = false;

  var logger = Logger();

  Future<void> _loadPreferences() async {
    final prefs = await SharedPreferences.getInstance();
    logger.d("loaded");
    setState(() {
      _isResetEnabled = prefs.getBool('isResetEnabled') ?? false;
    });
  }

  Future<void> _savePreferences() async {
    final prefs = await SharedPreferences.getInstance();
    logger.d("saved");
    await prefs.setBool('isResetEnabled', _isResetEnabled);
  }

  @override
  void initState() {
    logger.d("init");
    super.initState();
    _loadPreferences();
  }

   @override
  void dispose(){
    logger.d("disp");
    super.dispose();
    _savePreferences();
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
          children: <Widget> [
            Checkbox(value: _isResetEnabled, onChanged: (bool? value){
              setState(() {
                _isResetEnabled = value!;
                logger.d("check \n $_isResetEnabled");
                _savePreferences();
              });
            })
          ],
        ),
      ),
    );
  }
  
}