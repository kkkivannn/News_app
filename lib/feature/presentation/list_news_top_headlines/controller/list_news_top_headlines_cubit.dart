import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/constants.dart';
import 'package:news_app/feature/domain/usecases/get_news.dart';

import 'list_news_top_headlines_state.dart';

class TabTopHeadlinesCubit extends Cubit<TabTopHeadlinesState> {
  final GetNews getNews;

  TabTopHeadlinesCubit({required this.getNews})
      : super(TabTopHeadlinesEmptyState());

  Future<void> fetchNews(String endpoint) async {
    try {
      emit(TabTopHeadlinesEmptyState());
      final loadedNewsOrFailure =
          await getNews.call(EndpointParams(endpoint: endpoint));
      loadedNewsOrFailure.fold(
        (error) =>
            emit(TabTopHeadlinesErrorState(message: SERVER_FAILURE_MESSAGE)),
        (loadedData) => emit(TabTopHeadlinesLoadedState(loadedData)),
      );
    } catch (_) {
      emit(
        TabTopHeadlinesErrorState(message: SERVER_FAILURE_MESSAGE),
      );
    }
  }
}
