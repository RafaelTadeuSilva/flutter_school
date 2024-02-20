import 'package:flutter/material.dart';
import 'package:flutter_school/src/features/marca/controllers/marca_list_controller.dart';
import 'package:flutter_school/src/shared/injector.dart';
import 'package:flutter_school/src/util/navigator/app_nav.dart';
import 'package:signals/signals_flutter.dart';

class MarcaListPage extends StatefulWidget {
  const MarcaListPage({super.key});

  @override
  State<MarcaListPage> createState() => _MarcaListPageState();
}

class _MarcaListPageState extends State<MarcaListPage> {
  final appNav = injector.get<AppNav>();
  final control = injector.get<MarcaListController>();

  @override
  void initState() {
    super.initState();
    control.getMarcas();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Lista de Marcas'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          // final result = await appNav.push("/patrimonio/detail");
          // debugPrint(result);
        },
        child: const Icon(Icons.add),
      ),
      body: montaBody(),
    );
  }

  Widget montaBody() {
    return Watch((_) => control.isLoading.value
        ? const Center(child: CircularProgressIndicator())
        : ListView.builder(
            itemBuilder: itemBuilder,
            itemCount: control.listMarcas.value.length,
          ));
  }

  Widget? itemBuilder(BuildContext context, int index) {
    final item = control.listMarcas.value[index];

    return ListTile(
      onTap: () async {
        // await appNav.push("/patrimonio/detail", arguments: id);
      },
      title: Text(item.nome),
    );
  }
}
