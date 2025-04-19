import 'package:levelx_task/features/home/domain/entities/post_entities.dart';

class PostModel extends PostEntity {
  final int userId;

  PostModel({
    required this.userId,
    required super.id,
    required super.title,
    required super.body,
  });

  factory PostModel.fromJson(Map<String, dynamic> json) {
    return PostModel(
      userId: json['userId'],
      id: json['id'],
      title: json['title'],
      body: json['body'],
    );
  }
}
