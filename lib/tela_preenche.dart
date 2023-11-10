import 'package:flutter/material.dart';

class TelaPreenche extends StatefulWidget {
  const TelaPreenche({super.key, required this.valor});

  final String valor;

  @override
  State<TelaPreenche> createState(){
    return _StateTelaPreenche(valor);
  }
}

class _StateTelaPreenche extends State<TelaPreenche>{
  late String valor;

  _StateTelaPreenche(this.valor);

  TextEditingController textEditingController = TextEditingController();


  void alterarValor(){
    setState(() {
      valor = textEditingController.value.text;
    });
  }

  @override
  Widget build(BuildContext context) {
    //final varName = ModalRoute.of(context)!.settings.arguments as String;

    return Scaffold(
      appBar: AppBar(
        title: const Text("Preenche Valores"),
      ),
      body: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Text("Set $valor:"),
            SizedBox(
              width: 300,
              child: TextField(
                controller: textEditingController,
                onChanged: (value) {
                  print(textEditingController.value.text);
                  alterarValor();
                },
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  hintText: "Digite um valor",
                  hintStyle: TextStyle(color: Colors.black),
                  fillColor: Colors.white,
                  filled: true,
                ),
              ),
            )
          ],
        ),
        const SizedBox(height: 20),
        TextButton(
          onPressed: () => Navigator.pop(context, int.parse(valor)),
          style: TextButton.styleFrom(
            backgroundColor: Colors.blueGrey.shade400,
            minimumSize: const Size(150, 50),
          ),
          child: const Text(
            "Ok",
            style: TextStyle(color: Colors.white),
          ),
        )
      ]),
    );
  }
}
