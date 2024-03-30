import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:news/app_theme.dart';
import 'package:news/models/news_response/news.dart';
import 'package:news/widgets/loading_indicator.dart';
import 'package:timeago/timeago.dart' as timeago;

class NewsItem extends StatelessWidget {
  final News news;

  const NewsItem(this.news, {super.key});

  @override
  Widget build(BuildContext context) {
    final titleSmall = Theme.of(context).textTheme.titleSmall;
    return Container(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(4),
            child: CachedNetworkImage(
              imageUrl: news.urlToImage ?? '',
              errorWidget: (_, __, ___) => const Center(
                child: Icon(
                  Icons.error_outline_outlined,
                  size: 50,
                ),
              ),
              height: MediaQuery.of(context).size.height * 0.25,
              width: double.infinity,
              fit: BoxFit.cover,
              placeholder: (_, __) => const LoadingIndicator(),
            ),
          ),
          Text(
            news.source?.name ?? '',
            style: Theme.of(context).textTheme.titleLarge,
          ),
          const SizedBox(
            height: 4,
          ),
          Text(
            news.title ?? '',
            style: titleSmall?.copyWith(
              color: AppTheme.navyColor2,
            ),
          ),
          const SizedBox(
            height: 4,
          ),
          Align(
            alignment: AlignmentDirectional.centerEnd,
            child: Text(
              timeago.format(
                news.publishedAt!,
              ),
              style: titleSmall?.copyWith(
                color: const Color(0xffA3A3A3),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
