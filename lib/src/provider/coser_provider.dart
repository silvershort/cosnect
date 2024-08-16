import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

part 'coser_provider.g.dart';

@riverpod
class Coser extends _$Coser {
  @override
  Future<List<Map<String, dynamic>>> build() async {
    return fetchList();
  }

  Future<List<Map<String, dynamic>>> fetchList() async {
    final data = await Supabase.instance.client.from('countries').select();
    return data;
  }
}