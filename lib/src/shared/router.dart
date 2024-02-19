// import 'package:flutter_school/src/features/home/home_page.dart';
// import 'package:flutter_school/src/features/patrimonio/pages/patrimonio_list_page.dart';
// import 'package:flutter_school/src/features/patrimonio/pages/patrimonio_page.dart';
// import 'package:go_router/go_router.dart';

// // GoRouter configuration
// final router = GoRouter(
//   routes: [
//     GoRoute(
//       path: '/',
//       builder: (context, state) => HomePage(),
//       routes: [
//         GoRoute(
//           path: 'patrimonio',
//           builder: (context, state) => PatrimonioListPage(),
//           routes: [
//             GoRoute(
//               path: ':id',
//               builder: (context, state) =>
//                   PatrimonioPage(id: state.pathParameters['id']),
//             ),
//             GoRoute(
//               path: 'novo',
//               builder: (context, state) => PatrimonioPage(),
//               // onExit: (BuildContext context) async {
//               //   final bool? confirmed = await showDialog<bool>(
//               //     context: context,
//               //     builder: (_) {
//               //       return AlertDialog(
//               //         content: const Text('Are you sure to leave this page?'),
//               //         actions: <Widget>[
//               //           TextButton(
//               //             onPressed: () => Navigator.of(context).pop(false),
//               //             child: const Text('Cancel'),
//               //           ),
//               //           TextButton(
//               //             onPressed: () => Navigator.of(context).pop(true),
//               //             child: const Text('Confirm'),
//               //           ),
//               //         ],
//               //       );
//               //     },
//               //   );
//               //   return confirmed ?? false;
//               // },
//             ),
//           ],
//         ),
//       ],
//     ),
//   ],
// );
