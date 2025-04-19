import 'package:levelx_task/features/home/domain/entities/post_entities.dart';
import 'package:levelx_task/features/home/domain/repositories/home_repo.dart';

class HomeUsecase {
  HomeUsecase(this.repository);
  final HomeRepo repository;

  Future<List<PostEntity>?> fetchData() async {
    return await repository.fetchData();
  }
}
