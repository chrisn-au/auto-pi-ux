
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';
import 'package:syncfusion_flutter_core/core.dart';
import 'dart:async' show Future;
import 'package:flutter/services.dart' show rootBundle;
import 'dart:convert';

import '../autopi.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen();
  @override
  Widget build(BuildContext context) { 
    return MaterialApp(
      home: home(context)          
    );
  }
}

Widget home(BuildContext context) {
  //WidgetsFlutterBinding.ensureInitialized();
  var autopi = new AutoPI();
  Future<String> loadAsset() async {
    var jsonString = await rootBundle.loadString('config.json');
    Map<String, dynamic> msg = jsonDecode(jsonString);
    return msg['SyncFusionKey'];
  }
  loadAsset().then((value) => 
        SyncfusionLicense.registerLicense(value)
  );
 //   print(value);
  
  return Scaffold(
    body: Center(
      child: Container(
        child : new Column(
          children : [ twoAxis(context,autopi),
                      oneAxis(context,autopi),
          ])
       )
    )
  );
}

Widget oneAxis(BuildContext context, AutoPI autopi){
  return StreamBuilder<int>(
    stream: autopi.getStream("2").asBroadcastStream(),
    builder : (BuildContext context, intSnapshot){
      int number = intSnapshot.data;
      if (number == null) number = 0;
      var  val = 76;
      return Container (
        child : SfRadialGauge(
          axes: <RadialAxis>[
            RadialAxis(minimum: 0,maximum: 1000,
              ranges: <GaugeRange>[
                GaugeRange(startValue: 0,endValue: 50,color: Colors.green,startWidth: 10,endWidth: 10),
                GaugeRange(startValue: 300,endValue: 700,color: Colors.orange,startWidth: 10,endWidth: 10),
                GaugeRange(startValue: 700,endValue: 1000,color: Colors.red,startWidth: 10,endWidth: 10)],
              pointers: <GaugePointer>[NeedlePointer(value:number.toDouble())],
              annotations: <GaugeAnnotation>[
                GaugeAnnotation(widget: Container(child:
                  Text(number.toString(),style: TextStyle(fontSize: 25,fontWeight:FontWeight.bold))),
                  angle: 90,positionFactor: 0.5)]
          )]
        )
      );                  
    }
 );
}

Widget twoAxis(BuildContext context,AutoPI autopi){
  return StreamBuilder<int>(
    stream: autopi.getStream("1").asBroadcastStream(),
    builder : (BuildContext context, intSnapshot){
      int number = intSnapshot.data;
      if (number == null) number = 0;
      var  val = 76;
    return Container (
      child : SfRadialGauge(
        axes: <RadialAxis>[
          RadialAxis(minimum: 0,maximum: 220,
            ranges: <GaugeRange>[
              GaugeRange(startValue: 0,endValue: 60,color: Colors.green,startWidth: 10,endWidth: 10),
              GaugeRange(startValue: 60,endValue: 110,color: Colors.orange,startWidth: 10,endWidth: 10),
              GaugeRange(startValue: 110,endValue: 220,color: Colors.red,startWidth: 10,endWidth: 10)],
            pointers: <GaugePointer>[NeedlePointer(value:number.toDouble())],
            annotations: <GaugeAnnotation>[
              GaugeAnnotation(widget: Container(child:
                Text(number.toString(),style: TextStyle(fontSize: 25,fontWeight:FontWeight.bold))),
                    angle: 90,positionFactor: 0.8)]),
          RadialAxis(minimum: 0,maximum: 100, radiusFactor: 0.50 ,
            ranges: <GaugeRange>[
              GaugeRange(startValue: 0,endValue: 35,color: Colors.red,startWidth: 10,endWidth: 10),
              GaugeRange(startValue: 35,endValue: 75,color: Colors.orange,startWidth: 10,endWidth: 10),
              GaugeRange(startValue: 75,endValue: 100,color: Colors.green,startWidth: 10,endWidth: 10)],
            pointers: <GaugePointer>[NeedlePointer(value : val.toDouble())],
            annotations: <GaugeAnnotation>[
              GaugeAnnotation(widget: Container(child:
                Text("SOC",style: TextStyle(fontSize: 15,fontWeight:FontWeight.bold))),
                angle: 90,positionFactor: 0.5)])]
      )
    );                  
  }
 );
}
