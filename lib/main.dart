import 'package:flutter/material.dart';
import './screens/home_screen.dart';
import 'package:syncfusion_flutter_core/core.dart';
import 'dart:async' show Future;
import 'package:flutter/services.dart' show rootBundle;
import 'dart:convert';
import './autopi.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Future<String> loadConfig() async {
    var jsonString = await rootBundle.loadString('config.json');
    Map<String, dynamic> msg = jsonDecode(jsonString);
    return msg['SyncFusionKey'];
  }
  var key = await loadConfig();
      SyncfusionLicense.registerLicense(key);
  runApp(AutoPIApp());
} 
class AutoPIApp extends StatelessWidget {
  @override
  Widget build(BuildContext context, ) { 
    return MaterialApp(
      home: new HomeScreen()        
    );
  }
}


