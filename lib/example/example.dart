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
      child: const MyApp()));
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
  const IOStatus({super.key});

  @override
  Widget build(BuildContext context) {
    //listen to the events and redraw only this widget
    Provider.of<OpenAutomation>(context);

    return Text('Device: ${MyPLC.mini.deviceReport}\n\n'
        'Input Data: ${MyPLC.mini.inputDataPayload}\n\n'
        'Output Data: ${MyPLC.mini.outputDataPayload}');
  }
}

//Use the instances of your libraries as static and in a separate class
class MyPLC {
  static OpenAutomation mini = OpenAutomation.getInstance();
  static UsbCommWindows usb = UsbCommWindows(mini);
}
