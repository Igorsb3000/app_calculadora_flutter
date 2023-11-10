import 'package:flutter/material.dart';
import 'package:app_calculadora/tela_preenche.dart';

enum Campo { X, Y}

class TelaCalculadora extends StatefulWidget {
  const TelaCalculadora({super.key});

  @override
  State<TelaCalculadora> createState() {
    return _StateTelaCalculadora();
  }
}

class _StateTelaCalculadora extends State<TelaCalculadora> {
  int valorX = 0;
  int valorY = 0;
  int valorSoma = 0;


  void somarValores(){
    setState(() {
      valorSoma = valorX + valorY;
    });
  }

  Future<void> _navigateTelaPreenche(BuildContext context, String valor, Campo varName) async {
    // Navigator.push returns a Future that completes after calling
    // Navigator.pop on the Selection Screen.
    final int result = await Navigator.push(
      context,
      // Create the SelectionScreen in the next step.
      MaterialPageRoute(builder: (context) => TelaPreenche(valor: valor)),
    );

    if (!mounted) return;

    setState(() {
      if(varName == Campo.X){
        valorX = result;
      } else if (varName == Campo.Y){
        valorY = result;
      }

    });

    ScaffoldMessenger.of(context)
      ..removeCurrentSnackBar()
      ..showSnackBar(
        SnackBar(
          content: Text('Valor inserido em $varName: $result'),
        ),
      );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Calculadora"),
      ),
      body: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(valorX.toString()),
            TextButton(
              onPressed: () => _navigateTelaPreenche(context, valorX.toString(), Campo.X),
              style: TextButton.styleFrom(
                  backgroundColor: Colors.blueGrey.shade400,
                  minimumSize: const Size(150, 50)),
              child: const Text(
                "Informar X",
                style: TextStyle(color: Colors.white),
              ),
            )
          ],
        ),
        const SizedBox(height: 20),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(valorY.toString()),
            TextButton(
              onPressed: () => _navigateTelaPreenche(context, valorY.toString(), Campo.Y),
              style: TextButton.styleFrom(
                  backgroundColor: Colors.blueGrey.shade400,
                  minimumSize: const Size(150, 50)),
              child: const Text(
                "Informar Y",
                style: TextStyle(color: Colors.white),
              ),
            )
          ],
        ),
        const SizedBox(height: 20),
        TextButton(
          onPressed: () => somarValores(),
          style: TextButton.styleFrom(
            backgroundColor: Colors.blueGrey.shade400,
            minimumSize: const Size(150, 50),
          ),
          child: const Text(
            "Calcular",
            style: TextStyle(color: Colors.white),
          ),
        ),
        const SizedBox(height: 20),
        Text("Resultado: $valorSoma")
      ]),
    );
  }
}