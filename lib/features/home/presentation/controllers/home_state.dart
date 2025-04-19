import 'package:levelx_task/features/home/domain/entities/post_entities.dart';
import 'package:levelx_task/features/home/domain/enums/enums.dart';

class HomeState {
  const HomeState({
    required this.homeState,
    required this.selectedIndex,
    required this.postList,
    required this.categories,
  });

  factory HomeState.initial() {
    return HomeState(
      homeState: ApiStatus.initialized,
      selectedIndex: 0,
      postList: [],
      categories: [
        'Trending',
        'Relationship',
        'Self Care',
        'Category 4',
        'Category 5',
      ],
    );
  }

  final ApiStatus homeState;
  final int selectedIndex;
  final List<PostEntity> postList;
  final List<String> categories;

  HomeState copyWith({
    ApiStatus? homeState,
    int? selectedIndex,
    List<PostEntity>? postList,
    List<String>? categories,
  }) {
    return HomeState(
      homeState: homeState ?? this.homeState,
      selectedIndex: selectedIndex ?? this.selectedIndex,
      postList: postList ?? this.postList,
      categories: categories ?? this.categories,
    );
  }
}
