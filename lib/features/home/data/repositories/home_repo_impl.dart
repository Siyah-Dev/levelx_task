import 'package:dio/dio.dart';
import 'package:levelx_task/features/home/data/models/post_model.dart';
import 'package:levelx_task/features/home/domain/entities/post_entities.dart';
import 'package:levelx_task/features/home/domain/repositories/home_repo.dart';

class HomeRepoImpl extends HomeRepo {
  HomeRepoImpl(this.dio);

  final Dio dio;

  @override
  Future<List<PostEntity>?> fetchData() async {
    try {
      final res = await dio.get('posts');
      if (res.statusCode == 200) {
        final postList =
            (res.data as List).map((e) => PostModel.fromJson(e)).toList();
        return postList;
      } else {
        throw Exception('Failed to load data, please try again');
      }
    } catch (e) {
      rethrow;
    }
  }
}
