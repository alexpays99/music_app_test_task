import 'package:flutter/cupertino.dart';
import 'package:music_app_test_task/feature/home/presentation/cubit/artist_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:music_app_test_task/core/injector.dart' as di;
import 'package:music_app_test_task/feature/home/presentation/widgets/artist_widget.dart';

import '../../data/models/artist_list_state_model.dart';

class ArtistList extends StatefulWidget {
  const ArtistList({
    super.key,
  });

  @override
  State<ArtistList> createState() => _ArtistListState();
}

class _ArtistListState extends State<ArtistList> {
  late ArtistCubit cubit;

  @override
  void initState() {
    super.initState();
    cubit = di.getIt<ArtistCubit>()..fetchArtists();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ArtistCubit, ArtistState>(
      builder: (context, state) {
        final artistList = state.artistListStateModel;
        return switch (artistList?.artistListState) {
          ListState.initial => const SizedBox.shrink(),
          ListState.loading => const Center(
              child: CupertinoActivityIndicator(),
            ),
          ListState.loaded => ListView.builder(
              itemCount: artistList?.value?.length,
              itemBuilder: (BuildContext context, int index) {
                return Artist(
                  artistList: artistList,
                  index: index,
                );
              },
            ),
          ListState.error => Center(
              child: Text(artistList?.message ?? ''),
            ),
          null => const SizedBox.shrink(),
        };
      },
    );
  }
}
