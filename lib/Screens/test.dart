// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:muslim/ViewModel/QuranCubit/quranCubit.dart';
// import 'package:muslim/ViewModel/QuranCubit/quranState.dart';
//
// class TestPage extends StatelessWidget {
//   const TestPage({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     PageController controller=PageController(initialPage: 1);
//     int page = 0;
//     int number = 0;
//     return BlocProvider(
//       create: (context) => QuranCubit()..getPageOfQuran(page: page + 1),
//       child: BlocBuilder<QuranCubit, QuranStates>(
//         builder: (context, state) {
//           return Scaffold(
//             appBar: AppBar(
//               backgroundColor: Colors.brown,
//               toolbarHeight: 40,
//               flexibleSpace: Stack(
//                 children: [
//                   Image.asset(
//                     'assets/images/backsurah.jpg',
//                     width: MediaQuery.of(context).size.width,
//                   ),
//                   Positioned(
//                     right: 2,
//                     left: 150,
//                     bottom: 10,
//                     top: 20,
//                     child: Text(
//                       '${QuranCubit.get(context).pageModel!.data!.ayahs![number].surah!.name}',
//                       style: const TextStyle(
//                           fontSize: 20,
//                           fontWeight: FontWeight.bold,
//                           color: Colors.black),
//                     ),
//                   )
//                 ],
//               ),
//             ),
//             body: Directionality(
//                 textDirection: TextDirection.rtl,
//                 child: PageView(
//                   scrollDirection: Axis.horizontal,
//                   controller: controller,
//                   children: [
//                     RichText(
//                         text: TextSpan(children: [
//                           for (int i = 0;
//                           i <
//                               QuranCubit.get(context)
//                                   .pageModel!
//                                   .data!
//                                   .ayahs!
//                                   .length;
//                           i++) ...{
//                             TextSpan(
//                               text:
//                               '${QuranCubit.get(context).pageModel?.data?.ayahs?[i].text}',
//                               style: const TextStyle(
//                                 fontWeight: FontWeight.bold,
//                                 color: Colors.black,
//                                 fontSize: 24,
//                               ),
//                             ),
//                             TextSpan(
//                               text:
//                               '《${QuranCubit.get(context).pageModel?.data?.ayahs?[i].number.toString()}》',
//                               style: const TextStyle(
//                                 fontWeight: FontWeight.bold,
//                                 color: Colors.black,
//                                 fontSize: 24,
//                               ),
//                             )
//                           }
//                         ])),
//                   ],
//                 )),
//           );
//         },
//       ),
//     );
//   }
// }
