import 'package:flutter/material.dart';

import 'artist_widget.dart';

class ArtistList extends StatelessWidget {
  const ArtistList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    // final bloc = di.getIt<IngredientsListBloc>();
    final style = Theme.of(context);

    return ListView.builder(
      itemCount: 10,
      itemBuilder: (context, index) {
        return const ArtistWidget();
      },
    );
  }
}
