import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Preferencias extends StatefulWidget {
  const Preferencias({super.key});

  @override
  State<Preferencias> createState() => _Preferencias();


}

class _Preferencias extends State<Preferencias>{

  bool _isResetEnabled = false;

  Future<void> _loadPreferences() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      _isResetEnabled = prefs.getBool('isResetEnabled') ?? false;
    });
  }

  Future<void> _savePreferences() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('isResetEnabled', _isResetEnabled);
  }

  @override
  void initState() {
    super.initState();
    _loadPreferences();
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: <Widget> [
            Checkbox(value: _isResetEnabled, onChanged: (bool? value){
              setState(() {
                _isResetEnabled = value!;
                _savePreferences();
              });
            })
          ],
        ),
      ),
    );
  }
  
}