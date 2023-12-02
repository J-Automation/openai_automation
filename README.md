<!--
This README describes the package. If you publish this package to pub.dev,
this README's contents appear on the landing page for your package.

For information about how to write a good package README, see the guide for
[writing package pages](https://dart.dev/guides/libraries/writing-package-pages).

For general information about developing packages, see the Dart guide for
[creating packages](https://dart.dev/guides/libraries/create-library-packages)
and the Flutter guide for
[developing packages and plugins](https://flutter.dev/developing-packages).
-->

Program and design automation and control systems using open-source tools and equipment.
Tailored for enthusiasts and professionals working in automation and robotics environments based on PLCs, HMI, and SCADA.

## Features

OpenAI-Automation is an exciting project that drives control in automation and robotics through open source systems and devices.

It gives you the opportunity to program your code with the programming language that best suits your needs, based on the Dart language and the Flutter environment.

Complement your projects with the power of artificial intelligence and other software tools such as real-time databases.

Turn your mobile device, laptop, desktop PC, tablet or iPad into your HMI or SCADA graphical interface and the main processing engine of your programmable logic controller.


## Getting started

For more examples and methodologies visit openai-automation.com

## Usage


```dart
import 'package:flutter/material.dart';
import 'package:openai_automation/openai_automation.dart';
import 'package:provider/provider.dart';

void main() async {
  
      // Communication with the device via USB begins. No need to have a connected device to perform tests.
      await MyPLC.usb.connect(usbIndex: 0, inputs: 8, outputs: 8);
      
      //Set the main program, traffic light example included in the library
      MyPLC.mini.mainLogicProgram = Programs.simpleTrafficLight;

      //OpenAutomation implements the ChangeNotifier class to notify changes.
      // Use a supported state manager of your choice, for example Provider, Riverpod or Bloc
      runApp(MultiProvider(
             providers: [ChangeNotifierProvider(create: (_) => MyPLC.mini)],
             child: const MyApp())
            );
      }

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Mi first test with the controllino mini configuration',
      home: Scaffold(
        body: Center(
          child: IOStatus(),
        ),
      ),
    );
  }
}

//It is recommended to have a separate widget for using I/O status with your status manager
class IOStatus extends StatelessWidget {
  const IOStatus({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    //listen to the events and redraw only this widget
    Provider.of<OpenAutomation>(context);

    return Text(
            'Device: ${MyPLC.mini.deviceReport}\n\n'
            'Input Data: ${MyPLC.mini.inputDataPayload}\n\n'
            'Output Data: ${MyPLC.mini.outputDataPayload}');
    }
}

//Use the instances of your libraries as static and in a separate class
class MyPLC {
  static OpenAutomation mini = OpenAutomation.getInstance();
  static UsbCommWindows usb = UsbCommWindows(mini);
}
```

## Additional information

Join this great community
Visit openai-automation.com
