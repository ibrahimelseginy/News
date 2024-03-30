import 'package:flutter/material.dart';
import 'package:news/category/tabs/tab_item.dart';
import 'package:news/models/sources_response/source.dart';
import 'package:news/news/news_list.dart';

class SourcesTabs extends StatefulWidget {
  final List<Source> sources;

  const SourcesTabs(this.sources, {super.key});

  @override
  State<SourcesTabs> createState() => _SourcesTabsState();
}

class _SourcesTabsState extends State<SourcesTabs> {
  int selecetdIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        DefaultTabController(
          length: widget.sources.length,
          child: TabBar(
            isScrollable: true,
            dividerColor: Colors.transparent,
            indicatorColor: Colors.transparent,
            onTap: (index) => setState(
              () {
                selecetdIndex = index;
              },
            ),
            tabs: widget.sources
                .map(
                  (source) => TabItem(
                    source: source,
                    isSelected: selecetdIndex == widget.sources.indexOf(source),
                  ),
                )
                .toList(),
          ),
        ),
        Expanded(
          child: NewsList(
            sourceId: widget.sources[selecetdIndex].id ?? '',
          ),
        ),
      ],
    );
  }
}
