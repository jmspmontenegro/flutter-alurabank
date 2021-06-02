import 'package:flutter/material.dart';

void main() => runApp(AluraBankApp());

class AluraBankApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: FormularioTransferencia(),
      ),
    );
  }
}

class FormularioTransferencia extends StatelessWidget {
  final TextEditingController _controladorCampoNumeroConta =
      TextEditingController();
  final TextEditingController _controladorCampoValor = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Nova Transferência'),
      ),
      body: Column(
        children: <Widget>[
          MyInputText(
            controlador: _controladorCampoNumeroConta,
            rotulo: 'Número da conta',
            dica: '00000',
          ),
          MyInputText(
            controlador: _controladorCampoNumeroConta,
            rotulo: 'Valor',
            dica: '0000.00',
            icone: Icons.monetization_on,
          ),
          
          ElevatedButton(
            style: ButtonStyle(),
            onPressed: () => _criaTransferencia(),
            child: Text('Confirmar'),
          )
        ],
      ),
    );
  }

  void _criaTransferencia() {
    final int? numeroConta =
        int.tryParse(_controladorCampoNumeroConta.text);
    final double? valor =
        double.tryParse(_controladorCampoValor.text);
    if (numeroConta != null && valor != null) {
      final transferenciaCriada = Transferencia(valor, numeroConta);
    }
  }
}

class MyInputText extends StatelessWidget {
  final TextEditingController controlador;
  final String? rotulo;
  final String? dica;
  final IconData? icone;

  MyInputText({required this.controlador,  this.rotulo, this.dica, this.icone});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: TextField(
        controller: controlador,
        style: TextStyle(
          fontSize: 24.0,
        ),
        decoration: InputDecoration(
          icon: icone != null ? Icon(icone) : null,
          labelText: rotulo,
          hintText: dica,
        ),
        keyboardType: TextInputType.number,
      ),
    );
  }
}

class ListaTransferencia extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Alura Bank - Transferências"),
      ),
      body: Column(
        children: <Widget>[
          ItemTransferencia(Transferencia(110.22, 9898)),
          ItemTransferencia(Transferencia(98.00, 9898)),
          ItemTransferencia(Transferencia(1213.00, 9898)),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          //ao clicar
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}

class ItemTransferencia extends StatelessWidget {
  final Transferencia _transferencia;

  ItemTransferencia(this._transferencia);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: Icon(Icons.monetization_on),
        title: Text(_transferencia.valor.toString()),
        subtitle: Text(_transferencia.numeroConta.toString()),
      ),
    );
  }
}

class Transferencia {
  final double valor;
  final int numeroConta;

  Transferencia(this.valor, this.numeroConta);

  @override
  String toString() {
    return 'Transferencia{valor:$valor, numeroConta:$numeroConta}';
  }
}
