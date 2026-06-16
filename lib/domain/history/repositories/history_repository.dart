import '../entities/history_item.dart';

abstract class HistoryRepository {
  List<HistoryItem> getAll();
  List<HistoryItem> getSaved();




  Future<void> saveItem(HistoryItem item);
  Future<void> toggleSaved(String id);

}