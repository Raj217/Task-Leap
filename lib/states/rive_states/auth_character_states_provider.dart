import 'dart:math';
import 'package:task_leap/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:rive/rive.dart';

class AuthCharacterStatesProvider extends ChangeNotifier {
  SMIBool? _isChecking;
  SMITrigger? _trigSuccess;
  SMITrigger? _trigFail;
  SMIBool? _isHandsUp;
  SMINumber? _numLook;

  void onInit(Artboard artboard) {
    final controller =
        StateMachineController.fromArtboard(artboard, 'Login Machine');
    artboard.addController(controller!);

    _isChecking = controller.findInput<bool>('isChecking') as SMIBool;
    _isHandsUp = controller.findInput<bool>('isHandsUp') as SMIBool;
    _trigSuccess = controller.findInput<bool>('trigSuccess') as SMITrigger;
    _trigFail = controller.findInput<bool>('trigFail') as SMITrigger;
    _numLook = controller.findInput<double>('numLook') as SMINumber;
  }

  set isChecking(bool val) {
    _isChecking?.value = val;
    notifyListeners();
  }

  set isHandsUp(bool val) {
    _isHandsUp?.value = val;
    notifyListeners();
  }

  void success() {
    _trigSuccess?.fire();
    notifyListeners();
  }

  void fail() {
    _trigFail?.fire();
    notifyListeners();
  }

  Future<void> _animateLookValue(double newValue) async {
    if (_numLook == null) {
      _numLook?.value = newValue;
    } else {
      double current = _numLook!.value + 1;
      while (current < newValue) {
        _numLook?.value = current;
        current++;
        await Future.delayed(const Duration(milliseconds: 50));
      }
    }
  }

  Future<void> look({
    required String text,
    required TextStyle style,
    required double maxFieldWidth,
  }) async {
    double width = UIUtils.getTextSize(text: text, style: style).width;
    width = min(width, maxFieldWidth);
    await _animateLookValue((width / maxFieldWidth) * 100);
    notifyListeners();
  }
}
