import 'package:levelx_task/features/home/domain/enums/enums.dart';

class HomeState {
  const HomeState({required this.homeState, required this.selectedIndex});

  factory HomeState.initial() {
    return HomeState(homeState: ApiStatus.initialized, selectedIndex: 0);
  }

  final ApiStatus homeState;
  final int selectedIndex;

  HomeState copyWith({ApiStatus? homeState, int? selectedIndex}) {
    return HomeState(
      homeState: homeState ?? this.homeState,
      selectedIndex: selectedIndex ?? this.selectedIndex,
    );
  }
}
