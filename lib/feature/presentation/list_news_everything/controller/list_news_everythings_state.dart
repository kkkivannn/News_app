import 'package:equatable/equatable.dart';
import 'package:news_app/feature/domain/entitis/news_entiti.dart';

abstract class TabEverythingsState extends Equatable {
  @override
  List<Object?> get props => [];
}

class TabEverythingsEmptyState extends TabEverythingsState {
  @override
  List<Object?> get props => [];
}

class TabEverythingsLoadedState extends TabEverythingsState {
  final NewsEntiti newsEntiti;

  TabEverythingsLoadedState(this.newsEntiti);
  @override
  List<Object?> get props => [newsEntiti];
}

class TabEverythingsErrorState extends TabEverythingsState {
  final String message;

  TabEverythingsErrorState({required this.message});
  @override
  List<Object?> get props => [message];
}
