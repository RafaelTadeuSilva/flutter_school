import 'package:flutter/material.dart';
import 'package:flutter_school/export.dart';
import 'package:flutter_school/src/shared/injector.dart';
import 'package:flutter_school/src/util/navigator/app_nav.dart';

class PatrimonioPage extends StatefulWidget {
  const PatrimonioPage({
    this.id,
    super.key,
  });
  final String? id;

  @override
  State<PatrimonioPage> createState() => _PatrimonioPageState();
}

class _PatrimonioPageState extends State<PatrimonioPage> {
  final control = injector.get<PatrimonioController>();
  final appNav = injector.get<AppNav>();

  final TextEditingController txtNumeroPatrimonio = TextEditingController();
  final TextEditingController txtDescricao = TextEditingController();

  @override
  void initState() {
    super.initState();
    buscaPatrimonio(widget.id);
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      child: Scaffold(
          appBar: AppBar(
            title: const Text('Patrimônio'),
          ),
          body: Column(
            children: [
              TextFormField(
                controller: txtNumeroPatrimonio,
                onChanged: control.numeroPatrimonio.set,
              ),
              TextFormField(
                controller: txtDescricao,
                onChanged: control.descricao.set,
              ),
              Center(
                  child: ElevatedButton(
                onPressed: () => appNav.pop('Teste'),
                child: Text('Voltar'),
              )),
            ],
          )),
    );
  }

  Future<void> buscaPatrimonio(String? id) async {
    if (id != null) {
      final patrimonio = await control.findOne(id);
      if (patrimonio != null) {
        txtDescricao.text = patrimonio.descricao;
        txtNumeroPatrimonio.text = patrimonio.numeroPatrimonio;
      }
    }
  }
}
