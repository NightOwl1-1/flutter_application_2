import 'step.dart';

class StateMachine {
  List<MyStep> _steps;
  int _currentStep = 0;

  StateMachine(this._steps);

  bool nextStep(bool choice) {
    if (_currentStep < _steps.length) {
      if (choice) {
        _currentStep++;
      } else {
        if (_currentStep == 0 || _currentStep == 3) {
          _currentStep = 9;
        } else if (_currentStep == 6) {
          _currentStep = 0;
        }
      }
    }
    return _currentStep == _steps.length;
  }

  void restart() {
    _currentStep = 0;
  }

  String getCurrentStepText() {
    if (_currentStep < _steps.length) {
      return _steps[_currentStep].text;
    } else {
      return '';
    }
  }

  String getChoice1Text() {
    return _currentStep < _steps.length ? _steps[_currentStep].choice1 : "";
  }

  String getChoice2Text() {
    return _currentStep < _steps.length ? _steps[_currentStep].choice2 : "";
  }

  bool isRestartButtonVisible() {
    return _currentStep < _steps.length;
  }
}
