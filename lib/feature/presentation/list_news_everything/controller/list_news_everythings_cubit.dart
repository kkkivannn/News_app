import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/constants.dart';
import 'package:news_app/feature/domain/usecases/get_news.dart';

import 'list_news_everythings_state.dart';

class TabEverythingsCubit extends Cubit<TabEverythingsState> {
  final GetNews getNews;

  TabEverythingsCubit({required this.getNews})
      : super(TabEverythingsEmptyState());

  Future<void> fetchNews(String endpoint) async {
    try {
      emit(TabEverythingsEmptyState());
      final loadedNewsOrFailure =
          await getNews.call(EndpointParams(endpoint: endpoint));
      loadedNewsOrFailure.fold(
        (error) =>
            emit(TabEverythingsErrorState(message: SERVER_FAILURE_MESSAGE)),
        (loadedData) => emit(TabEverythingsLoadedState(loadedData)),
      );
    } catch (_) {
      emit(
        TabEverythingsErrorState(message: SERVER_FAILURE_MESSAGE),
      );
    }
  }
}
