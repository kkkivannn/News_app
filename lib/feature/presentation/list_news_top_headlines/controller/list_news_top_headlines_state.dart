import 'package:equatable/equatable.dart';
import 'package:news_app/feature/domain/entitis/news_entiti.dart';

abstract class TabTopHeadlinesState extends Equatable {
  @override
  List<Object?> get props => [];
}

class TabTopHeadlinesEmptyState extends TabTopHeadlinesState {
  @override
  List<Object?> get props => [];
}

class TabTopHeadlinesLoadedState extends TabTopHeadlinesState {
  final NewsEntiti newsEntiti;

  TabTopHeadlinesLoadedState(this.newsEntiti);
  @override
  List<Object?> get props => [newsEntiti];
}

class TabTopHeadlinesErrorState extends TabTopHeadlinesState {
  final String message;

  TabTopHeadlinesErrorState({required this.message});
  @override
  List<Object?> get props => [message];
}
