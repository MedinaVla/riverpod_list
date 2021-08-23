import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_list/src/constant/user_list.dart';

final searchProvider = StateProvider<String>((ref) {
  return '';
});
final namesProvider = StateProvider<List<String>>((ref) {
  final search = ref.watch(searchProvider).state;
  return users
      .where((element) => element.toLowerCase().contains(search))
      .toList();
});
