import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/constants.dart';
import 'package:news_app/feature/presentation/list_news_top_headlines/widgets/news_card.dart';

import '../controller/list_news_everythings_cubit.dart';
import '../controller/list_news_everythings_state.dart';

class TabEverythingsList extends StatefulWidget {
  const TabEverythingsList({Key? key}) : super(key: key);

  @override
  State<TabEverythingsList> createState() => _TabEverythingsListState();
}

class _TabEverythingsListState extends State<TabEverythingsList> {
  @override
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TabEverythingsCubit, TabEverythingsState>(
      builder: (context, state) {
        if (state is TabEverythingsEmptyState) {
          context
              .read<TabEverythingsCubit>()
              .fetchNews("v2/everything?q=Apple&apiKey=$apiKey");
        } else if (state is TabEverythingsErrorState) {
          return const Scaffold(
            body: Center(
              child: Text('Error!'),
            ),
          );
        } else if (state is TabEverythingsLoadedState) {
          return Scaffold(
            body: RefreshIndicator(
              color: Colors.blue,
              displacement: 20,
              onRefresh: () => context
                  .read<TabEverythingsCubit>()
                  .fetchNews("v2/everything?q=Apple&apiKey=$apiKey"),
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
