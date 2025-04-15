import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news/sources/view/widgets/sources_tabs.dart';
import 'package:news/sources/view_model/sources_state.dart';
import 'package:news/sources/view_model/sources_view_model.dart';
import 'package:news/shared/widgets/error_indicator.dart';
import 'package:news/shared/widgets/loading_indicator.dart';

class CategoryDetails extends StatefulWidget {
  final String categoryId;

  const CategoryDetails(this.categoryId, {super.key});

  @override
  State<CategoryDetails> createState() => _CategoryDetailsState();
}

class _CategoryDetailsState extends State<CategoryDetails> {
  final viewModel = SourcesViewModel();
  @override
  void initState() {
    super.initState();
    viewModel.getSources(widget.categoryId);
  }

  @override
  Widget build(BuildContext context) {
    // final viewmodel = BlocProvider.of<SourcesViewModel>(context);
    return BlocProvider(
      create: (_) => viewModel,
      child: BlocBuilder<SourcesViewModel, SourcesState>(
        builder: (context, state) {
          if (state is GetSourcesLoading) {
            return const LoadingIndicator();
          } else if (State is GetSourcesError) {
            return ErrorIndicator(state.message);
          } else if (State is GetSourcesSuccess) {
            return SourcesTabs(state.sources);
          } else {
            return const SizedBox();
          }
        },
      ),
    );
  }
}

        /* 
      Consumer<SourcesViewModel>(
        builder: (_, viewModel, __) {
          if (viewModel.isLoading) {
            return const LoadingIndicator();
          } else if (viewModel.errorMessage != null) {
            return ErrorIndicator(viewModel.errorMessage!);
          }
          return SourcesTabs(
            viewModel.sources.cast<Source>(),
          );
        },
      ),*/


/*
import 'package:flutter/material.dart';
import 'package:news/sources/data/models/sources_response/source.dart';
import 'package:news/sources/view/widgets/sources_tabs.dart';
import 'package:news/sources/view_model/sources_view_model.dart';
import 'package:news/shared/widgets/error_indicator.dart';
import 'package:news/shared/widgets/loading_indicator.dart';
import 'package:provider/provider.dart';

class CategoryDetails extends StatefulWidget {
  final String categoryId;

  const CategoryDetails(this.categoryId, {super.key});

  @override
  State<CategoryDetails> createState() => _CategoryDetailsState();
}

class _CategoryDetailsState extends State<CategoryDetails> {
  final viewModel = SourcesViewModel();

  @override
  void initState() {
    super.initState();
    viewModel.getSources(widget.categoryId);
  }

  @override
  Widget build(BuildContext context) {
    // use Consumer
    return ChangeNotifierProvider(
      create: (_) => viewModel,
      child: Consumer<SourcesViewModel>(
        builder: (_, viewModel, __) {
          if (viewModel.isLoading) {
            return const LoadingIndicator();
          } else if (viewModel.errorMessage != null) {
            return ErrorIndicator(viewModel.errorMessage!);
          }
          return SourcesTabs(
            viewModel.sources.cast<Source>(),
          );
        },
      ),
    );
  }
}*/
    /*
   
    ChangeNotifierProvider(
      create: (_) => viewModel,
      child: Builder(
        builder: (_) {
          if (viewModel.isLoading) {
            return const LoadingIndicator();
          } else if (viewModel.errorMessage != null) {
            return const ErrorIndicator();
          }
          return SourcesTabs(viewModel.sources.cast<Source>());
        },
      ),
    );
    */

    /* 
    // state management بديل لل 
    return FutureBuilder(
      future: APIService.getSources(categoryId),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: LoadingIndicator(),
          );
        } else if (snapshot.hasError || snapshot.data?.status != 'ok') {
          return const ErrorIndicator();
        }
    final sources = snapshot.data?.sources ?? [];
    return SourcesTabs(sources);
      },
    ); }
}
    */
 
