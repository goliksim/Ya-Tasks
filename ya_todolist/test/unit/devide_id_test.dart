import 'package:flutter_test/flutter_test.dart';
import 'package:ya_todolist/feature/task/data/datasources/local_datasource_hive_impl.dart';
import 'package:ya_todolist/feature/task/data/repositories/local_storage_impl.dart';

void main() {
  group('Device tests', () {
    test('Unique Device Id test', () async {
      final locSetting = LocalDB();
      final loc = LocalStorageImpl(db: locSetting);

      final id1 = await loc.getId();
      final id2 = await loc.getId();

      expect(id1, isNotEmpty);
      expect(id2, isNotEmpty);
      expect(id1 == id2, isTrue);
    });
  });
}
