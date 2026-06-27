import 'package:hive_ce/hive.dart';
import '../../../domain/history/entities/history_item.dart';
import '../../../domain/history/repositories/history_repository.dart';
import '../models/history_model.dart';

class HistoryRepositoryImpl implements HistoryRepository {
  final Box<HistoryModel> box;

  HistoryRepositoryImpl(this.box);

  @override
  List<HistoryItem> getAll() {
    return box.values
        .map((e) => e.toEntity())
        .toList()
        .reversed
        .toList();
  }

  @override
  List<HistoryItem> getSaved() {
    return box.values
        .where((e) => e.isSaved)
        .map((e) => e.toEntity())
        .toList()
        .reversed
        .toList();
  }

  @override
  Future<void> saveItem(HistoryItem item) async {
    await box.put(item.id, HistoryModel.fromEntity(item));
  }

  @override
  Future<void> toggleSaved(String id) async {
    final item = box.get(id);
    if (item == null) return;

    item.isSaved = !item.isSaved;
    await item.save();
  }

  @override
  Future<void> deleteItem(String id) async {
    await box.delete(id);
  }
}