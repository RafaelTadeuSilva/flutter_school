import 'package:flutter/material.dart';
import 'package:flutter_school/src/shared/injector.dart';
import 'package:flutter_school/src/util/navigator/app_nav.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final appNav = injector.get<AppNav>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
      ),
      body: Column(children: [
        ElevatedButton(
            onPressed: () => appNav.push('/patrimonio'),
            child: Text("Patrimonios")),
        ElevatedButton(
            onPressed: () => appNav.push('/marca'), child: Text("Marcas")),
      ]),
    );
  }
}
