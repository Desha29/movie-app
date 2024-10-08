import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../components/components.dart';
import '../../../cubit/movies_cubit/movie_cubit.dart';
import 'movie_row.dart';
import 'movies_slider.dart';

class HomeBody extends StatelessWidget {
  const HomeBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<MovieCubit, MovieState>(
      builder: (context, state) {
        if (state is MovieLoadingState) {
          return _HomeLoadingState();
        } else if (state is MovieFailedState) {
          return _HomeFailedState(state.message);
        } else if (state is MovieSuccessState) {
          return _HomeSuccessState(state.nowPlayingMovies, state.upComingMovies,
              state.topRatedMovies, state.popularMovies, state.trendingMovies);
        } else {
          return const ExceptionWidget(
              icon: Icons.error, message: "failed Home body state");
        }
      },
      listener: (BuildContext context, MovieState state) {},
    );
  }

  // ignore: non_constant_identifier_names
  Widget _HomeSuccessState(nowPlayingMovies, List upComingMovies,
      List topRatedMovies, List popularMovies, List trendingMovies) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: ListView(
        physics: const BouncingScrollPhysics(),
        addAutomaticKeepAlives: true,
        addRepaintBoundaries: true,
        addSemanticIndexes: true,
        children: [
          const Text(
            "Trending Movies" "🔥",
            style: TextStyle(
                color: Colors.white, fontSize: 22, fontWeight: FontWeight.w600),
          ),
          MovieSlider(
            trendingMovies: trendingMovies,
          ),
          MovieRow(title: "Upcoming", movies: upComingMovies),
          MovieRow(title: "Now Playing", movies: nowPlayingMovies),
          MovieRow(
            title: "Top Rated",
            movies: topRatedMovies,
          ),
          MovieRow(
            title: "Popular",
            movies: popularMovies,
          ),
        ],
      ),
    );
  }

  // ignore: non_constant_identifier_names
  Widget _HomeFailedState(String message) =>
      ExceptionWidget(icon: Icons.error, message: message);

  // ignore: non_constant_identifier_names
  Widget _HomeLoadingState() => const LoadingWidget();
}
