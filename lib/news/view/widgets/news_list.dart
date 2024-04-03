import 'package:flutter/material.dart';
import 'package:news/news/view/widgets/news_item.dart';
import 'package:news/news/view_model/news_view_model.dart';
import 'package:news/shared/widgets/error_indicator.dart';
import 'package:news/shared/widgets/loading_indicator.dart';
import 'package:provider/provider.dart';

class NewsList extends StatefulWidget {
  final String sourceId;

  const NewsList({
    required this.sourceId,
    super.key,
  });

  @override
  State<NewsList> createState() => _NewsListState();
}

class _NewsListState extends State<NewsList> {
  final viewModel = NewsViewModel();

  @override
  @override
  Widget build(BuildContext context) {
    viewModel.getNews(widget.sourceId);
    return ChangeNotifierProvider(
      create: (context) => viewModel,
      child: Consumer(
        builder: (_, value, __) {
          if (viewModel.isLoading) {
            return const Center(
              child: LoadingIndicator(),
            );
          } else if (viewModel.errorMessage != null) {
            return ErrorIndicator(viewModel.errorMessage!);
          }
          final newsList = viewModel.newsList;
          return ListView.builder(
            itemBuilder: (_, int index) => NewsItem(newsList[index]),
            itemCount: newsList.length,
          );
        },
      ),
    );
  }
}
      
    /*
       FutureBuilder(
      future: APIService.getNews(sourceId),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: LoadingIndicator(),
          );
        } else if (snapshot.hasError || snapshot.data?.status != 'ok') {
          return const ErrorIndicator();
        }
        final newsList = snapshot.data?.news ?? [];
        return ListView.builder(
          itemBuilder: (_, int index) => NewsItem(newsList[index]),
          itemCount: newsList.length,
        );
      },
    );*/

