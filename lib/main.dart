import 'dart:async';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';
import 'package:syncfusion_flutter_core/core.dart';
//import './mqtt/mqtt.dart';


    void main() {
      
    SyncfusionLicense.registerLicense("NT8mJyc2IWhia31ifWN9Z2FoYmF8YGJ8ampqanNiYmlmamlmanMDHmgwPTYyJTYTND4yOj99MDw+"); 

    runApp(ChartApp());
    } 
    class ChartApp extends StatelessWidget {
    
  

    @override
    Widget build(BuildContext context) {
       
        return MaterialApp(
            home:
               Scaffold(
                body: Center(
                    child: Container(
                      child : new Column(
                        children : [ graph(context),
                        graph2(context, intStream2),
                    //    graph(context),
                        ])
                    )
                )
            )
          );
          
        }
    }



Stream<int> intStream = Stream<int>.periodic( Duration(seconds : 1), callback).asBroadcastStream();
Stream<int> intStream2 = Stream<int>.periodic( Duration(seconds : 2), callback);


int callback(int value){
  return (value +1) * 2;
}

Widget graph2(BuildContext context, Stream stream){
 //StreamController<int> ct;
  return StreamBuilder<int>(
      stream: stream,
      builder : (BuildContext context, AsyncSnapshot<int> intSnapshot){
        int number = intSnapshot.data;
        if (number == null) number = 0;
  
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

Widget graph(BuildContext context){
 //StreamController<int> ct;
  return StreamBuilder<int>(
      stream: NumberCreator().stream,
      builder : (BuildContext context, intSnapshot){
        int number = intSnapshot.data;
        if (number == null) number = 0;
        var  val = 76;
  return Container (
                            child : SfRadialGauge(
                            axes: <RadialAxis>[
                                RadialAxis(minimum: 0,maximum: 100,
                                ranges: <GaugeRange>[
                                    GaugeRange(startValue: 0,endValue: 50,color: Colors.green,startWidth: 10,endWidth: 10),
                                    GaugeRange(startValue: 300,endValue: 700,color: Colors.orange,startWidth: 10,endWidth: 10),
                                    GaugeRange(startValue: 700,endValue: 1000,color: Colors.red,startWidth: 10,endWidth: 10)],
                                    pointers: <GaugePointer>[NeedlePointer(value:number.toDouble())],
                                    annotations: <GaugeAnnotation>[
                                        GaugeAnnotation(widget: Container(child:
                                        Text(number.toString(),style: TextStyle(fontSize: 25,fontWeight:FontWeight.bold))),
                                        angle: 90,positionFactor: 0.8)]
                                ),RadialAxis(minimum: 0,maximum: 100, radiusFactor: 0.50 ,
                                ranges: <GaugeRange>[
                                    GaugeRange(startValue: 0,endValue: 35,color: Colors.red,startWidth: 10,endWidth: 10),
                                    GaugeRange(startValue: 35,endValue: 75,color: Colors.orange,startWidth: 10,endWidth: 10),
                                    GaugeRange(startValue: 75,endValue: 100,color: Colors.green,startWidth: 10,endWidth: 10)],
                                    pointers: <GaugePointer>[NeedlePointer(value : val.toDouble())],
                                    annotations: <GaugeAnnotation>[
                                        GaugeAnnotation(widget: Container(child:
                                        Text("SOC",style: TextStyle(fontSize: 15,fontWeight:FontWeight.bold))),
                                        angle: 90,positionFactor: 0.5)]
                                )]
                            )
                        );                  
              }
 );
}


class NumberCreator {
  NumberCreator() {
    Timer.periodic(Duration(seconds: 1), (t) {
      _controller.sink.add(_count);
      if (_count == 100) _count = 0;
      else _count++;
    });
  }

  var _count = 1;
  final _controller = StreamController<int>();
  Stream<int> get stream => _controller.stream;
}