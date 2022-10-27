import 'package:news_app/feature/domain/entitis/source_entiti.dart';

class SourceModel extends SourceEntiti {
  SourceModel({required super.id, required super.name});
  factory SourceModel.fromJson(Map<String, dynamic> json) => SourceModel(
        id: json['id'] ?? '',
        name: json['name'],
      );
}
