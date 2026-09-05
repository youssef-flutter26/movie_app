import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_app/features/search/presentation/cubits/search_cubit/search_cubit_cubit.dart';
import 'package:movie_app/features/search/presentation/cubits/search_cubit/search_cubit_state.dart';
import 'package:movie_app/features/search/presentation/widgets/custom_empty_search_view.dart';
import 'package:movie_app/features/search/presentation/widgets/custom_search_text_field.dart';
import 'package:movie_app/features/search/presentation/widgets/search_by_actor.dart';
import 'package:movie_app/features/search/presentation/widgets/search_default_body.dart';
import 'package:movie_app/features/search/presentation/widgets/search_result_body.dart';

class SearchViewBody extends StatelessWidget {
  const SearchViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(16.r),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomSearchTextField(
            onChanged: (value) {
              if (value.trim().isNotEmpty) {
                context.read<SearchCubit>().searchMulti(query: value);
              } else {
                context.read<SearchCubit>().fetchSearchGenres();
              }
            },
            onSubmitted: (value) {
              if (value.trim().isNotEmpty) {
                context.read<SearchCubit>().searchMulti(query: value);
              }
            },
          ),
          SizedBox(height: 12.h),
          Expanded(
            child: BlocBuilder<SearchCubit, SearchState>(
              builder: (context, state) {
                if (state is SearchLoading) {
                  return const Center(child: CircularProgressIndicator());
                } else if (state is SearchMultiSuccess) {
                  if (state.movies.isEmpty && state.actors.isEmpty) {
                    return const CustomEmptySearchView();
                  } else if (state.actors.isNotEmpty) {
                    return SingleChildScrollView(
                      physics: const BouncingScrollPhysics(),
                      child: SearchByActor(
                        actors: state.actors,
                        movies: state.movies,
                      ),
                    );
                  } else {
                    return SearchResultBody(movies: state.movies);
                  }
                } else if (state is SearchFailure) {
                  return Center(
                    child: Text(
                      state.errMessage,
                      style: const TextStyle(color: Colors.white),
                    ),
                  );
                }

                return const SearchDefaultBody();
              },
            ),
          ),
        ],
      ),
    );
  }
}
