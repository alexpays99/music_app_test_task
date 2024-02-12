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
        return switch (artistList?.artistListState) {
          ListState.initial => const SizedBox.shrink(),
          ListState.loading => const Center(
              child: CircularProgressIndicator(),
            ),
          ListState.loaded => ListView.builder(
              controller: _scrollController,
              itemCount: artistList?.value?.length,
              itemBuilder: (BuildContext context, int index) {
                return Artist(
                  artistList: artistList!,
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

// class ArtistList extends StatelessWidget {
//   const ArtistList({
//     super.key,
//   });

//   @override
//   Widget build(BuildContext context) {
//     di.getIt<ArtistCubit>().fetchArtists();
//     return BlocBuilder<ArtistCubit, ArtistState>(
//       builder: (context, state) {
//         final artistList = state.artistListStateModel;
//         return switch (artistList?.artistListState) {
//           ListState.initial => const SizedBox.shrink(),
//           ListState.loading => const Center(
//               child: CupertinoActivityIndicator(),
//             ),
//           ListState.loaded => ListView.builder(
//               itemCount: artistList?.value?.length,
//               itemBuilder: (BuildContext context, int index) {
//                 return Artist(
//                   artistList: artistList!,
//                   index: index,
//                 );
//               },
//             ),
//           ListState.error => Center(
//               child: Text(artistList?.message ?? ''),
//             ),
//           null => const SizedBox.shrink(),
//         };
//       },
//     );
//   }
// }
