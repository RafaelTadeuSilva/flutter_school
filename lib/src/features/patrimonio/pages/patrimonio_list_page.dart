import 'package:flutter/material.dart';
import 'package:flutter_school/src/features/patrimonio/controllers/patrimonio_list_controller.dart';
import 'package:flutter_school/src/shared/injector.dart';
import 'package:flutter_school/src/util/navigator/app_nav.dart';
import 'package:signals/signals_flutter.dart';

import '../../../models/patrimonio_model.dart';

class PatrimonioListPage extends StatefulWidget {
  const PatrimonioListPage({super.key});

  @override
  State<PatrimonioListPage> createState() => _PatrimonioListPageState();
}

class _PatrimonioListPageState extends State<PatrimonioListPage> {
  final control = injector.get<PatrimonioListController>();
  final appNav = injector.get<AppNav>();

  @override
  void initState() {
    super.initState();
    control.getAllPatrimonio();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Lista de Patrimônios'),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () async {
            final result = await appNav.push("/patrimonio/detail");
            debugPrint(result);
          },
          child: const Icon(Icons.add),
        ),
        body: Watch(
          (_) => ListView.builder(
            itemBuilder: itemBuilder,
            itemCount: control.listPatrimonio.value.length,
          ),
        ));
  }

  Widget? itemBuilder(BuildContext context, int index) {
    final Patrimonio(:id, :descricao, :numeroPatrimonio) =
        control.listPatrimonio.value[index];
    return ListTile(
      onTap: () async {
        await appNav.push("/patrimonio/detail", arguments: id);
      },
      title: Text(numeroPatrimonio),
      subtitle: Text(descricao),
    );
  }
}
