import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:levelx_task/features/home/data/repositories/home_repo_impl.dart';
import 'package:levelx_task/features/home/domain/repositories/home_repo.dart';
import 'package:levelx_task/features/home/domain/usecases/home_usecase.dart';

final dioProvider = Provider<Dio>((ref) {
  return Dio(
    BaseOptions(
      baseUrl: 'https://jsonplaceholder.typicode.com/',
      connectTimeout: Duration(seconds: 20),
      receiveTimeout: Duration(seconds: 20),
    ),
  );
});

final homeProvider = Provider<HomeRepo>((ref) {
  final dio = ref.watch(dioProvider);
  return HomeRepoImpl(dio);
});

final homeUseCaseProvider = Provider<HomeUsecase>((ref) {
  final repo = ref.watch(homeProvider);
  return HomeUsecase(repo);
});
