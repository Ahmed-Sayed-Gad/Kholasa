import 'package:hive_ce/hive.dart';
import '../../../domain/history/entities/history_item.dart';

part 'history_model.g.dart';

@HiveType(typeId: 0)
class HistoryModel extends HiveObject {
  @HiveField(0)
  String id;

  @HiveField(1)
  String title;

  @HiveField(2)
  String summary;

  @HiveField(3)
  DateTime createdAt;

  @HiveField(4)
  bool isSaved;

  @HiveField(5)
  String type;

  @HiveField(6)
  String language;

  HistoryModel({
    required this.id,
    required this.title,
    required this.summary,
    required this.createdAt,
    required this.isSaved,
    required this.type,
    required this.language,
  });

  /// 🔹 Model → Entity
  HistoryItem toEntity() {
    return HistoryItem(
      id: id,
      title: title,
      summary: summary,
      createdAt: createdAt,
      isSaved: isSaved,
      type: type,
      language: language,
    );
  }

  /// 🔹 Entity → Model
  factory HistoryModel.fromEntity(HistoryItem item) {
    return HistoryModel(
      id: item.id,
      title: item.title,
      summary: item.summary,
      createdAt: item.createdAt,
      isSaved: item.isSaved,
      type: item.type,
      language: item.language,
    );
  }
}