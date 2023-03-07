// import 'package:flutter/material.dart';
// import 'package:flutter_provider_examples/screens/favorite.dart';
//
// class HomePage extends StatelessWidget {
//   const HomePage({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     final words = nouns.take(50).toList();
//     final provider = FavoriteProvider.of(context);
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('English Words'),
//       ),
//       body: ListView.builder(
//         itemCount: words.length,
//         itemBuilder: (context, index) {
//           final word = words[index];
//           return ListTile(
//             title: Text(word),
//             trailing: IconButton(
//               onPressed: () {
//                 provider.toggleFavorite(word);
//               },
//               icon: provider.isExist(word)
//                   ? const Icon(Icons.favorite, color: Colors.red)
//                   : const Icon(Icons.favorite_border),
//             ),
//           );
//         },
//       ),
//
//     );
//   }
// }
