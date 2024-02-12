import 'package:flutter/material.dart';
import 'package:music_app_test_task/feature/home/presentation/cubit/artist_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:music_app_test_task/core/injector.dart' as di;
import 'package:music_app_test_task/feature/home/presentation/widgets/artist_widget.dart';

import '../../data/models/artist_list_state_model.dart';

class ArtistList extends StatefulWidget {
  const ArtistList({super.key});

  @override
  _ArtistListState createState() => _ArtistListState();
}

class _ArtistListState extends State<ArtistList> {
  late ScrollController _scrollController;
  late ArtistCubit _artistCubit;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
    _artistCubit = di.getIt<ArtistCubit>();
    _artistCubit.fetchArtists();
    _scrollController.addListener(_onScroll);
  }

  void _onScroll() {
    if (_scrollController.position.pixels ==
        _scrollController.position.maxScrollExtent) {
      _artistCubit.fetchArtists();
    }
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ArtistCubit, ArtistState>(
      builder: (context, state) {
        final artistList = state.artistListStateModel;
        final newArtists = _artistCubit.newArtists;
        switch (artistList?.artistListState) {
          case ListState.initial:
            return const SizedBox.shrink();
          case ListState.loading:
            return newArtists == [] || newArtists.isEmpty
                ? const Center(child: CircularProgressIndicator())
                : ListView.builder(
                    controller: _scrollController,
                    itemCount: artistList?.value?.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Artist(
                        artistList: artistList!,
                        index: index,
                      );
                    },
                  );
          case ListState.loaded:
            return ListView.builder(
              controller: _scrollController,
              itemCount: artistList?.value?.length,
              itemBuilder: (BuildContext context, int index) {
                return Artist(
                  artistList: artistList!,
                  index: index,
                );
              },
            );
          case ListState.error:
            return Center(
              child: Text(artistList?.message ?? ''),
            );
          default:
            return const SizedBox.shrink();
        }
      },
    );
  }
}
