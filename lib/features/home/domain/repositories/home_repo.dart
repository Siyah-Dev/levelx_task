import 'package:levelx_task/features/home/domain/entities/post_entities.dart';

abstract class HomeRepo {
  Future<List<PostEntity>?> fetchData();
}
