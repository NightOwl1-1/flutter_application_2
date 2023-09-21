import 'package:flutter/material.dart';
import 'stateMachine.dart';
import 'step.dart' as MyStep;

void main() {
  final List<MyStep.MyStep> steps = [
    MyStep.MyStep(
      "Paciente com glicemia capilar > 250mg/dL. Há sinais/sintomas de cetoacidose diabética ou estado hiperosmolar?",
      "Sim",
      "Não",
    ),
    MyStep.MyStep(
      "Encaminhar para emergência imediatamente. Monitorar sinais vitais. Realizar hidratação EV com SF0,9% enquanto aguarda o transporte",
      "Reiniciar",
      "",
    ),
    MyStep.MyStep(
      "Há suspeita de doenças intercorrentes (excluindo emergências)?",
      "Sim",
      "Não",
    ),
    MyStep.MyStep(
      "Provável descompensação. Outro final do diagrama",
      "Reiniciar",
      "",
    ),
    MyStep.MyStep(
      "Cetonúria disponível (se indisponível, considerar negativa)?",
      "Sim",
      "Não",
    ),
    MyStep.MyStep(
      "Encaminhar para emergência imediatamente. Monitorar sinais vitais. Realizar hidratação EV com SF0,9% enquanto aguarda o transporte",
      "Reiniciar",
      "",
    ),
    MyStep.MyStep(
      "Aplicar insulina regular e reavaliar glicemia capilar em 2 horas",
      "Reiniciar",
      "",
    ),
    MyStep.MyStep(
      "Glicemia abaixo de 250mg/DL?",
      "Sim",
      "Não",
    ),
    MyStep.MyStep(
      "Encaminhar para emergência imediatamente. Monitorar sinais vitais. Realizar hidratação EV com SF0,9% enquanto aguarda o transporte",
      "Reiniciar",
      "",
    ),
    MyStep.MyStep(
      "Tratar complicações agudas. Aumentar transitoriamente dose total de insulina até resolução do quadro.",
      "Reiniciar",
      "",
    ),
  ];
  final StateMachine stateMachine = StateMachine(steps);

  runApp(MyApp(stateMachine));
}

class MyApp extends StatefulWidget {
  final StateMachine stateMachine;

  MyApp(this.stateMachine);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Avaliação de Diabetes"),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(widget.stateMachine.getCurrentStepText()),
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    widget.stateMachine.nextStep(true);
                  });
                },
                child: Text("Sim"),
              ),
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    widget.stateMachine.nextStep(false);
                  });
                },
                child: Text("Não"),
              ),
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    widget.stateMachine.restart();
                  });
                },
                child: Text("Reiniciar"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
