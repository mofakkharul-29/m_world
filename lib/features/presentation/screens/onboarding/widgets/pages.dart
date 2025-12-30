import 'package:flutter_riverpod/flutter_riverpod.dart';

final pageProvider = Provider<List<Map<String, dynamic>>>((
  ref,
) {
  return [
    {
      'idx': 0,
      'images': 'assets/images/ob.jpg',
      'des':
          'Make your life smoother, tension free make circle design your own world by yourself as you like to do. Lorem Epsum world organization tension free make circle design your own world by yourself!',
    },
    {
      'idx': 1,
      'images': 'assets/images/ob.jpg',
      'des':
          'Make your life smoother, tension free make circle design your own world by yourself as you like to do. Lorem Epsum world organization tension free make circle design your own world by yourself!',
    },
    {
      'idx': 2,
      'images': 'assets/images/ob.jpg',
      'des':
          'Make your life smoother, tension free make circle design your own world by yourself as you like to do. Lorem Epsum world organization tension free make circle design your own world by yourself!',
    },
  ];
});
