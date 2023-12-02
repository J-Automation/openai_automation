
import 'package:flutter/material.dart';

import '../a/at.dart';

///widget to display the status of input/output
class IOLedState extends StatelessWidget {
  const IOLedState({super.key, required this.size, required this.ioPin});

  final double size;
  final IOPinModel ioPin;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration:BoxDecoration(
          shape: BoxShape.circle,
          color: (ioPin.value > 0) ? IOUtils.ledOn : IOUtils.ledOff
      ),
      child: (ioPin.isLocked)
          ?  Center(child: Container(width: size*0.5, height: size*0.5, decoration:  BoxDecoration(color: IOUtils.ledLocked,shape: BoxShape.circle),))
          : (ioPin.isForced)
          ? Center(child: Container(width: size*0.5, height: size*0.5, decoration:  BoxDecoration(color: IOUtils.ledForced,shape: BoxShape.circle),))
          :null,
    );
  }
}

///widget to lock input/output status
class IOLockStateIcon extends StatelessWidget {
  IOLockStateIcon({super.key,
    required this.ioPin,
    this.auxiliaryFunction,
    this.lockIcon = Icons.lock,
    this.unlockIcon = Icons.lock_open,
    this.size = 20,
    this.lockColor = Colors.red,
    this.unlockColor = Colors.white
  });

  final IOPinModel ioPin;
  final IconData lockIcon;
  final IconData unlockIcon;
  final double size;
  final Color lockColor;
  final Color unlockColor;
  final Function? auxiliaryFunction;
  final OpenAutomation? automation = OpenAutomation.instance;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: (){
          if(automation!=null){
            _sendChanges();
          }
          if(auxiliaryFunction != null){
            auxiliaryFunction!();
          }
        },
        child: (ioPin.isLocked) ? Icon(lockIcon,color:lockColor,size: size,)
            : Icon(unlockIcon,color:unlockColor,size: size,)
    );
  }

  Future<void> _sendChanges() async {
    ioPin.isLocked = !ioPin.isLocked;
    ioPin.isForced = ioPin.isLocked;
    IOUtils.lastIOPinManipulated = ioPin;
    (ioPin.isInput)?automation!.setVirtualInputs=true:automation!.setForcedOutputs=true;
    automation!.notify();
  }
}

///widget to modify input/output value
class IOSlider extends StatelessWidget {
  IOSlider({super.key,
    required this.ioPin,
    this.scadaMode = false,
    this.auxiliaryFunction,
    this.min = 0,
    this.max = 1023,
    this.divisions,
    this.activeColor = Colors.yellowAccent,
    this.inactiveTrackColor = Colors.orange,
    this.thumbColor = Colors.white,
  });

  final bool scadaMode;
  final IOPinModel ioPin;
  final int? divisions;
  final Color activeColor;
  final Color inactiveTrackColor;
  final Color thumbColor;
  final double min;
  final double max;
  final Function? auxiliaryFunction;
  final OpenAutomation? automation = OpenAutomation.instance;

  @override
  Widget build(BuildContext context) {

    return Slider(
        min: min,
        max: max,
        divisions: divisions,
        activeColor: activeColor,
        inactiveColor: inactiveTrackColor,
        thumbColor: thumbColor,
        value: ioPin.analogState().toDouble(),
        onChanged: (value) async {
          if(automation != null){
            ioPin.setAnalogState(value.toInt());
            ioPin.isForced = true;
            IOUtils.lastIOPinManipulated =ioPin;
            if(!scadaMode) {
              await _sendChanges();
            }
          }
          if(auxiliaryFunction != null){
            auxiliaryFunction!();
          }
        });
  }

  Future<void> _sendChanges() async {
    if(ioPin.isInput){
      automation!.setVirtualInputs = true;
      automation!.ndd = true;
      await automation!.updateVirtualInputs();
    }else{
      automation!.setForcedOutputs = true;
      await automation!.updateForcedOutputs();
    }
  }
}

///widget to change digital input/output status
class IOSwitch extends StatelessWidget {
  IOSwitch({super.key,
    required this.ioPin,
    this.scadaMode = false,
    this.auxiliaryFunction,
    this.activeColor = Colors.yellowAccent,
    this.activeTrackColor = Colors.yellowAccent,
    this.inactiveTrackColor = Colors.orange,
    this.thumbColor = Colors.white,
  });

  final bool scadaMode;
  final Color activeColor;
  final Color activeTrackColor;
  final Color inactiveTrackColor;
  final Color thumbColor;
  final IOPinModel ioPin;
  final Function? auxiliaryFunction;
  final OpenAutomation? automation = OpenAutomation.instance;

  @override
  Widget build(BuildContext context) {
    return Switch(
        activeColor: activeColor,
        activeTrackColor: activeTrackColor,
        inactiveTrackColor: inactiveTrackColor,
        thumbColor: MaterialStatePropertyAll(thumbColor),
        value: ioPin.boolDigitalState(),
        onChanged: (value) async {
          if(automation != null){
            ioPin.setDigitalState(value);
            ioPin.isForced = true;
            IOUtils.lastIOPinManipulated = ioPin;
            if(!scadaMode) {
              await _sendChanges();
            }
          }
          if(auxiliaryFunction != null){
            auxiliaryFunction!();
          }
        });
  }

  Future<void> _sendChanges() async {
    if(ioPin.isInput){
      automation!.setVirtualInputs = true;
      automation!.ndd = true;
      await automation!.updateVirtualInputs();
    }else{
      automation!.setForcedOutputs = true;
      await automation!.updateForcedOutputs();
    }
  }
}


class IOUtils {

  static Color ledOn = Colors.lightGreenAccent.shade700;
  static Color ledOff = Colors.black38;
  static Color ledForced = Colors.amber.shade700;
  static Color ledLocked = Colors.red;

  static IOPinModel lastIOPinManipulated = IOPinModel(value: 0, isInput: true, index: 0);
}

