import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:levelx_task/core/di/di.dart';
import 'package:levelx_task/core/errors/error_mapper.dart';
import 'package:levelx_task/core/utils/app_utils.dart';
import 'package:levelx_task/features/home/domain/enums/enums.dart';
import 'package:levelx_task/features/home/domain/usecases/home_usecase.dart';
import 'package:levelx_task/features/home/presentation/controllers/home_state.dart';

class HomeController extends StateNotifier<HomeState> {
  HomeController(this._homeUsecase) : super(HomeState.initial());
  final HomeUsecase _homeUsecase;

  Future<void> fetchData(BuildContext context) async {
    state = state.copyWith(homeState: ApiStatus.loading);
    try {
      final res = await _homeUsecase.fetchData();
      if (res != null) {
        state = state.copyWith(postList: res, homeState: ApiStatus.loaded);
      } else {
        if (context.mounted) {
          _handleError(
            context,
            Exception('No data available, please try again'),
          );
        }
      }
    } catch (e) {
      if (context.mounted) _handleError(context, e);
    }
  }

  void _handleError(BuildContext context, Object? error) {
    final message = ErrorMapper.getErrorMessage(error ?? '');
    AppUtils.showSnackbar(context, message, Colors.red);
    state = state.copyWith(homeState: ApiStatus.failed);
  }
}

final homeController = StateNotifierProvider<HomeController, HomeState>((ref) {
  final homeUsecase = ref.watch(homeUseCaseProvider);
  return HomeController(homeUsecase);
});
