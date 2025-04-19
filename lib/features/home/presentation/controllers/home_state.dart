import 'package:levelx_task/features/home/domain/entities/post_entities.dart';
import 'package:levelx_task/features/home/domain/enums/enums.dart';

class HomeState {
  const HomeState({
    required this.homeState,
    required this.selectedIndex,
    required this.postList,
  });

  factory HomeState.initial() {
    return HomeState(
      homeState: ApiStatus.initialized,
      selectedIndex: 0,
      postList: [],
    );
  }

  final ApiStatus homeState;
  final int selectedIndex;
  final List<PostEntity> postList;

  HomeState copyWith({
    ApiStatus? homeState,
    int? selectedIndex,
    List<PostEntity>? postList,
  }) {
    return HomeState(
      homeState: homeState ?? this.homeState,
      selectedIndex: selectedIndex ?? this.selectedIndex,
      postList: postList ?? this.postList,
    );
  }
}
