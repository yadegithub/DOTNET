import 'package:flextrip/app/modules/hotel%20booking/core/route/app_route_name.dart';
import 'package:flextrip/app/modules/hotel%20booking/feature/detail_destionation/presentation/detail_destination_screen.dart';
import 'package:flextrip/app/modules/hotel%20booking/feature/home/presentation/home_screen.dart';
import 'package:flutter/material.dart';


// class AppRoute {
//   static Route<dynamic>? generate(RouteSettings settings) {
//     switch (settings.name) {
//       // case AppRouteName.getStarted:
//       //   return MaterialPageRoute(
//       //     builder: (_) => const GetStartedScreen(),
//       //     settings: settings,
//       //   );

//       case AppRouteName.home:
//         return PageRouteBuilder(
//           settings: settings,
//           pageBuilder: (_, __, ___) => const HomeScreen(),
//           transitionDuration: const Duration(milliseconds: 400),
//           transitionsBuilder: (_, animation, __, child) {
//             return SlideTransition(
//               position: Tween<Offset>(
//                 begin: const Offset(1, 0),
//                 end: Offset.zero,
//               ).animate(animation),
//               child: child,
//             );
//           },
//         );

//       case AppRouteName.detailDestination:
//         return PageRouteBuilder(
//           settings: settings,
//           pageBuilder: (_, __, ___) => const DetailDestinationScreen(),
//           transitionDuration: const Duration(milliseconds: 400),
//           transitionsBuilder: (_, animation, __, child) {
//             return SlideTransition(
//               position: Tween<Offset>(
//                 begin: const Offset(1, 0),
//                 end: Offset.zero,
//               ).animate(animation),
//               child: child,
//             );
//           },
//         );
//     }

//     return null;
//   }
// }
