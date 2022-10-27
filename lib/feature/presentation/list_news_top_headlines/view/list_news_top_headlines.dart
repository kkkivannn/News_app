import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/constants.dart';

import '../controller/list_news_top_headlines_cubit.dart';
import '../controller/list_news_top_headlines_state.dart';
import '../widgets/news_card.dart';

class TabTopHeadlinesList extends StatelessWidget {
  const TabTopHeadlinesList({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TabTopHeadlinesCubit, TabTopHeadlinesState>(
      builder: (context, state) {
        if (state is TabTopHeadlinesEmptyState) {
          context
              .read<TabTopHeadlinesCubit>()
              .fetchNews("v2/top-headlines?q=Apple&apiKey=$apiKey");
        } else if (state is TabTopHeadlinesErrorState) {
          return const Scaffold(
            body: Center(
              child: Text('Error!'),
            ),
          );
        } else if (state is TabTopHeadlinesLoadedState) {
          return Scaffold(
            body: RefreshIndicator(
              color: Colors.blue,
              displacement: 20,
              onRefresh: () => context
                  .read<TabTopHeadlinesCubit>()
                  .fetchNews("v2/top-headlines?q=Apple&apiKey=$apiKey"),
              child: ListView.builder(
                scrollDirection: Axis.vertical,
                primary: false,
                itemCount: state.newsEntiti.articles.length,
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () => Navigator.of(context).pushNamed(
                      '/NewsViewPage',
                      arguments: {
                        'title': state.newsEntiti.articles[index].title,
                        'content': state.newsEntiti.articles[index].content,
                        'url': state.newsEntiti.articles[index].url,
                        'isSaved': true,
                      },
                    ),
                    child: NewsCard(
                      title: state.newsEntiti.articles[index].title,
                    ),
                  );
                },
              ),
            ),
          );
        }
        return const SafeArea(
          child: Scaffold(
            body: Center(
              child: CircularProgressIndicator(
                color: Colors.blue,
              ),
            ),
          ),
        );
      },
    );
  }
}
