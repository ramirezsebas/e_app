part of 'bottom_navigation_cubit.dart';

class BottomNavigationState extends Equatable {
  const BottomNavigationState({
    this.index = 0,
  });

  final int index;

  @override
  List<Object> get props => [
        index,
      ];
}
